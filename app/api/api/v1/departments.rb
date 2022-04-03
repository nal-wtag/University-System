require 'doorkeeper/grape/helpers'
  module V1
    class Departments < Grape::API
      helpers Doorkeeper::Grape::Helpers
      before do
        doorkeeper_authorize!
      end
      version 'v1', using: :path
      format :json
      prefix :api

      resource :departments do
        desc 'Return list of department'
        get do
          department = Department.all
          present department
        end

      desc 'Return a specific department'
      route_param :id do
        get do
          department = Department.find(params[:id])
          present department
        end
      end
      desc 'create a new department'
      params do
        requires :name, type: String
        requires :location, type: String

      end
      post do
        Department.create!({ name:params[:name], location:params[:location]})
      end
      desc 'Update a specific Department'
      route_param :id do
        put do
          Department.find(params[:id]).update({ location:params[:location] })
        end
      end
    end
    end
  end


