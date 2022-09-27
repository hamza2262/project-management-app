class Team < ApplicationRecord
  # has_many :projects, dependent: :destroy
  has_many :users
  has_many :messages
  has_many :attachments
  has_many :members, class_name: 'Member'

  # validates_length_of :members, maximum: 2, if: -> {Plan == 'FREE'}

  accepts_nested_attributes_for :users, allow_destroy: true
  validates :user_id, presence: true
end
