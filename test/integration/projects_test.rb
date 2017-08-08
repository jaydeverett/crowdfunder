require 'test_helper'

class ProjectsTest < ActionDispatch::IntegrationTest

  test "backer can leave a comment on a project they've backed" do
    project = Project.create(title: "Cool Project", description: "A cool project", goal: 25000, start_date: Date.today, end_date: Date.today+30)
    visit "projects/#{project.id}"
    fill_in :comment_comment, with: "nice project!"
    click_on 'Create Comment'
    save_and_open_page
    assert_text "nice project!"
    click_on 'Create Comment'
  end
end
