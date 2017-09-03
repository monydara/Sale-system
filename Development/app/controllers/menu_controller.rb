class MenuController < ApplicationController
  def index
    user = User.find session[:user_id]

    if user.is_admin == true
      main = SysMenu.where is_leaf: false, is_active: true
      sub = SysMenu.where is_leaf: true, is_active: true
      render json: { main: main, sub: sub, success: true }
    else
      role_id = user.role_id

      main = SysMenu.where(is_leaf: false, is_active: true)
      sub = SysMenu.joins(:rel_menu_role).where(is_leaf: true, is_active: true).where("rel_menu_roles.role_id = #{role_id}")
      render json: { main: main, sub: sub, success: true }
    end
  end

  def load_config
    @defaultCurrency = Currency.find_by is_base:true
    @allCurrency = Currency.all

    render json:{
        success:true ,
        defaultCurrencyId: @defaultCurrency.id  ,
        defaultCurrencySymbol: @defaultCurrency.symbol ,
        defaultCurrencyAbbr: @defaultCurrency.abbr,
        allCurrency: @allCurrency

    }
  end
end