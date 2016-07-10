module V1
  class TasksController < ApplicationController
    swagger_controller :tasks, 'Tasks'

    before_action :load_project, except: :show

    swagger_api :index do
      summary 'List all tasks for a given project'
      notes 'This lists all tasks (of every state)'
      param :path, :project_id, :id, :required, 'Project Id'
      param :query, :page, :integer, :optional, 'page number of results, default 1'
      param :query, :page_size, :integer, :optional, 'number of results per page, default 25'
    end
    def index
      tasks, errors = ListTasks.new(@project, index_params).call
      if errors.any?
        render json: { errors: errors }, status: 400
      else
        render json: tasks
      end
    end

    swagger_api :show do
      summary 'Fetch a single Task'
      param :path, :id, :string, :required, 'Task Id'
    end
    def show
      task = Task.find_by id: params[:id]
      if task.present?
        render json: task
      else
        render json: { errors: ['Task not found'] }, status: 404
      end
    end

    swagger_api :create do
      summary 'Creates a new Task'
      param :path, :project_id, :id, :required, 'Project Id'
      param :form, :name, :string, :required, 'Task designation'
      param :form, :description, :string, :optional, 'Task description'
    end
    def create
      task = @project.tasks.build task_params
      if task.save
        render json: task, status: 201
      else
        render json: { errors: task.errors.full_messages }, status: 400
      end
    end

    private

    def load_project
      @project = Project.find params[:project_id]
    rescue ActiveRecord::RecordNotFound
      render json: { errors: ['Project was not found'] }, status: 404
    end

    def index_params
      params.permit(:page, :page_size).to_h.symbolize_keys
    end

    def task_params
      params.require(:task).permit :name, :description
    end
  end
end
