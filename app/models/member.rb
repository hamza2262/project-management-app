class Member < ApplicationRecord
  belongs_to :team, class_name: 'Team'
  belongs_to :user
  # belongs_to :project
  # belongs_to :message
end
