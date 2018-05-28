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
    #@evaluacion = Evaluacion.where(solicitud_id: @solicituds.id)
  end
  # GET /solicituds/1
  # GET /solicituds/1.json
  def show
  end
  # GET /solicituds/new
  def new
    @solicitud = Solicitud.new
  end
  def place   
  end
  # GET /solicituds/1/edit
  def edit
  end
  #Enviar solicitud
  def send_solicitud_mail
    @solicitud=Solicitud.find(params[:id])
    @solicitud.estado="Asignada"
    @solicitud.save
    #@lugar = Ubicacion.find_by(lugar: params[:solicitud][:lugar])
    #@responsable = User.find(@lugar.user_id)
    #SendSolicitudMailer.send_solicitud(@solicitud).responsable
    redirect_to generated_solicitud_path
  end


  def responsable_solicituds
   
   #if current_user.rol == 0
      @solicituds=Solicitud.where(correo_responsable: current_user.email)
   #end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @solicituds }
    end

  end

  def aceptar_solicitud
    @solicitud=Solicitud.find(params[:id])
    @solicitud.estado="Aceptada"
    @solicitud.save
    #@lugar = Ubicacion.find_by(lugar: params[:solicitud][:lugar])
    #@responsable = User.find(@lugar.user_id)
    #SendSolicitudMailer.send_solicitud(@solicitud).responsable
    redirect_to responsable_solicituds_path
  end

  def realizar_solicitud
    @solicitud=Solicitud.find(params[:id])
    @solicitud.estado="Realizada"
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

  # POST /solicituds
  # POST /solicituds.json
  def create
    @lugar = Ubicacion.find_by(lugar: params[:solicitud][:lugar])
    @responsable = User.find(@lugar.user_id)
    
    #@solicitud = Solicitud.new(descripcion: params[:solicitud][:descripcion], tipo: params[:solicitud][:tipo], importancia: params[:solicitud][:importancia], estado: 'Generada', materiales: params[:solicitud][:materiales], fecha: params[:solicitud][:fecha], correo_responsable: "mauricio", nombre_responsable: "Mauricio", lugar: params[:solicitud][:lugar], user_id: current_user.id)
    @solicitud = Solicitud.new(solicitud_params)
    @solicitud.estado="Generada"
    @solicitud.ubicacion_id = @lugar.id
    @solicitud.nombre_responsable=@responsable.nombre
    @solicitud.correo_responsable=@responsable.email
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
      if @solicitud.update(params)
        #format.html { redirect_to @solicitud, notice: 'Solicitud was successfully updated.' }
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
      params.require(:solicitud).permit(:descripción, :tipo, :importancía, :estado, :materiales, :fecha, :correo_responsable, :nombre_responsable, :lugar, :user_id, :ubicacion_id)
    end
end
