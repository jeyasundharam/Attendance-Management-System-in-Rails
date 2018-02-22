class Student < ApplicationRecord
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


 validates :studentname, presence: true,
                    length: { minimum: 3 }
end
