# frozen_string_literal: true
class Team < ApplicationRecord
  has_many :projects
  has_many :users
  # has_many :message
  has_many :attachments
  has_many :members, class_name: 'Member'

  # validates_length_of :members, maximum: 2, if: -> { PLANS == 'pro' }
  # validates_length_of :members, maximum: 10, if: -> { PLANS == 'enterprise' }

  accepts_nested_attributes_for :users, allow_destroy: true
  validates :user_id, presence: true
end
