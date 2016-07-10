class ListTasks < ListCollection

  attr_defaultable :task_repository, -> { @project.tasks }
  attr_defaultable :result_serializer, -> { V1::TaskSerializer }

  def initialize(project, page_options)
    super page_options
    @project = project
  end

  def collection_type
    :tasks
  end

  def collection
    @tasks ||= task_repository
  end
end
