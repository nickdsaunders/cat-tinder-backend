class Cat < ApplicationRecord
    validates :name, :age, :enjoys, presence: true
    validates :enjoys, length: { minimum: 5 }
end
