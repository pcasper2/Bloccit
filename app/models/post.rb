class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC')}
  #scope :ordered_by_title, -> { order('title') }
  #scope :ordered_by_reverse_created_at, -> { reverse_order('created_at DESC') }

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