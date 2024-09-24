class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable
  # before_create :set_confirmation_expiry
  private

  validates :password, presence: true, length: { in: 8..32, wrong_length: "phải có từ %{count} ký tự"} 
  validates :password_confirmation, presence: true
  validate :passwords_match
  private

  def passwords_match
    if password != password_confirmation
      errors.add(:password_confirmation)
    end
  end

  def set_confirmation_expiry
    self.confirmation_sent_at = Time.current
    self.confirmation_expires_at = Time.current + 2.days
  end
end
