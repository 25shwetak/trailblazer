require 'reform'
module User::Contract
  class Form < Login
    property :name
    property :mobile_number

    validates :name, :mobile_number, presence: true
    validates_uniqueness_of :email
    validates_uniqueness_of :mobile_number
  end
end