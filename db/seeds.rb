if Area.any?
  Area.delete_all
end
  Area.create!([
                   {code: "01", name: "លក់ដំុ"},
                   {code: "02", name: "លក់រាយ"}
               ])
# -- customer type 

if CustomerType.any?
  CustomerType.delete_all
end
  CustomerType.create!([
                   {code: "TK", name: "Takeo"},
                   {code: "PP", name: "Phnom Penh"}
               ])




if CompanyProfile.any?
  CompanyProfile.delete_all
end
CompanyProfile.create!([
  {legal_name: "សារីមុន្នីតារា", company_name: "Sary Monydara", tax_no: "12356", mobile: "012 812812 ", phone: "012 812812 ", email: "company@domain.com", website: "www.website.com", address: "Phnom Penh", update_by: nil, image_file_name: "/system/company_profiles/images/000/000/001/original/Screen_Shot_2017-09-16_at_9.59.07_PM.png?1505573974", image_content_type: "image/png", image_file_size: 27798, image_updated_at: "2017-09-16 14:59:34", account_no: "11-2021-031993-3", account_name: "Dara", bank_name: "Cathay United Bank", vat_tin: "105007390"}
])

if Contact.any?
  Contact.delete_all
end
Contact.create!([
  {contact_name: "Default Contact", contact_mobile: "N/A", contact_id_card: "", contact_email: "", contact_address: "", description: nil}
])

if Currency.any?
  Currency.delete_all
end
Currency.create!([
  {name: "Riel", symbol: "៛", abbr: "KHR", fraction_unit: 1, rate_in: "1.0", rate_out: "1.0", is_base: true},
  {name: "Dollar", symbol: "$", abbr: "USD", fraction_unit: 1, rate_in: "4000.0", rate_out: "4100.0", is_base: false}
])

if Department.any?
  Department.delete_all
end
department = Department.create!([
  {name: "Admin Department", description: ""}
])
if ItemCategory.any?
  ItemCategory.delete_all
end
ItemCategory.create!([
  {sub_of_id: 4, name: "Beer", remark: "", is_active: true},
  {sub_of_id: 2, name: "Inventory Software", remark: "", is_active: true},
  {sub_of_id: nil, name: "Hospital  Software", remark: "", is_active: true},
  {sub_of_id: 0, name: "Service", remark: "", is_active: true},
  {sub_of_id: nil, name: "Drink", remark: "", is_active: true},
  {sub_of_id: nil, name: "Beer", remark: "", is_active: true}
])

if ItemType.any?
  ItemType.delete_all
end
ItemType.create!([
  {name: "Invetory", code: "001", created_by: nil, modify_by: nil},
  {name: "Service", code: "002", created_by: nil, modify_by: nil},
  {name: "Fix Asset", code: "003", created_by: nil, modify_by: nil},
  {name: "Asset", code: "004", created_by: nil, modify_by: nil},
  {name: "Group Item", code: "005", created_by: nil, modify_by: nil}
])

if Locations.any?
  Locations.delete_all
end
Locations.create!([
  {name: "", phone: "", fax: "", website: "", email: "", address: "", remark: "", is_active: true, create_by: nil, modify_by: nil},
  {name: "Phone Penh", phone: "", fax: "", website: "", email: "", address: "", remark: "", is_active: true, create_by: nil, modify_by: nil},
  {name: "Takeo", phone: "", fax: "", website: "", email: "", address: "", remark: "", is_active: true, create_by: nil, modify_by: nil}
])
if LookUp.any?
  LookUp.delete_all
end
LookUp.create!([
  {cod_type: "LEAD STATUS", code: "L", name: "Lead", description: nil},
  {cod_type: "LEAD STATUS", code: "O", name: "Open", description: nil},
  {cod_type: "LEAD STATUS", code: "R", name: "Reply", description: nil},
  {cod_type: "LEAD STATUS", code: "OP", name: "Opportunity", description: nil},
  {cod_type: "LEAD STATUS", code: "I", name: "Interest", description: nil},
  {cod_type: "LEAD STATUS", code: "C", name: "Converted", description: nil},
  {cod_type: "LEAD STATUS", code: "N", name: "Not Interest", description: nil},
  {cod_type: "LEAD STATUS", code: "CA", name: "Cancel", description: nil},
  {cod_type: "OPPORTUNITY TYPE", code: nil, name: "Open", description: nil},
  {cod_type: "OPPORTUNITY TYPE", code: nil, name: "Quotation", description: nil},
  {cod_type: "OPPORTUNITY TYPE", code: nil, name: "Lost", description: nil},
  {cod_type: "OPPORTUNITY TYPE", code: nil, name: "Replied", description: nil},
  {cod_type: "OPPORTUNITY TYPE", code: nil, name: "Closed", description: nil}
])

if NextVersion.any?
  NextVersion.delete_all
end
NextVersion.create!([
  {n_type: "LEAD", prefix: "", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "CUSTOMER", prefix: "", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "SALE ORDER", prefix: "SO", next_code: "1", degit: 4, is_manaul: true},
  {n_type: "QUOTATION", prefix: "QT-", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "INVOICE INCLUDE TAX", prefix: "INV-", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "INVOICE NOT INCLUDE TAX", prefix: "", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "RECIEPT NOT INCLUDE TAX", prefix: "", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "ITEM", prefix: "", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "PURCHASE ORDER", prefix: nil, next_code: "1", degit: 4, is_manaul: false},
  {n_type: "PURCHASE RECIEVE BILL", prefix: nil, next_code: "1", degit: 4, is_manaul: false},
  {n_type: "PURCHASE PAYMENT", prefix: nil, next_code: "1", degit: 4, is_manaul: false},
  {n_type: "ISSUE RENTAL", prefix: nil, next_code: "1", degit: 4, is_manaul: false},
  {n_type: "ISSUE MAINTENANCE", prefix: nil, next_code: "1", degit: 4, is_manaul: false},
  {n_type: "RECIEPT INCLUDE TAX", prefix: "", next_code: "1", degit: 6, is_manaul: false},
  {n_type: "OPPORTUNITY ", prefix: "", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "SALE RECEIPT INCLUDE TAX", prefix: "SRT-", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "SALE RECEIPT NOT INCLUDE TAX", prefix: "SR-", next_code: "1", degit: 4, is_manaul: false}
])

if Position.any?
  Position.delete_all
end
Position.create!([
  {name: "Administrator", description: "For System Adminsdf", is_deleted: false, created_by: nil},
  {name: "Sale Supervisor", description: "for sale supervisor", is_deleted: false, created_by: nil},
  {name: "Sale Executive", description: "", is_deleted: false, created_by: 1}
])
if Role.any?
  Role.delete_all
end
roles = Role.create!([
 {name: "System Admin", description: "Default System Role", is_active: true, is_admin: nil},
  {name: "Sale", description: "", is_active: true, is_admin: nil}

])

if Source.any?
  Source.delete_all
end
Source.create!([
  {name: "Advertisement ", description: nil, create_by: nil},
  {name: "Blog Post", description: nil, create_by: nil},
  {name: "Campaing", description: nil, create_by: nil},
  {name: "Call ", description: nil, create_by: nil},
  {name: "Customer", description: nil, create_by: nil},
  {name: "Supplier", description: nil, create_by: nil},
  {name: "Website", description: nil, create_by: nil},
  {name: "Email", description: nil, create_by: nil},
  {name: "Facebook", description: nil, create_by: nil},
  {name: "Proposal", description: nil, create_by: nil}
])

if SysConfig.any?
  SysConfig.delete_all
end
SysConfig.create!([
  {code: "INV01", name: "Invoice Print Format", description: "configure invoice format base on customer", data_type: "string", value: "print_invoice_lux", configs_type: "Invoice"},
  {code: "SYS01", name: "Multicurrency", description: "set enable to true for system run in multi currency", data_type: "boolean", value: "TRUE", configs_type: "System"},
  {code: "INV02", name: "Default VAT", description: "set value in percentage ", data_type: "int", value: "10", configs_type: "Invoice"},
  {code: "RPT01", name: "Receipt Print Format", description: "configure receipt format base on customer", data_type: "string", value: "print_receipt_lux", configs_type: "Receipt"}
])


if TransactionType.any?
  TransactionType.delete_all
end
TransactionType.create!([
  {name: "Bill", description: "Payment on Bill From vender", flag: 1},
  {name: "Invoice", description: "issue invoice to customer", flag: -1},
  {name: "Adjust Stock", description: "flag null because it will increase or descrease depend on adjust type", flag: nil},
  {name: "Opening Stock", description: "when opening balance", flag: 1},
  {name: "Transfer Stock", description: "flag null because it will increase or descrease depend transfer to location ", flag: nil},
  {name: "Customer Payment", description: "Customer Pay on invoice", flag: -1},
  {name: "Sale Receipt", description: "Sale Receipt Paybill to customer", flag: 1}
])

if Ums.any?
  Ums.delete_all
end
Ums.create!([
  {code: "001", name: "large", abbreviation: "L", remark: "", create_by: nil, modify_by: nil},
  {code: "2", name: "Small", abbreviation: "S", remark: "", create_by: nil, modify_by: nil},
  {code: "3", name: "Medium", abbreviation: "M", remark: "", create_by: nil, modify_by: nil}
])

if User.any?
  User.delete_all
end

User.create!([
  {code: "001", date_join: "2017-10-10", first_name: "dara", last_name: "dara", role:roles.first, department:department.first,
   phone: "069808433", email: "", username: "admin", encrypted_password:"21232f297a57a5a743894a0e4a801fc3", is_active: true, is_admin: true, address: ""}
])

if SysMenu.any?
  SysMenu.delete_all
end

# --- create main menu
genSetup = SysMenu.create!( {menu: "General Setup", icon_cls: "fa fa-cog", expand: true, is_leaf: false, parent_id: nil, action: "update", is_active: true, view_index: "", controller_name: "", seq_no:50})
admin = SysMenu.create!({menu: "System Administration", icon_cls: "fa fa-group", expand: true, is_leaf: false, parent_id: nil, action: "update", is_active: true, view_index: "", controller_name: "", seq_no:40})
item= SysMenu.create!( {menu: "Items", icon_cls: "fa fa-cubes", expand: true, is_leaf: false, parent_id: nil, action: "update", is_active: true, view_index: "", controller_name: "", seq_no:20})
sales= SysMenu.create!({menu: "Sale", icon_cls: "fa fa-cogs", expand: true, is_leaf: false, parent_id: nil, action: "update", is_active: true, view_index: "", controller_name: "", seq_no:10})
purchase= SysMenu.create!(  {menu: "Purchase", icon_cls: "fa fa-cart-plus", expand: true, is_leaf: false, parent_id: nil, action: "update", is_active: true, view_index: "", controller_name: "", seq_no:30})
report= SysMenu.create!(  {menu: "Report", icon_cls: "fa fa-cart-plus", expand: true, is_leaf: false, parent_id: nil, action: "update", is_active: true, view_index: "", controller_name: "", seq_no:60})
# -- end
# --- create sub menu

# ---- end

SysMenu.create!([
              {menu: "Sale Receipt", icon_cls: "fa fa-file-text-o", expand: nil, is_leaf: true, parent:sales, action: "update", is_active: true, view_index: "sale.saleReceipt", controller_name: "sale.SaleReceipt", seq_no:14},

              {menu: "Area", icon_cls: "fa fa-map-marker", expand: false, is_leaf: true, parent:genSetup, action: "update", is_active: true, view_index: "setup.area", controller_name: "setup.Area"},
              {menu: "Payment Term", icon_cls: "fa fa-calendar-check-o", expand: false, is_leaf: true, parent:genSetup, action: "update", is_active: true, view_index: "setup.paymentTerm", controller_name: "setup.PaymentTerm"},
              {menu: "Code", icon_cls: "fa fa-code-fork", expand: false, is_leaf: true, parent:genSetup, action: "update", is_active: true, view_index: "setup.code", controller_name: "setup.Code"},
              {menu: "Company Profile", icon_cls: "fa fa-bank", expand: false, is_leaf: true, parent:genSetup, action: "update", is_active: true, view_index: "setup.companyProfile", controller_name: "setup.CompanyProfile"},
              {menu: "Position", icon_cls: "fa fa-vcard-o", expand: false, is_leaf: true, parent:genSetup, action: "update", is_active: true, view_index: "setup.position", controller_name: "setup.Position"},

              {menu: "User", icon_cls: "fa fa-user", expand: false, is_leaf: true, parent:admin, action: "update", is_active: true, view_index: "admin.user", controller_name: "admin.User"},
              {menu: "Role", icon_cls: "fa fa-lock", expand: false, is_leaf: true, parent:admin,  action: "update", is_active: true, view_index: "admin.role", controller_name: "admin.Role"},
              {menu: "Department", icon_cls: "fa fa-university", expand: false, is_leaf: true, parent:admin, action: "update", is_active: true, view_index: "admin.department", controller_name: "admin.Department"},

              {menu: "UOM", icon_cls: "fa fa-thermometer-half", expand: false, is_leaf: true, parent:item, action: "update", is_active: true, view_index: "item.um", controller_name: "item.UM"},
              {menu: "Location", icon_cls: "fa fa-home", expand: false, is_leaf: true, parent:item, action: "update", is_active: true, view_index: "item.location", controller_name: "item.Location"},
              {menu: "Item Category", icon_cls: "fa fa-folder-open", expand: false, is_leaf: true, parent:item, action: "update", is_active: true, view_index: "item.itemcategory", controller_name: "item.ItemCategory"},
              {menu: "Item", icon_cls: "fa fa-shopping-cart", expand: false, is_leaf: true, parent:item, action: "update", is_active: true, view_index: "item.item", controller_name: "item.Item"},
              {menu: "Adjust Stock", icon_cls: "fa fa-cart-plus", expand: false, is_leaf: true, parent:item, action: "update", is_active: true, view_index: "item.adjuststock", controller_name: "item.AdjustStock"},
              {menu: "Opening Stock", icon_cls: "fa fa-cart-arrow-down", expand: false, is_leaf: true, parent:item, action: "update", is_active: true, view_index: "item.openingstock", controller_name: "item.OpeningStock"},

              {menu: "Lead", icon_cls: "fa fa-address-card", expand: false, is_leaf: true, parent:sales,  action: "update", is_active: true, view_index: "sale.lead", controller_name: "sale.Lead", seq_no:15},
              {menu: "Lead Opportunity", icon_cls: "fa fa-gift", expand: false, is_leaf: true, parent:sales,  action: "update", is_active: true, view_index: "sale.leadOpportunity", controller_name: "sale.LeadOpportunity", seq_no:16},
              {menu: "Customer", icon_cls: "fa fa-user-circle", expand: false, is_leaf: true, parent:sales,  action: "update", is_active: true, view_index: "sale.customer", controller_name: "sale.Customer", seq_no:17},
              {menu: "Quotation", icon_cls: "icon-customer", expand: false, is_leaf: true, parent:sales,  action: "", is_active: true, view_index: "sale.quotation", controller_name: "sale.Quotation" , seq_no:11},
              {menu: "Sale Invoice", icon_cls: "fa fa-shopping-cart", expand: false, is_leaf: true, parent:sales,  action: "update", is_active: true, view_index: "sale.invoice", controller_name: "sale.Invoice", seq_no:12},
              {menu: "Customer Payment", icon_cls: "fa fa-credit-card", expand: false, is_leaf: true, parent:sales,  action: "update", is_active: true, view_index: "sale.customerPayment", controller_name: "sale.CustomerPayment", seq_no:13},
              {menu: "Sale Representative", icon_cls: "fa fa-user-o", expand: false, is_leaf: true, parent:sales,  action: "update", is_active: true, view_index: "sale.saleRepresentative", controller_name: "sale.SaleRepresentative", seq_no:19},
              {menu: "Contact", icon_cls: "fa fa-address-book", expand: false, is_leaf: true, parent:sales,  action: "update", is_active: true, view_index: "sale.contact", controller_name: "sale.Contact", seq_no:18},
              {menu: "Service", icon_cls: "fa fa-industry", expand: true, is_leaf: false, parent_id: nil, action: "update", is_active: true, view_index: "", controller_name: ""},
              {menu: "Maintenance List", icon_cls: "icon-customer", expand: false, is_leaf: true, parent_id: 27, action: "", is_active: true, view_index: "service.maintenance", controller_name: "service.Maintenance"},
              {menu: "Teminate Maintenance List", icon_cls: "icon-customer", expand: false, is_leaf: true, parent_id: 27, action: "", is_active: true, view_index: "service.terminateMaintenance", controller_name: "service.TerminateMaintenance"},
              {menu: "Rental List", icon_cls: "icon-customer", expand: false, is_leaf: true, parent_id: 27, action: "", is_active: true, view_index: "service.rental", controller_name: "service.Rental"},
              {menu: "Teminate Rental List", icon_cls: "icon-customer", expand: false, is_leaf: true, parent_id: 27, action: "", is_active: true, view_index: "service.terminaeRental", controller_name: "service.TerminaeRental"},

              {menu: "Vendor", icon_cls: "icon-customer", expand: false, is_leaf: true, parent:purchase, action: "", is_active: true, view_index: "purchase.vender", controller_name: "purchase.Vender"},
              {menu: "Fix Asset", icon_cls: "fa fa-truck", expand: true, is_leaf: false, parent_id: nil, action: "update", is_active: true, view_index: "", controller_name: ""},
              {menu: "Transfer Asset", icon_cls: "icon-customer", expand: false, is_leaf: true, parent_id: 34, action: "", is_active: true, view_index: "fixAsset.transferFixAsset", controller_name: "fixAsset.Transfer"},
              {menu: "Depreciation", icon_cls: "icon-customer", expand: false, is_leaf: true, parent_id: 34, action: "", is_active: true, view_index: "fixAsset.depreciation", controller_name: "fixAsset.Depreciation"},
              {menu: "Menu", icon_cls: "fa fa-bars", expand: false, is_leaf: true, parent:genSetup, action: "update", is_active: false, view_index: "setup.menu", controller_name: "setup.Menu"},
              {menu: "Currency", icon_cls: "fa fa-usd", expand: nil, is_leaf: true, parent:genSetup, action: "update", is_active: true, view_index: "setup.currency", controller_name: "setup.Currency"},
              {menu: "Custom Price", icon_cls: "fa fa-money", expand: nil, is_leaf: true, parent:sales,  action: "update", is_active: true, view_index: "sale.customPrice", controller_name: "sale.CustomPrice", seq_no:19},

# -------- report section
              {menu: "Report Customer List", icon_cls: "fa fa-money", expand: nil, is_leaf: true, parent:report,  action: "update", is_active: true, view_index: "reports.customerlist", controller_name: "report.Report", seq_no:61},
              {menu: "Report Customer Balance Detail", icon_cls: "fa fa-money", expand: nil, is_leaf: true, parent:report,  action: "update", is_active: true, view_index: "reports.customerBalanceDetail", controller_name: "report.Report", seq_no:62},
              {menu: "Report Customer Balance", icon_cls: "fa fa-money", expand: nil, is_leaf: true, parent:report,  action: "update", is_active: true, view_index: "reports.customerBalance", controller_name: "report.Report", seq_no:62},

            ])
