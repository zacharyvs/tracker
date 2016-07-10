class DomainWorldDriver < WorldDriver

  def initialize
    p 'Running Features in the Domain World'
    super
  end

  def request_list collection_type, params
    @results, e = "List#{collection_type.camelize}".constantize.new(params).call
    @errors.push *e
  end

  def request_tasks project, params
    @results, e = ListTasks.new(project, params).call
    @errors.push *e
  end

  def create_project params
    create_instance Project, params
  end

  def create_task params
    create_instance Task, params
  end

  private

  def create_instance model, params
    instance = model.create params
    @errors.push *instance.errors.full_messages
  end
end
