#encoding: utf-8
CompanyProfile.create!([
  {legal_name: "ក្រុមហ៊ុន ប៊ីឌីខេ ធេល", company_name: "Y5net", tax_no: "12356", mobile: "(017/081/066) 73 83 93", phone: "023 882 717 / (017/081/066) 73 83 93", email: "company@domain.com", website: "www.website.com", address: "#56 ,Street 337 , Sangkat Boeng Kork II, Khan ToulKork, Phnom Penh, Kingdom of Cambodia", update_by: nil, image_file_name: "/system/company_profiles/images/000/000/001/original/bdk2.png?1433902947", image_content_type: "image/png", image_file_size: 46735, image_updated_at: "2015-06-10 02:22:27", account_no: "11-2021-031993-3", account_name: "BDK tel Co.,Ltd", bank_name: "Cathay United Bank", vat_tin: "105007390"}
])
Department.create!([
  {name: "Sale Department", description: ""}
])
Eom.create!([
  {encrypted_date: "9AIvfGsi2DTr5JmkwAwWVA==\n", encrypted_last_close_date: nil, encrypted_password: "VVHflm+4xHcrLSfAtMxW+Q==\n", memo: "this is for close testing", encrypted_status: "tvmotGBZrSKZD09r2G+cag==\n", created_by: nil, modify_by: nil},
  {encrypted_date: "9AIvfGsi2DTr5JmkwAwWVA==\n", encrypted_last_close_date: "9AIvfGsi2DTr5JmkwAwWVA==\n", encrypted_password: "VVHflm+4xHcrLSfAtMxW+Q==\n", memo: "this is for close testing", encrypted_status: "zWPTOl3jRZ39deMwXtk/4A==\n", created_by: nil, modify_by: nil}
])
Image.create!([
  {image_file_name: "Tablet_pion.svg.png", image_content_type: "image/png", image_file_size: 163391, image_updated_at: "2016-01-29 01:49:18"},
  {image_file_name: "10647863_225730171094557_242167111_n.jpg", image_content_type: "image/jpeg", image_file_size: 110002, image_updated_at: "2016-01-29 02:38:15"},
  {image_file_name: "image_(14)_副本.jpg", image_content_type: "image/jpeg", image_file_size: 84511, image_updated_at: "2016-01-29 07:50:18"},
  {image_file_name: "image_.jpg", image_content_type: "image/jpeg", image_file_size: 84511, image_updated_at: "2016-01-29 07:50:32"}
])

ItemCategory.create!([
  {sub_of_id: 2, name: "Inventory Software", remark: "", is_active: true},
  {sub_of_id: nil, name: "Hospital  Software", remark: "", is_active: true},
  {sub_of_id: 0, name: "Service", remark: "", is_active: true}
])
ItemType.create!([
  {name: "Invetory", code: "001", created_by: nil, modify_by: nil},
  {name: "Service", code: "002", created_by: nil, modify_by: nil},
  {name: "Fix Asset", code: "003", created_by: nil, modify_by: nil},
  {name: "Asset", code: "004", created_by: nil, modify_by: nil},
  {name: "Group Item", code: "005", created_by: nil, modify_by: nil}
])
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

NextVersion.create!([
  {n_type: "LEAD", prefix: "", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "CUSTOMER", prefix: "", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "SALE ORDER", prefix: "SO", next_code: "1", degit: 4, is_manaul: true},
  {n_type: "QUOTATION", prefix: "QT-", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "INVOICE INCLUDE TAX", prefix: "", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "INVOICE NOT INCLUDE TAX", prefix: "", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "RECIEPT NOT INCLUDE TAX", prefix: "", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "ITEM", prefix: "", next_code: "1", degit: 4, is_manaul: false},
  {n_type: "PURCHASE ORDER", prefix: nil, next_code: "1", degit: 4, is_manaul: false},
  {n_type: "PURCHASE RECIEVE BILL", prefix: nil, next_code: "1", degit: 4, is_manaul: false},
  {n_type: "PURCHASE PAYMENT", prefix: nil, next_code: "1", degit: 4, is_manaul: false},
  {n_type: "ISSUE RENTAL", prefix: nil, next_code: "1", degit: 4, is_manaul: false},
  {n_type: "ISSUE MAINTENANCE", prefix: nil, next_code: "1", degit: 4, is_manaul: false},
  {n_type: "RECIEPT INCLUDE TAX", prefix: "", next_code: "1", degit: 6, is_manaul: false},
  {n_type: "OPPORTUNITY ", prefix: "", next_code: "1", degit: 4, is_manaul: false}
])
Position.create!([
  {name: "Administrator", description: "For System Adminsdf", is_deleted: false, created_by: nil},
  {name: "Sale Supervisor", description: "for sale supervisor", is_deleted: false, created_by: nil},
  {name: "Sale Executive", description: "", is_deleted: false, created_by: 1}
])

Role.create!([
  {name: "Sale", description: "", is_active: true},
  {name: "System Admin", description: "Default System Role", is_active: true}
])
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

TransactionType.create!([
  {name: "Bill", description: "Payment on Bill From vender", flag: 1},
  {name: "Invoice", description: "issue invoice to customer", flag: -1},
  {name: "Adjust Stock", description: "flag null because it will increase or descrease depend on adjust type", flag: nil},
  {name: "Opening Stock", description: "when opening balance", flag: 1},
  {name: "Transfer Stock", description: "flag null because it will increase or descrease depend transfer to location ", flag: nil},
  {name: "Customer Payment", description: "Customer Pay on invoice", flag: -1}
])
User.create!([
  {code: "001", date_join: "2016-02-06", first_name: "System", last_name: "Administration", phone: "N/A", email: "", username: "admin",department_id:1 , role_id:2, encrypted_password: "xrXgPX/YIxXn7TA53bx3EQ==\n", is_active: true, is_admin: true, address: ""}
])
 
# created by Davuth Than
 SysMenu.create!([
    #Menu Setup
    {id:1,menu:'General Setup',expand:1,is_leaf:0,is_active:true},
      {id:2,menu:'Area',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:1,action:'',is_active:true,view_index:'setup.area',controller:'setup.Area'},
      {id:3,menu:'Payment Term',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:1,action:'',is_active:true,view_index:'setup.paymentTerm',controller:'setup.PaymentTerm'},
      {id:4,menu:'Code',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:1,action:'',is_active:true,view_index:'setup.code',controller:'setup.Code'},
      {id:5,menu:'Company Profile',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:1,action:'',is_active:true,view_index:'setup.companyProfile',controller:'setup.CompanyProfile'},
      {id:6,menu:'Position',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:1,action:'',is_active:true,view_index:'setup.position',controller:'setup.Position'},
    #Menu System Administration
    {id:7,menu:'System Administration',expand:1,is_leaf:0,is_active:true},
      {id:8,menu:'User',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:7,action:'',is_active:true,view_index:'admin.user',controller:'admin.User'},
      {id:9,menu:'Role',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:7,action:'',is_active:true,view_index:'admin.role',controller:'admin.Role'},
      {id:10,menu:'Department',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:7,action:'',is_active:true,view_index:'admin.department',controller:'admin.Department'},
    #Menu Item
    {id:11,menu:'Items',expand:1,is_leaf:0,is_active:true},
      {id:12,menu:'UOM',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:11,action:'',is_active:true,view_index:'item.um',controller:'item.UM'},
      {id:13,menu:'Location',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:11,action:'',is_active:true,view_index:'item.location',controller:'item.Location'},
      {id:14,menu:'Item Category',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:11,action:'',is_active:true,view_index:'item.itemcategory',controller:'item.ItemCategory'},
      {id:15,menu:'Item',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:11,action:'',is_active:true,view_index:'item.item',controller:'item.Item'},
      {id:16,menu:'Adjust Stock',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:11,action:'',is_active:true,view_index:'item.adjuststock',controller:'item.AdjustStock'},
      {id:17,menu:'Opening Stock',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:11,action:'',is_active:true,view_index:'item.openingstock',controller:'item.OpeningStock'},
     #Menu Sale
    {id:18,menu:'Sale',expand:1,is_leaf:0,is_active:true},
      {id:19,menu:'Lead',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:18,action:'',is_active:true,view_index:'sale.lead',controller:'sale.Lead'},
      {id:20,menu:'Lead Opportunity',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:18,action:'',is_active:true,view_index:'sale.leadOpportunity',controller:'sale.LeadOpportunity'},
      {id:21,menu:'Customer',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:18,action:'',is_active:true,view_index:'sale.customer',controller:'sale.Customer'},
      {id:22,menu:'Quotation',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:18,action:'',is_active:true,view_index:'sale.quotation',controller:'sale.Quotation'},
      {id:23,menu:'Sale Invoice',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:18,action:'',is_active:true,view_index:'sale.invoice',controller:'sale.Invoice'},
      {id:24,menu:'Customer Payment',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:18,action:'',is_active:true,view_index:'sale.customerPayment',controller:'sale.CustomerPayment'},
      {id:25,menu:'Sale Representative',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:18,action:'',is_active:true,view_index:'sale.saleRepresentative',controller:'sale.SaleRepresentative'},
      {id:26,menu:'Contact',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:18,action:'',is_active:true,view_index:'sale.contact',controller:'sale.Contact'},      
    #Menu Service
    {id:27,menu:'Service',expand:1,is_leaf:0,is_active:true},
      {id:28,menu:'Maintenance List',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:27,action:'',is_active:true,view_index:'service.maintenance',controller:'service.Maintenance'},
      {id:29,menu:'Teminate Maintenance List',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:27,action:'',is_active:true,view_index:'service.terminateMaintenance',controller:'service.TerminateMaintenance'},
      {id:30,menu:'Rental List',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:27,action:'',is_active:true,view_index:'service.rental',controller:'service.Rental'},
      {id:31,menu:'Teminate Rental List',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:27,action:'',is_active:true,view_index:'service.terminaeRental',controller:'service.TerminaeRental'},
    #Menu Purchase
    {id:32,menu:'Purchase',expand:1,is_leaf:0,is_active:true},
      {id:33,menu:'Vendor',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:32,action:'',is_active:true,view_index:'purchase.vender',controller:'purchase.Vender'},
     #Menu Asset
    {id:34,menu:'Fix Asset',expand:1,is_leaf:0,is_active:true},
      {id:35,menu:'Transfer Asset',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:34,action:'',is_active:true,view_index:'fixAsset.transferFixAsset',controller:'fixAsset.Transfer'},
      {id:36,menu:'Depreciation',icon_cls:'icon-customer',expand:0,is_leaf:1,parent_id:34,action:'',is_active:true,view_index:'fixAsset.depreciation',controller:'fixAsset.Depreciation'},

  ])