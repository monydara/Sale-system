Test::Application.routes.draw do


get "home/login"
get "home/index"
get "reports/qtt"
# This redirect is a work around for the use of Extjs4 with Rails assets pipeline:
# for "test" and "production" mode images are now retrived this way
root 'home#index'
# get "index/index"

resources :login
# controller for sale module
resources :customers , :item_price , :sale_quotation , :sale_representative , :sale_invoice , :receive_payment, :customer_payment , :lead, :lead_direct_sale, :lead_website, :lead_infomation
# controller for Transfer fix asset
resources :depreciation,:transfer_fix_asset
#  controller for set up module
resources :area , :code , :company_profile , :position , :payment_terms
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

# controller for Maintenance module
resources :maintenance
resources :lookups,:sources , :lead_oppunities, :users , :department, :role

# controller for sys_menu module
resources :sys_menu, :menu
resources :rel_menu_role

get  ':controller(/:action(/:id))'
post  ':controller(/:action(/:id))'


end
