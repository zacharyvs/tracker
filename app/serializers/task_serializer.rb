class TaskSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :state

  belongs_to :project_id

end
