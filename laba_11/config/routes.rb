Rails.application.routes.draw do
  get 'laba11/index'
  get 'laba11/calculate'
  get 'laba11/xml_result' # Новый маршрут для XML
  root 'laba11#index'
end
