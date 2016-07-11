class ListTasks < ListCollection

  attr_defaultable :task_repository, -> { @project.tasks }
  attr_defaultable :result_serializer, -> { TaskSerializer }

  def initialize options
    super page_options(options)
    @project = Project.find options[:project_id]
  end

  def collection_type
    :tasks
  end

  def collection
    @tasks ||= task_repository
  end

  private

  def page_options options
    options.slice :page, :page_size
  end
end
