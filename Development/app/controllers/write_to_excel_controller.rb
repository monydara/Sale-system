class WriteToExcelController < ApplicationController

	def index
	
		# Open the previously created Workbook
		# open_book = Spreadsheet.open('Daily Lead Activity Report.xls')
	
		open_book = Spreadsheet::Workbook.new
 		open_book.create_worksheet :name => 'S'
 		sheet = open_book.worksheet(0) 
 	
 		
 		merchColumn=13
 		writeHeaderFile(sheet, 'Monthly Sale Report by Sale Person',merchColumn)

 		d = Date.new().strftime('%Y-%b-%d')
 		startRow = 1
 		startCol = 11
 		merchColumn = 2
 		format = { :horizontal_align => :right , :vertical_align => :center }
 		writeSubHeader( sheet, "Printed Date: #{d}", startRow, startCol, merchColumn,format)
		
		startRow=2
		columns =[ 'Location',20,'Sale Man',20,'Customer/Organization',25,'Contact Name',25,
			'Contact Number',20,'Category',15,'Product Name',30,'Quantities','Orginal Rate',13,
			'Discount',	'Sale Amount',13,	'Paid Amount',15,'Unpaid Amount',15]
		
		
 		writeHeadeColumn(sheet,columns,startRow)

 		columnsIndex=['location',
					'sale_man',
					'company',
					'contact_name',
					'contact_number',
					'category',
					'product_name',
					'qty+',
					'original_rate$+',
					'discount$+',
					'sale_amount$+',
					'paid_amount$+',
					'unpaid_amount$+']
 		@data = Lead.find_by_sql("select 
									    t.territory_name 'location',
									    e.employee_name 'sale_man',
									    c.company 'company',
									    ct.Name 'contact_name',
									    ct.Phone 'contact_number',
									    ctgr.Name 'category',
									    group_concat(soi.item_name) 'product_name',
									    sum(soi.qty) 'qty',
									    sum(soi.export_amount) 'original_rate',
									    sum(soi.discount_amount) 'discount',
									    so.rounded_total_export 'sale_amount',
									    so.paid_amount 'paid_amount',
									    so.unpaid_amount 'unpaid_amount'
									from
									    sale_orders so
									        inner join
									    sale_order_items soi ON soi.sale_order_id = so.id
									        inner join
									    customers c ON c.id = so.customer_id
									        left join
									    territories t ON t.id = c.territory_id
									        left join
									    contacts ct ON ct.supplier_customer_id = c.id
									        inner join
									    employees e ON e.id = so.employee_id
									        inner join
									    products p ON p.id = soi.product_id
									        inner join
									    categories ctgr ON ctgr.id = p.category_id
									where
    									so.status <> 'Draft'
									group by so.id
									order by 1 , 2
									;
");
		startRow =3
		mergeColumn=['location']

		
		startRow =writeDetail(sheet,columnsIndex,@data,startRow,mergeColumn)

		# writeSubHeader( sheet, "Grand Total", startRow, 1, 6,format)
		# writeSubHeader( sheet, "=SUM(I4:I#{startRow})", startRow, 8, 0,format)


	

		#write file to
		open_book.write('tes1t.xls')
	

	render :json =>{ :data => @data.size}
				
	end

	

	def writeSubHeader(sheet,text,row,col,merchColumn,format)

		
		
		if merchColumn >0
			sheet.merge_cells( row, col, row, col+merchColumn)
		end

		sheet[row,col]=text
		format =getFormat(format)
		i=1
		while i <=  col+merchColumn
			sheet.row(row).set_format(i,format)
				i +=1 
		end

		sheet.row(row).height = 20

	end
=begin
	how to set value to variable
	columnsIndex =[ 'a','b','c' ,'d']
	mergeColumn =['a','d']

=end

	def writeDetail(sheet,columnsIndexs,data,startRow,mergeColumn)
		columnsIndex = Array.new()
		summaryColumns = Hash.new
		valueSummaries = Hash.new
		# filter column wich is sumarry and wich only format dollar
		columnsIndexs.each do |index|
			if index.include? "$"
				tmp_string = String.new(index)

				if index.include? "+"
					  tmp_string.sub!('$', '')	
					
					columnsIndex <<  tmp_string.sub!('+', '')		
					summaryColumns[tmp_string]= tmp_string.sub!('+', '')	
				
				else
					columnsIndex <<  tmp_string.sub!('$', '')	

				end

			elsif index.include? "+"
				
				tmp_string = String.new(index)
				columnsIndex <<  tmp_string.sub!('+', '')		
				summaryColumns[tmp_string]= tmp_string.sub!('+', '')	
		

			else

			
				columnsIndex << index
			end
			
		end

		format = Spreadsheet::Format.new :border=> :thin , :border_color => :xls_color_8 , :vertical_align => :center 
		formatCurrency = Spreadsheet::Format.new :border=> :thin , :border_color => :xls_color_8 , :vertical_align => :center, :number_format => '$#,###.00_);[Red]($#,###.00)'  
		i=0
		# loop data detail
		data.each do |d|		
			
			i = i+1;	
			indexColumnFormat=1
			s = Array.new()
			s << ''
			# LOOP TO GET DATA FROM COLUMN INDEX
			columnsIndex.each do |index|
				s << d[index]
			end


			summaryColumns.each do |index,value|


				if valueSummaries[index].nil?
					valueSummaries[index] = 0
				end
				if d[index].nil? 
						d[index] =0
				end

				valueSummaries[index] = d[index] + valueSummaries[index]
				
			end

			# WRITE DATA TO EXCEL
			
			sheet.insert_row(startRow+i-1, s)
			# SET FORMAT AFTER INSERT ROW

			columnsIndexs.each do |indexCol|
				# set format money

				if indexCol.include? "$"
					sheet.row(startRow+i-1).set_format(indexColumnFormat, formatCurrency)
				else
				
					sheet.row(startRow+i-1).set_format(indexColumnFormat, format)
				end
				

				indexColumnFormat=indexColumnFormat+1
			end

			sheet.row(startRow+i-1).height = 15
		end	
		# merge row in excel
		if mergeColumn.kind_of?(Array) && mergeColumn.length >0
			mergeRow(sheet,startRow,columnsIndex,data,mergeColumn)
		end

		if !valueSummaries.nil?
			sumarryFooter(sheet,columnsIndex,columnsIndexs,valueSummaries,(startRow+i) )

		end

		return startRow+i 

	end

	def sumarryFooter(sheet,columnsIndex,columnsIndexs,valueSummaries,startRow)
		firsCol = 0 
		startFormat =0 
	 	format ={:weight => :bold, :border =>:thin,:border_color => :xls_color_8, :color => :black ,:pattern_fg_color => :xls_color_39, :pattern => 1, :vertical_align => :center , :horizontal_align  => :center}
	 	
		formatCurrency= {:weight => :bold, :border =>:thin,:border_color => :xls_color_8, :color => :black ,:pattern_fg_color => :xls_color_39, :number_format => '$#,###.00_);[Red]($#,###.00)', :pattern => 1, :vertical_align => :center}
		valueSummaries.each do |index,val|
			hash = Hash[columnsIndex.map.with_index.to_a]    # => {"a"=>0, "b"=>1, "c"=>2}			

			if firsCol == 0 

				firsCol = hash[index]+1 # => 1
		 		 startFormat= hash[index]+1
				writeSubHeader(sheet,"Grand Total:",startRow,1,firsCol-2,format)

			else
				
					firsCol = hash[index]+1 # => 1

			end



			sheet[startRow, firsCol] = valueSummaries[index]

		end

		columnsIndexs.each do |indexCol|
					# set format money
					hash = Hash[columnsIndexs.map.with_index.to_a] 
					puts "#{indexCol} === column #{hash[indexCol]}"

					if indexCol.include? "$"
						# puts "format on column = #{startFormat}"
						sheet.row(startRow).set_format(hash[indexCol]+1, getFormat(formatCurrency))
					else
							# puts "format on column no money = #{startFormat}"
						sheet.row(startRow).set_format(hash[indexCol]+1, getFormat(format))
					end
				end
		
	end

	def mergeRow(sheet,startRow,columnsIndex,data,mergeColumn)
		
		lastCompareString=Hash.new
		lastRow=Hash.new
		lastRowindex=Hash.new
		count = 0
		data << {:a => 'a'}


		data.each do |d|	#loop all data to compare

			mergeColumn.each do |index,val| # loop seek for index need only compare
	

				if count == 0  # get start first row
					lastRowindex[index] = startRow					
					lastRowindex["#{index}count"] = 0
				end
				a=lastRowindex["#{index}count"]
			

				if lastCompareString[index] != d[index] && lastRowindex["#{index}count"]>0 #start merge and reset count
					# get col index 
					
					hash = Hash[columnsIndex.map.with_index.to_a]    # => {"a"=>0, "b"=>1, "c"=>2}
					col = hash[index]+1 # => 1
					
					sheet.merge_cells(lastRowindex[index], col, startRow+count-1, col)

					 format ={ :border =>:thin , :vertical_align => :center}
					 sheet.row(lastRowindex[index]).set_format(col, getFormat( format))
					 # lastRowindex[index] = lastRowindex[index] +1
					 
					 lastRowindex["#{index}count"] =0					 
					 lastCompareString[index]  =d[index]
					 lastRowindex[index] = startRow+count	


				elsif lastCompareString[index] == d[index]  

					lastRowindex["#{index}count"] = lastRowindex["#{index}count"]+1
					

				else #compare not match and have only one row
					
					lastRowindex[index] = startRow +count
					lastRowindex["#{index}count"] = 0
				end

				lastCompareString[index]= d[index]


				
			end
		
			count = count +1	

		end

	end
	def getFormat(format)
		format = Spreadsheet::Format.new(format)
		return format
	end

	def writeHeadeColumn(sheet,columnText,startRow)

		format ={:weight => :bold, :border =>:thin,:border_color => :xls_color_8, :color => :black ,:pattern_fg_color => :xls_color_14, :pattern => 1,:horizontal_align => :centre ,:vertical_align => :center}
		col=1
			format = Spreadsheet::Format.new(format)

		columnText.each{|i|
			if i.is_a? Numeric
				sheet.column(col-1).width = i
			else
				sheet[startRow,col]=i
				sheet.row(startRow).height = 15
				sheet.row(startRow).set_format(col, format)
				col= col+1;
			end


		}

	end

	def writeHeaderFile(sheet , text ,merchColumn)
		
		# sheet.merge_cells(start_row, start_col, end_row, end_col)
			sheet.column(0).width =1
		sheet.merge_cells( 0, 1, 0, merchColumn)
 		# ========== WRITE ON HEADER FILE 
 		format = Spreadsheet::Format.new :color=> :xls_color_50 ,
 									:weight => :bold, 
 									:bottom =>:thick, 
 									:bottom_color => :xls_color_9,
                                 	:size => 16,
                                 	:vertical_align => :center
                                 	
 		#:pattern_fg_color => :yellow  # BACKGROUND COLOR

 		
 		sheet[0,1]=text

 		sheet.row(0).height = 30
 		#set format to all cell in header 
 		for i in 1..merchColumn
		   # puts "Value of local variable is #{i}"
 			sheet.row(0).set_format(i, format)
		end
 		

	end
end
