class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :solicituds, dependent: :destroy
  has_many :ubicacions, dependent: :destroy
  #validates :nombre,  :presence => true

	enum role:{
	    "Responsable"  => 0,
	    "Solicitante" => 1,
	    "Admin" => 2
	    
	  }

end
