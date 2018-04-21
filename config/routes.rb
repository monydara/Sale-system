Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :login
  # controller for sale module
  resources :customers , :item_price , :sale_quotation , :sale_representative , :sale_invoice , :receive_payment, :customer_payment , :lead, :lead_direct_sale, :lead_website, :lead_infomation, :customer_types
  resources :sale_receipts
  # controller for Transfer fix asset
  resources :depreciation,:transfer_fix_asset

  #  controller for set up module
  resources :area , :code , :company_profile , :position , :payment_terms , :currencies


  #  controller for purchase module
  resources :venders

  # controller for Item module
  resources :items
  resources :item_categories
  resources :ums
  resources :locations
  resources :item_type
  resources :contact
  resources :opening_stock
  resources :opening_stock_detail
  resources :adjust_stock
  resources :adjust_stock_detail
  resources :custom_prices
  resources :brands

  # controller for Maintenance module
  resources :maintenance
  resources :lookups,:sources , :lead_oppunities, :users , :department, :role

  # controller for sys_menu module
  resources :sys_menu, :menu
  resources :rel_menu_role

  resources :prints

  # ------- report
  resources :report_customers , :report_customer_balance_detail , :report_customer_balances , :report_sales, :report_sale_items

  get  ':controller(/:action(/:id))'
  post  ':controller(/:action(/:id))'
end
