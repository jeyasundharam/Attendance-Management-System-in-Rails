class Student < ApplicationRecord   
  has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true
  has_many :attendances
  accepts_nested_attributes_for :attendances, allow_destroy: true
  has_many :reasons
  accepts_nested_attributes_for :reasons, allow_destroy: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


 def self.to_csv(options = {})
   CSV.generate(options) do |csv|
    csv << column_names
    all.each do |product|
      csv << product.attributes.values_at(*column_names)
     end
   end
 end

                    validates :studentname, presence: true, length: { minimum: 3 }
                    validates :studentclass, presence: true
                    validates :department, presence: true
                    validates :avatar, presence: true
                    validates :gender, presence: true
                    validates :mobileno, presence: true, numericality: { only_integer: true,length:10}
                    validates :gmail, presence: true, uniqueness: true
                    validates :dob, presence: true
          
end
