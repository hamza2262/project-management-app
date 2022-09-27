class Message < ApplicationRecord
  belongs_to :teams
  belongs_to :projects
  belongs_to :members
end
