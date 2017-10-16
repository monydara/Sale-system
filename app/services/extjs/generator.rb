class Extjs::Generator




  def generate_controller controller_dir , view_dir
    @_path = Rails.root.join('public','tmp')
    name_splite = controller_dir.split "."
    # -- declear path
    main_folder =  name_splite[0]
    file_name = "#{name_splite[1]}.js"
    controller_name = name_splite[1]


    file_path = "#{@_path}/controller/#{main_folder}"


    write_directory file_path

    #--- declear strign
    content = get_controller_contennt main_folder , file_name,view_dir

    File.write("#{file_path}/#{file_name}", content )
  end

  def generate_view view_dir

  end


# ------ file format
  private
  def write_directory directory_name
    FileUtils::mkdir_p(directory_name) unless File.exists?(directory_name)

  end

  def get_view_index_content view_name
    dir= view_name.split "."
    main_folder  = dir[0]
    sub_folder = dir[1]
    alias_name = view_name.replace ".",""
  "Ext.define('App.view.#{main_folder}.#{sub_folder}.Index', {
      extend:'Ext.panel.Panel',
      alias:'widget.#{alias_name}Index' ,

      border:true,
      layout:'card',
      initComponent:function () {
          Ext.apply(this, {
              items:[

              {
                  title:'<font style=\"font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;\" > Customer List</font>',
                   tools:[
                      {
                          fieldLabel:'Search',
                          xtype:'textfield',
                          name:'Search',
                          emptyText:'-- Search Record --'
                      },
                      // '->',
                      {
                          action:'Add',
                          xtype:'button',
                          style:'margin-left:5px',
                          iconCls:'icon-add',
                          tooltip:'Add New Customer'
                      },{
                          xtype:'button',
                          action:'Edit',
                          tooltip:'Edit Customer',
                          style:'margin-left:5px',
                          iconCls:'icon-edit'
                      }
                  ],
                  xtype:'grid',
                  border:true,
                  name:'index',
                  store:'sale.Customer',
                  columns:[
                      {header:'NO', xtype:'rownumberer', width:50, align:'center'},
                      {header:'Code', dataIndex:'code'},
                      {header:'Name ',width:150,dataIndex:'name'},
                      {header:'Legal Name',width:150,dataIndex:'legal_name'},
                      {header:'Phone',width:150,dataIndex:'phone'},
                      {header:'Contact',width:150,dataIndex:'contact_name'},
                      {header:'Contact Phone',width:150,dataIndex:'contact_mobile'},
                      {header:'Area', flex:1 , dataIndex:'area_name'}

                  ],
                  bbar:Ext.create('Ext.PagingToolbar', {
                      store:'sale.Customer',
                      displayInfo: true,
                      displayMsg: 'view {0} - {1} of {2}',
                      emptyMsg: "view 0"
                  })

              },{
                  xtype:'FormCustomer'
              }
          ]
          });
          this.callParent(arguments);
      },




  });

  "

  end
  def get_controller_contennt main_folder , file_name,view_name

    alias_name = view_name.replace ".",""
    "Ext.define('App.controller.#{main_folder}.#{file_name}', {
      extend: 'Ext.app.Controller',
      views:[
        '#{view_dir}.Index',
        '#{view_dir}.Fm',

      ],
      stores:[


      ],
      init: function() {

	    this.control({
	    	'#{alias_name}Index button[action=Add]':{
	    		click: this.add
	    	},
	    	'#{alias_name}Index button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'#{alias_name}Index textfield[name=Search]':{
	    		change: this.search
	    	},

	    	'#{alias_name}Form button[action=Save]':{
	    		click: this.save
	    	},
	    	'#{alias_name}Form button[action=Cancel]':{
	    		click: this.cancel
	    	},


	    });
	},
	search:function(field){
		var store = this.getSaleCustomerStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},

	add:function(btn){
		var conatiner = btn.up('#{alias_name}Index');
		var form = conatiner.down('FormCustomer');
		form.getForm().reset(true);
		conatiner.setActiveItem(form);

	},
	edit: function(btn){

		var conatiner = btn.up('#{alias_name}Index');
		var form = conatiner.down('#{alias_name}Form');
		var record = Util.getRecord(btn);

		if (record) {
			form.getForm().reset(true);
			form.loadRecord(record);
			conatiner.setActiveItem(form);
		};

	},

	save :function(btn){

		var form = btn.up('form').getForm(),
		frm = btn.up('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSaleCustomerStore();

  		if(form.isValid()){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Customer');
  				model.set(values);
  				store.add(model);
  			};



			store.sync({
				success: function() {
					Ext.MessageBox.hide();
					me.cancel(btn);
					store.load();

				},
				failure: function(batch, option) {
					Ext.MessageBox.hide();
	                store.rejectChanges();

					var msg = option.batch.proxy.reader.rawData.message;
					Ext.MessageBox.show({
						title: 'Error',
						msg: msg,
						icon: Ext.MessageBox.ERROR,
						buttons: Ext.Msg.OK
					});

				},
				scope: this
			});

  		}else{
  			Util.msg('Please entry require field');
  		}


	},
	cancel:function(btn){
		var conatiner = btn.up('#{alias_name}Index');
		var grid = conatiner.down('grid[name=index]');
		conatiner.setActiveItem(grid);
	}
})

"
  end
end