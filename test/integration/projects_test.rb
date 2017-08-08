require 'test_helper'

class ProjectsTest < ActionDispatch::IntegrationTest

  test "backer can leave a comment on a project they've backed" do
    Project.create(title: "Cool Project", description: "A cool project", goal: 25000, start_date: Date.today, end_date: Date.today+30)
    visit 'projects'

  end
end
