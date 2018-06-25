class Reports::CustomerBalance
  def initialize
    @balance = {}
  end
  #code
  def calculate_balance(data )
    # --- calculate
     lcid =nil

    data.each do |e|

      # if e.customer_id == last_customer_id &&

# -- check customer id

        # -- assign default value
        lcid ="#{e.currency_id}#{e.customer_id}"
        if @balance[lcid].nil?
          @balance[lcid] = 0
        end


      @balance[lcid]= e.amount+ @balance[lcid]
      e.balance = @balance[lcid]
      puts lcid
      puts @balance[lcid]
        #
        # @balance[e.customer_id] =
        # e.balance = @balance

    end
    data

  end
end
