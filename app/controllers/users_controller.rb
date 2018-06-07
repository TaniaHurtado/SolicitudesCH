class UsersController < ApplicationController
	before_action :authenticate_user!
	after_action :verify_authorized
	#before_action :set_user, only: [:show, :edit, :update]
	def finish_signup
		if request.patch? && params[:user] # Revisa si el request es de tipo patch, es decir, llenaron el formulario y lo ingresaron
			@user = User.find(params[:id])
			if @user.update(user_params)
				sign_in(@user, :bypass => true)
				redirect_to welcome_index_path
			else
				@show_errors = true
			end
		end
	end




	def create
	end

	def new
		
	end

	def index
		#redirect_to not_authorized_path if !current_user.try(:Admin?)
		@users = User.where.not(:id => current_user.id)
		authorize @users
	end

	def show
		@user = User.find(params[:id])
	end

	def responsable_solicituds
		if current_user.rol == 0
      		@solicitudes=Solicitud.where(correo_responsable: current_user.email)
    #  		@solicitudes.push @solicitud
		end
	end



	def destroyUser
		@user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Usuario eliminado correctamente"
      redirect_to users_path
    end
		authorize @user
	end

	def update		
	  #@user = User.find(params[:id])
	  #print "**************************"
	  #@user.rol = params[:user][:rol].gsub(/\D/, '').to_i
	  #@user.save
	  #print @user.rol
      
      #if @user.update(user_params)
      #   redirect_to users_path, notice: 'Información actualizada' 
        
      #else
       #render 'edit' 
      #end
       respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

      authorize @user
    end


	def edit	
	#if policy(current_user).admin?	
		@user = User.find(params[:id])
		print @user.nombre
		
		
		authorize @user
	#end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

	private
	def user_params
	    #accessible = [ :id, :nombre, :email, :cargo, :dependencia, :rol] # extend with your own params
	    #accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
	    params.require(:user).permit(:id, :nombre, :apellido, :telefono, :email, :cargo, :dependencia,  params[:user][:rol].to_i)
	  end
end
