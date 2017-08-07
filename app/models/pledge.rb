class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true
  validates :user, presence: true
  validate :owner_back_own_project

  def owner_back_own_project
    if user == project.owner
      errors.add :user, "Cannot back own project"
    end
  end
  
end
