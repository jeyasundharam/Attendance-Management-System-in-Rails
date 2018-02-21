Rails.application.routes.draw do
  get 'students/insert'

  get 'students/edit'

  get 'students/delete'

  get 'students/show'

  get 'students/updateattendance'
 
  resources:students

  root 'students#insert'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
