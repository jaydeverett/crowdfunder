require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test 'valid project can be created' do
    owner = new_user
    owner.save
    project = new_project
    project.owner = owner
    project.save
    assert project.valid?
    assert project.persisted?
    assert project.owner
  end

  test 'project is invalid without owner' do
    project = new_project
    project.owner = nil
    project.save
    assert project.invalid?, 'Project should not save without owner.'
  end

  def new_project
    Project.new(
      title:       'Cool new boardgame',
      description: 'Trade sheep',
      start_date:  Date.today,
      end_date:    Date.today + 1.month,
      goal:        50000
    )
  end

  def new_user
    User.new(
      first_name:            'Sally',
      last_name:             'Lowenthal',
      email:                 'sally@example.com',
      password:              'passpass',
      password_confirmation: 'passpass'
    )
  end

  test "owner can see who has backed project" do
    project = new_project
    backer = new_user
    dude = new_user
    dude.email = "dude@aol.com"
    project.owner = dude
    pledge = Pledge.new(project: project, user: backer, dollar_amount: 100)

    project.save!
    backer.save!
    dude.save!
    pledge.save!

    assert_equal project.backers, User.where(email: backer.email)
    end
end
