class SolicitudsController < ApplicationController
  before_action :set_solicitud, only: [:show, :edit, :update, :destroy]
  
  #Estados de solicitud:
  #Generada
  #Asignada
  #Aceptada
  #Realizada
  #Evaluada
  # GET /solicituds


  # GET /solicituds.json  
  def index 
    @solicituds = Solicitud.where(user_id: current_user.id)

     #Export to XLSX
     respond_to do |format|
      format.html
      format.xlsx{
        response.headers['Content-Disposition'] = 'attachment; filename="solicitudes.xlsx"'
      }
    end
    #@evaluacion = Evaluacion.where(solicitud_id: @solicituds.id)
  end
  # GET /solicituds/1
  # GET /solicituds/1.json
  def show
  end
  # GET /solicituds/new
  #def new
  #  @solicitud = Solicitud.new
  #end
  def place   
  end
  # GET /solicituds/1/edit
  def edit
  end
  
  #Enviar solicitud
  def send_solicitud_mail
    @solicitud=Solicitud.find(params[:id])
    @solicitud.estado="Asignada"
    @solicitud.fecha_notificada=Date.today
    @solicitud.save
    #@lugar = Ubicacion.find_by(lugar: params[:solicitud][:lugar])
    #@responsable = User.find(@lugar.user_id)
    #SendSolicitudMailer.send_solicitud(@solicitud).responsable
    redirect_to generated_solicitud_path
  end

  def admin_solicituds  
      @solicituds=Solicitud.all

      #Export to XLSX
      respond_to do |format|
      format.html
      format.xlsx{
        response.headers['Content-Disposition'] = 'attachment; filename="solicitudes.xlsx"'
      }
    end
  end

  #def order_date_solicituds
  #  @solictuds = Solicitud.order(:fecha)
  #end

  #def order_state_solicituds
  #  @solictuds = Solicitud.order(:estado)
  #end

  
  def responsable_solicituds   
    
    @solicituds=Solicitud.all
    
    @solicituds.each do |sol|
      print"dentro"
      sol.ubicacion.users.pluck(:id).each do |u_id|
        res=User.find(u_id)
        if res.email == current_user.email
          print sol.ubicacion.users.pluck(:id)#.map{|p| p.nombre}.to_sentence  
        end
      end
    end   

    # Ubicacion.find(@edificio[0]).user_ids
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @solicituds }
      format.xlsx{
        response.headers['Content-Disposition'] = 'attachment; filename="solicitudes.xlsx"'
      }
    end

  end

  def aceptar_solicitud
    @solicitud=Solicitud.find(params[:id])
    @solicitud.estado="Aceptada"
    @solicitud.fecha_aceptada=Date.today
print "*****************************"
    print @solicitud.fecha_aceptada
    @solicitud.save
    #@lugar = Ubicacion.find_by(lugar: params[:solicitud][:lugar])
    #@responsable = User.find(@lugar.user_id)
    #SendSolicitudMailer.send_solicitud(@solicitud).responsable
    redirect_to responsable_solicituds_path
  end

  def realizar_solicitud
    @solicitud=Solicitud.find(params[:id])
    @solicitud.estado="Realizada"
    @solicitud.fecha_realizada=Date.today
    @solicitud.save
    #@lugar = Ubicacion.find_by(lugar: params[:solicitud][:lugar])
    #@responsable = User.find(@lugar.user_id)
    #SendSolicitudMailer.send_solicitud(@solicitud).responsable
    redirect_to responsable_solicituds_path
  end



  def generated_solicitud
    @solicituds=Solicitud.where("user_id = ? AND estado = ?", current_user.id, "Generada")
  end

  def history_solicituds
    @solicituds=Solicitud.where("user_id = ? AND estado = ?", current_user.id, "Evaluada")
  end

  # GET /solicituds/1
  # GET /solicituds/1.json
  def show
    NotificationSolicitudMailer.send_solicitud(@solicitud).deliver
  end
  # GET /solicituds/new
  def new
    @solicituds_count=Solicitud.where("user_id = ? AND estado != ?", current_user.id, "Evaluada").count;
    if @solicituds_count < 11
    @solicitud = Solicitud.new
    else
      flash[:alert] = 'No puedes crear solicitudes si aún tienes más de 10 evaluaciones o solicitudes pendientes'
      redirect_to solicituds_path
      
    end
  end

  def place   
  end
  # GET /solicituds/1/edit
  def edit
  end
  # POST /solicituds
  # POST /solicituds.json
  def create
     
    #edificios= new Array(2)
    #.pluck(:id) devuelve un arreglo con los ids
    print "**************lugar********"
    #print params[:solicitud][:lugar]
    print params[:solicitud][:ubicacion_id]
    @solicitud = Solicitud.new(solicitud_params)
    @solicitud.estado="Generada"
    @solicitud.fecha_creada=Date.today



    respond_to do |format|
      if @solicitud.save
        format.html { redirect_to @solicitud, notice: 'La solicitud fue creada de manera exitosa' }
        format.json { render :show, status: :created, location: @solicitud }
         
      else
        format.html { render :new } 
        format.json { render json: @solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicituds/1
  # PATCH/PUT /solicituds/1.json
  def update
    
    respond_to do |format|
      @solicitud = Solicitud.find(params[:id])
      if @solicitud.update(solicitud_params)
        format.html { redirect_to @solicitud, notice: 'La solicitud fue actualizada de manera correcta' }
        format.json { render :show, status: :ok, location: @solicitud }
      else
        format.html { render :edit }
        format.json { render json: @solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicituds/1
  # DELETE /solicituds/1.json
  def destroy
    @solicitud = Solicitud.find(params[:id])
    @solicitud.destroy
    respond_to do |format|
      format.html { redirect_to solicituds_path, notice: 'Solicitud eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitud
      @solicitud = Solicitud.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solicitud_params
      params.require(:solicitud).permit(:descripcion, :tipo, :importancia, :estado, :materiales, :fecha, :lugar, :user_id, :ubicacion_id)
    end

    def filter_by_state
      print "Algo?"
    end
end
