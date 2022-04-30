class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #deviseの利用機能が使われる前にconfigure_permitted_parameterが実行

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name, :first_name, :last_name_kana, :first_name_kana])
  end
  #strong parametersと同様の機能
  #privateは自分のコントローラー内だけ適用に対してpermittedは他のコントローラーでも参照可能
end
