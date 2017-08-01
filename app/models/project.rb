class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  belongs_to :owner, class_name: 'User'

  validates :title, :description, :goal, :start_date, :end_date, :owner, presence: true
end
