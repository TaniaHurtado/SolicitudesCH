class Ubicacion < ApplicationRecord
  has_and_belongs_to_many :users, dependent: :destroy
  #after_create :save_users

  def users=(value)
  	@users = value
  end
  #private
  #def save_users
  #	@users.each do |user_id|
  #		ubicacions_users.create(ubicacion_id: ubicacion_id, user_id: self.id)
  #	end
  #end
end

