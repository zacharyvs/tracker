class ListProjects < ListCollection

  attr_defaultable :project_respository, -> { Project }
  attr_defaultable :result_serializer, -> { ProjectSerializer }

  def collection_type
    :projects
  end

  def collection
    @projects ||= project_respository.active
  end

end
