class Reward < ActiveRecord::Base
  belongs_to :project

 validates :description, :dollar_amount, presence: true

 validate :max_quantity_for_reward

  def max_quantity_for_reward
    
  end
end
