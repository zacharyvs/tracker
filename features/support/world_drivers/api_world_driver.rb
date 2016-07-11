class ApiWorldDriver < WorldDriver
  include Rack::Test::Methods

  def initialize
    p 'Running Features in the API World'
    super
  end

  def app
    Rails.application
  end

  def request_list collection_type, params
    base = case collection_type
          when "projects"
            "v1/projects"
          else
            "v1/projects/#{params[:project_id]}/tasks"
          end
    result = get(base + "?#{params.except(:project_id).to_query}")
    parse_list_body result
  end

  def create_project attributes
    result = post '/v1/projects', { project: attributes }
    parse_create_body result
  end

  def create_task attributes
    result = post "/v1/projects/#{attributes[:project_id]}/tasks", { task: attributes }
    parse_create_body result
  end

  private

  def parse_list_body result
    body = JSON.parse(result.body).deep_symbolize_keys
    if body[:errors].present?
      @errors.push *body[:errors]
      @results = nil
    else
      @results = body
    end
  end

  def parse_create_body result
    body = JSON.parse(result.body).deep_symbolize_keys
    if body[:errors].present?
      @errors.push *body[:errors]
    end
  end
end
