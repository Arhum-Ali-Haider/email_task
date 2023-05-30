class Email < ApplicationRecord
  belongs_to :email_account

  validates :subject, presence: true
  validates :body, presence: true
end