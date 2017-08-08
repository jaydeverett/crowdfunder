require 'test_helper'

class ProjectsTest < ActionDispatch::IntegrationTest

  test "backer can leave a comment on a project they've backed" do
    project = Project.create(title: "Cool Project", description: "A cool project", goal: 25000, start_date: Date.today, end_date: Date.today+30)
    visit "projects/#{project.id}"
    # fill_in 


  end
end
