class Reward < ActiveRecord::Base
  belongs_to :project

 validates :description, presence: true
 validates :dollar_amount, presence: true
end
