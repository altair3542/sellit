class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true,
    format: {
      with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      message: :invalid
    }

  validates :username, presence: true, uniqueness: true,
    length: { in: 3..15 },
    format: {
      with: /\A[a-zA-Z0-9]+\z/,
      message: :invalid
    }

  validates :password, length: { minimum: 6 }

  has_many :products, dependent: :destroy


  before_save :downcase_atributes

  private

  def downcase_atributes
    self.username = username.downcase
    self.email = email.downcase
  end

end
