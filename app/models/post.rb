class Post < ActiveRecord::Base
  has_many :comments
  has_one :summary
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC')}
  #scope :ordered_by_title, -> { order('title') }
  #scope :ordered_by_reverse_created_at, -> { reverse_order('created_at DESC') }

  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def admin?
    self.user.role == 'admin'
  end

  def moderator?
    self.user.role == 'moderator'
  end

  def member?
    self.user.role == 'member'
  end

end