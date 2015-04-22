class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, :class_name => 'Answer'
  accepts_nested_attributes_for :answers
end
