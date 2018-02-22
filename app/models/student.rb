class Student < ApplicationRecord
 validates :studentname, presence: true,
                    length: { minimum: 3 }
end
