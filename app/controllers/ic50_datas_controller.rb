class Ic50DatasController < ApplicationController

  hobo_model_controller

  auto_actions :all

#def index
#hobo_index Ic50_data.viewable(current_user).apply_scopes(:search =>[params[:search], :title, :body], :order_by => parse_sort_param(:title,:iC50_zanamivir_MUNANA_nm))

end

# def index
#  hobo_index IC50_data.apply_scopes(:search => [params[:search], :title, :body],
#  :order_by => parse_sort_param(:title))
# end

