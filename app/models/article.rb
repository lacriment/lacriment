class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  paginates_per 2

  validates :title, presence: true, length: { minimum: 5 }
  validates :tags, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 5 }

  has_many :comments
  has_many :view_counts
end
