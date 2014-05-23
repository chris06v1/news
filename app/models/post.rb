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
  validates :title, presence: true
  validates :url, presence: true
end
