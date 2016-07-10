Given(/^a task:$/) do |table|
  d.given_task table
  @project = Project.find vertical_table(table)[:project_id]
end

When(/^I (?:try to )?create a task with:$/) do |table|
  attributes = vertical_table table
  d.create_task attributes
  @project = Project.find attributes[:project_id]
end

Then(/^the project has the tasks:$/) do |table|
  ActiveCucumber.diff_all! @project.tasks.order(:created_at), table
end

Then(/^the project has (\d+) tasks?$/) do |count|
  expect(@project.tasks.count).to eq count.to_i
end

When(/^I request the tasks for that project$/) do
  d.request_tasks @project, Hash.new
end
