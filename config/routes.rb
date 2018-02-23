Rails.application.routes.draw do
  get 'students/insert'

  get 'students/edit'

  get 'students/delete'

  get 'students/show'
  post 'students/show'

  get 'students/updateattendance'
 
  resources:students
  resources :students do
  	collection do
 		   post 'checkgmail'
		   post 'filterstudents'
		   get 'filterstudents'
  	end
  end
  get 'students/checkgmail', to: 'students#checkgmail'
  get 'students/fiterstudents', to: 'students#filterstudents'
  post 'students/fiterstudents', to: 'students#filterstudents'
  get 'students/putattendance', to: 'students#putattendance'
  post 'students/putattendance', to: 'students#putattendance'
  root 'students#insert'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
