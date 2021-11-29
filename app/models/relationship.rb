class Relationship < ApplicationRecord
  belongs_to :partner_1, foreign_key: 'partner_1_id', class_name: 'User'
  belongs_to :partner_2, foreign_key: 'partner_2_id', class_name: 'User'

  # def affinity_color_2
  #   case affinity
  #   when 0 then "rgba(12,12,12,1)"
  #   end
  # end

  def affinity_color(saturation: "50%", luminosity: "50%")
    "hsl(#{285 + (affinity * 5)}, #{saturation}, #{luminosity})"
  end
end
