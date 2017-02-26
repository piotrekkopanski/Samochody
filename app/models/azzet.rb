class Azzet < ActiveRecord::Base
  belongs_to :car
 has_attached_file :inage, styles: {medium: "640x480>", thumb: "200x200>"},
  default_url:  "/inages/:style/missing.png"
 validates_attachment_content_type :inage, content_type: /\Aimage\/.*\Z/
end
