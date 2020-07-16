require 'reform'
module User::Contract
  class Login < Reform::Form
    property :email
    property :password

    validates :email, :password, presence: true
  end
end