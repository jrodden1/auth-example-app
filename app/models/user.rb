class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable


  def admin?
    has_role?('admin')
  end

  def viewer?
    has_role?('viewer')
  end

  def standard?
    has_role?('standard')
  end

  def ability
    Ability.new(self)
  end
end
