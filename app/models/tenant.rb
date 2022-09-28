class Tenant < ApplicationRecord

    validates :name, presence: true
    validates :age, inclusion: {minimum: 18}
end
