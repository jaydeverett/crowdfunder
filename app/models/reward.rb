class Reward < ActiveRecord::Base
  belongs_to :project

 validates :description, :dollar_amount, presence: true
end
