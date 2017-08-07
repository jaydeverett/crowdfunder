class Reward < ActiveRecord::Base
  belongs_to :project

<<<<<<< HEAD
 validates :description, presence: true
 validates :dollar_amount, presence: true

 validate :limit_for_reward
 validate :dollar_amount_must_be_positive

 def limit_for_reward
   count = Project.find(self.project_id).rewards.count
   if count >= 5
     errors.add :reward, "Alreday 5 rewards"
   end
 end

 def dollar_amount_must_be_positive
   if dollar_amount <= 0
     errors.add :dollar_amount, "dollar amount must be positive"
   end
 end

=======
 validates :description, :dollar_amount, presence: true
>>>>>>> 2c0519fbc049d7945853e7b92b8c583e1139c515
end
