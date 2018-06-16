class EvaluacionsController < ApplicationController
  before_action :set_evaluacion, only: [:show, :edit, :update, :destroy]

  # GET /evaluacions
  # GET /evaluacions.json
  def index
    #@solicitud = Solicitud.find_by_id(@evaluacion.solicitud_id)    
    @solicitud = Solicitud.find(params[:solicitud_id])
    @evaluacions = Evaluacion.where(solicitud_id: @solicitud.id)
    
    
  end


  def solicitud_evaluada
    #@evaluacion = Evaluacion.find(params[:id])
    #@solicitud = Solicitud.find_by_id(@evaluacion.solicitud_id)    
    @solicitud = Solicitud.find(params[:id])   
    #@evaluacion = Evaluacion.Evaluacion.where(solicitud_id: @solicitud.id)


    @solicitud.estado="Evaluada"
    @solicitud.save

    redirect_to solicituds_path
  end
  # GET /evaluacions/1
  # GET /evaluacions/1.json
  def show
  end

  # GET /evaluacions/new
  def new
    @solicitud = Solicitud.find(params[:solicitud_id])
      print"*****************solicitud en obs new"
    print @solicitud.descripcion
    @evaluacion = Evaluacion.new
  end

  # GET /evaluacions/1/edit
  def edit
    @solicitud = Solicitud.find(params[:solicitud_id])
  end

  # POST /evaluacions
  # POST /evaluacions.json
  def create
    @solicitud = Solicitud.find(params[:solicitud_id])
    print"*****************solicitud en obs"
    print @solicitud.descripcion
    @evaluacion = Evaluacion.new(evaluacion_params)

    #respond_to do |format|
      if @evaluacion.save        
       
        if @solicitud.estado == "Evaluada"
          redirect_to solicituds_path
        else
           redirect_to solicitud_evaluada_path(@solicitud)
        end
        #format.html { redirect_to solicitud_evaluacions_path, notice: 'La evaluación fue creada' }
       # format.json { render :show, status: :created, location:solicitud_evaluacions_path }
      #else
      #  format.html { render :new }
      #  format.json { render json: @evaluacion.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /evaluacions/1
  # PATCH/PUT /evaluacions/1.json
  def update
    @solicitud = Solicitud.find(params[:solicitud_id])
    respond_to do |format|
      if @evaluacion.update(evaluacion_params)
        format.html { redirect_to solicitud_evaluacions_path, notice: 'La evaluación fue actualizada' }
        format.json { render :show, status: :ok, location: solicitud_evaluacions_path }
      else
        format.html { render :edit }
        format.json { render json: @evaluacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluacions/1
  # DELETE /evaluacions/1.json
  def destroy
    @evaluacion.destroy
    respond_to do |format|
      format.html { redirect_to evaluacions_url, notice: 'Evaluacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluacion
      @evaluacion = Evaluacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluacion_params
      params.require(:evaluacion).permit(:calificacion, :obervacion, :solicitud_id)
    end
end
