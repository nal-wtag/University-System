
  module V1
    class Courses < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api
      resource :courses do
        desc 'Return list of courses'
        get do
          courses = Course.all
          present courses
        end
        desc 'Return a specific course'
        route_param :id do
          get do
            course = Course.find(params[:id])
            present course
          end
        end

        desc 'create a new course'
        params do
          requires :title, type: String
          requires :code, type: String
          requires :credit, type: Float, values: 0.75..+6.00
          requires :semester, type: String
          requires :department_id, type: Integer

        end
        post do
          Course.create!({ title:params[:title], code:params[:code],credit:params[:credit],semester:params[:semester], department_id:params[:department_id]})
        end
        desc 'Update a specific Course'
        route_param :id do
          put do
            Course.find(params[:id]).update({ title:params[:title] })
          end
        end
      end

    end
  end
