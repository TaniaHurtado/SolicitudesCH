class SolicitudsController < ApplicationController
  before_action :set_solicitud, only: [:show, :edit, :update, :destroy]

  # GET /solicituds
  # GET /solicituds.json
  def index 
    @solicituds = Solicitud.where(user_id: current_user.id)
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
        format.html { redirect_to @solicitud, notice: 'Solicitud was successfully created.' }
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
    @solicitud.destroy
    respond_to do |format|
      format.html { redirect_to solicituds_url, notice: 'Solicitud eliminada.' }
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
      params.require(:solicitud).permit(:descripcion, :tipo, :importancia, :estado, :materiales, :fecha, :correo_responsable, :nombre_responsable, :lugar, :user_id, :ubicacion_id)
    end
end
