# frozen_string_literal: true
class Project < ApplicationRecord
  belongs_to :user
  # belongs_to :team
  # belongs_to :member
  # has_many :attachments, dependent: :destroy

  # accepts_nested_attributes_for :team
end
