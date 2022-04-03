module V1
  class Users < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api
    resource :users do
      desc 'Return list of users'
      get do
        users = User.all
        present users
      end
      desc 'Return a specific user'
      route_param :id do
        get do
          user = User.find(params[:id])
          present user
        end
      end
      desc 'create a new user'
      params do
        requires :name, type: String, allow_blank: false
        requires :address, type: String
        requires :role, type: Symbol, allow_blank: false,values: [:teacher, :student, :admin]
        requires :email, type: String, allow_blank: false
        requires :password, type: Integer, allow_blank: false

      end
      post do
        User.create!({ name:params[:name], address:params[:address],email:params[:email],password:params[:password], role:params[:role]})
      end
      desc 'Return a specific user'
      route_param :id do
        get do
          user = User.find(params[:id])
          present user
        end
      end
      desc 'Update a user'
      params do


          optional :name, type: String
          optional :address, type: String
          optional :email, type: String

      end
      route_param :id do
        patch do
          user = User.find(params[:id])
          if user.update(name:params[:name],address:params[:address],email:params[:email])

            present user
          else
            error = { error: user.errors.messages, message: 'Order Failed to Update' }
            present error
          end
        end
      end

    end
  end
end