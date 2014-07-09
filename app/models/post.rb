# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)      not null
#  url        :text
#  body       :text
#  state      :string(255)      default("published")
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base

  belongs_to :user

  has_many :up_votes
  has_many :down_votes

  validates :title, presence: true
  validates :url, presence: true

  attr_accessible :title, :url, :body

  # scopes
  def self.state(state = 'published'); where(:state => state).order(:created_at) end
end
