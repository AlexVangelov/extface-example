class Shop < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, authentication_keys: [:name]#, :validatable
  has_extface_devices
  belongs_to :extface_device, class_name: 'Extface::Device'
  
  validates_presence_of :name
end
