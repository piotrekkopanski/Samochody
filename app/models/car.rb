class Car < ActiveRecord::Base
attr_accessible :marka, :model, :opis, :rocznik, :cena, :image,:azzets_attributes,:inage,:telefon
  has_many :azzets
  accepts_nested_attributes_for :azzets, :allow_destroy =>true
 acts_as_votable
 mount_uploader:image,ImageUploader 
def self.search(search)
           if search
             where (["marka LIKE ?","%#{search}%"])
            else 
             all
           end
       end 
end
