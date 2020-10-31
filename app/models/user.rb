class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name,
    presence: true,
    uniqueness: {
      case_sensitive: false
    }
  validates :date_of_birth, :gender, presence: true

  validates :phone_number, presence: true, allow_blank: true,
                 numericality: true,
                 length: { minimum: 10, maximum: 15 }

  GENDER = %w( Male Female).freeze

  belongs_to :role, optional: true

  acts_as_token_authenticatable

  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'Customer' if role.nil?
  end

  def role_name
    role.name
  end

  def branch_manager?
    role_name == 'Branch Manager'
  end

  def age(dob)
    Time.zone.now.year - dob.year
  end
end
