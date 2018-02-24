class Address < ApplicationRecord
    belongs_to :student
    validates_presence_of :student
  end
