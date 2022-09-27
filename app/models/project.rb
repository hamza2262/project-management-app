class Project < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :members
  has_many :attachments, dependent: :destroy

  accepts_nested_attributes_for :team
end
