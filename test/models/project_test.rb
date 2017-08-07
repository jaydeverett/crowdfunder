require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  # test 'if backed that project or not' do
  #   skip
  #   user = create(:user)
  #   owner = create(:owner)
  #   project = create(:project, owner: owner)
  #   pledge = create(:pledge, project: project, user: user)
  #
  #   assert pledge.valid? "you have laready backed that project"
  # end

  test 'totla pledges' do
    skip
    user = create(:user)
    owner = create(:owner)
    project = create(:project, owner: owner)

    result = project.total_pledge

    assert_equal(result, project.pledges.dollar_amount.sum)
  end

  test 'end date is later than start date' do

    user = create(:user)
    owner = create(:owner)
    project = create(:project, owner: owner, start_date: Date.today, end_date: Date.today + 2.days)

    assert project.valid?
  end

  test 'project goal must be positive number' do

    user = create(:user)
    owner = create(:owner)
    project = create(:project, owner: owner, goal: 10)

    assert project.valid?
  end



  test 'project start date must be in future' do

    user = create(:user)
    owner = create(:owner)

    project = create(:project, owner: owner)

    project.start_date = Date.today + 2.day
    # puts project.valid?

    assert project.valid?, "not future!"
  end

  def test_project_is_invaild_without_owner
    user = create(:user)
    owner = create(:owner)
    project = create(:project, owner: owner)

    assert project.owner.valid?
  end

  test 'how many times a specific reward cab be claimed' do

    owner = new_user
    owner.save
    project = new_project
    project.owner = owner
    project.save

    5.times do
      reward = new_reward
      reward.project = project
      reward.save
    end
    rewardtest =new_reward
    rewardtest.project = project
    assert rewardtest.invalid?, 'reward can be claimed whithin 5 times'
  end

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
    owner= new_user
    owner.save
    project.owner = owner
    project.save
    assert project.valid?, 'Project should not save without owner.'
  end

  test 'project can list backers' do
    skip
    project = new_project
    backer = new_user
    owner = User.new(
      first_name:            'Sally',
      last_name:             'Lowenthal',
      email:                 'sally@google.com',
      password:              'passpass',
      password_confirmation: 'passpass'
    )
    project.owner = owner
    project.save!
    pledge = Pledge.new(project: project , user: backer, dollar_amount: 100)


    backer.save!
    pledge.save!

    assert project.pledges.include? pledge
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


  def new_reward
    Reward.new(
    description: 'hi',
    dollar_amount: 100
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
