class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  belongs_to :owner, class_name: 'User'

  validates :title, :description, :goal, :start_date, :end_date, presence: true

  validate :start_in_future
  validate :end_date_is_later_than_start_date
  validate :goal_must_be_positive
  # validate :total_pledge


  def start_in_future
    if self.start_date < Date.today
      errors.add(:base, "Start date must be in furture")
    end
  end

  def end_date_is_later_than_start_date
    if self.start_date >= self.end_date
      errors.add :end_date, "End date must be later than start date"
    end
  end

  def goal_must_be_positive
    if self.goal.to_i < 0
      errors.add(:base, "Goal must be positive")
    end
  end

  # def total_pledge
  #   pledges.map {|p| p.dollar_amount}.sum
  # end



end
