require 'rails_helper'

RSpec.describe Task, type: :model do
  subject { FactoryGirl.build :task }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :state }
  it { should validate_presence_of :project }
end
