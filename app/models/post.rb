class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, :content, :presence => true
  validates :title, length: { :minimum => 3, :maximum => 100}
 
end
