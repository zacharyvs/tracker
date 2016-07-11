Rails.application.routes.draw do
  crud = %i(index show create update destroy)

  namespace :v1 do
    resources :projects, only: crud do
      resources :tasks, only: [:create, :index]
      # Redirect more RESTful nested requests to /projects/:project_id/tasks/:task_id/ to /tasks/:task_id
      get '/tasks/:id', to: redirect('/v1/tasks/%{id}')
    end
    resources :tasks, only: [:show]
  end
end
