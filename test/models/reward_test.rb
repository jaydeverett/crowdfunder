require 'test_helper'

class RewardTest < ActiveSupport::TestCase

  # def test_A_reward_cannot_be_create_without_a_description
  #   user = create(:user)
  #   owner = create(:owner)
  #   project = create(:project,owner_id: owner.id)
  #   reward = create(:reward, description: nil, project_id: project.id)
  #
  #   assert reward.invalid?
  # end
  # #
  # def test_A_reward_cannot_be_create_without_a_dollar_amount
  #
  # end
  test 'dollar amount must be positive' do
    user = create(:user)
    owner = create(:owner)
    project = create(:project, owner: owner)
    reward = create(:reward, project: project, dollar_amount: 99.0)

    assert reward.valid?
  end

  test 'A reward can be created' do
    skip
    user = create(:user)
    owner = create(:owner)
    project = create(:project,owner_id: owner.id)

    reward = Reward.create(
      dollar_amount: 99.00,
      description: 'A heartfelt thanks!',
      project: project
    )
    assert reward.valid?
    assert reward.persisted?
  end

  test 'A reward cannot be created without a dollar amount' do
    skip
    user = create(:user)
    owner = create(:owner)
    project = create(:project, owner: owner)

    reward = Reward.new(
      description: 'A heartfelt thanks!',
      project: project
    )
    assert reward.invalid?, 'Reward should be invalid without dollar amount'
    assert reward.new_record?, 'Reward should not save without dollar amount'
  end

  test 'A reward cannot be created without a description' do
    user = create(:user)
    owner = create(:owner)
    project = create(:project, owner: owner)

    reward = Reward.create(
      dollar_amount: 99.00,
      project: project
    )
    assert reward.invalid?, 'Reward should be invalid without a description'
    assert reward.new_record?, 'Reward should not save without a description'
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

end
