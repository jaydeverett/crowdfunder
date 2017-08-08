class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  has_many :comments
  belongs_to :owner, class_name: 'User'

  validates :title, :description, :goal, :start_date, :end_date, presence: true

  validate :start_in_future
  validate :end_date_is_later_than_start_date
  validate :goal_must_be_positive


  def start_in_future
    if self.start_date < Date.today
      errors.add :start_date, "Start date must be in furture"
    end
  end

  def end_date_is_later_than_start_date
    if self.start_date >= self.end_date
      errors.add :end_date, "End date must be later than start date"
    end
  end

  def goal_must_be_positive
    if self.goal <= 0
      errors.add :goal, "Goal must be positive"
    end
  end



end
