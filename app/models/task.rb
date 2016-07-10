# == Schema Information
#
# Table name: tasks
#
#  id          :uuid             not null, primary key
#  name        :string           not null
#  description :text
#  state       :integer          default(15), not null
#  project_id  :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tasks_on_name        (name) UNIQUE
#  index_tasks_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_02e851e3b7  (project_id => projects.id) ON DELETE => cascade
#

class Task < ActiveRecord::Base
  belongs_to :project

  validates :name, presence: true, uniqueness: true
  validates :state, :project, presence: true

  enum state: {
    todo:          15,
    "in-progress": 25,
    done:          35
  }
end
