class NotificationSolicitudMailer < ApplicationMailer
	default from: "pruebaunal2018@gmail.com"
  	default to: "pruebaunal2018@gmail.com"
	def send_solicitud(solicitud)
	    @solicitud = solicitud
	    @ubicacion = Ubicacion.find(@solicitud.ubicacion_id)
	    print @ubicacion.lugar 
	    @users = User.find(@ubicacion.user_ids)
	    print "enviando email a:"
	    @users.each do |u|
	    	print u.nombre
	    	mail(to: u.email, subject: 'Nueva solicitud Ciencias Humanas')
	    end
  	end
end
