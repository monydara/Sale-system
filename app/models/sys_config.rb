class SysConfig < ActiveRecord::Base
=begin
   configuration code and description
--- invoice
   INV01 = invoice format name

-- Receipt
  RPT01= receipt format

-- extjs
  SYS01 = multi currency

=end

  def self.get_config_by_code code
    @data = self.find_by_code code
    @data.value
  end
end
