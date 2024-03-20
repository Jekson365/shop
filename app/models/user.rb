class User < ApplicationRecord
  belongs_to :status

  validates :username,length: { minimum: 3,maximum:12 },presence: true
  validates :password,length: { minimum: 6,maximum: 14 },presence: true

  validate :password_complexity
  before_validation :set_default_admin,on: :create

  def password_complexity
    unless password.match(/[$]/)
      errors.add(:password,'password must include dollar sign')
    end
  end

  def set_default_admin
    self.is_admin ||= false
  end
end