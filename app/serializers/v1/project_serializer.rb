module V1
  class ProjectSerializer < ActiveModel::Serializer

    attributes :id, :name, :description, :state

    has_many :tasks
  end
end
