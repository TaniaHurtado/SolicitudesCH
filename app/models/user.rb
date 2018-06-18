class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  validates_format_of :email, with: /\@unal\.edu\.co/, message: 'Debes ingresar un correo @unal.edu.co'      
  has_many :solicituds, dependent: :destroy
  has_and_belongs_to_many :ubicacions
  #validates :nombre,  :presence => true

	enum rol:{
	    "Responsable"  => 0,
	    "Solicitante" => 1,
	    "Admin" => 2	    
	  }

  def set_default_role
    self.rol ||= 1
  end

  
  def email_verified?
    if self.email
      if self.email.split('@')[1] == 'change-me.com'
        return false
      else
        return true
      end
    else
      return false
    end
  end
end
