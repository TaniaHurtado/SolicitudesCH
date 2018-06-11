class UbicacionsController < ApplicationController
  before_action :set_ubicacion, only: [:show, :edit, :update, :destroy]

  # GET /ubicacions
  # GET /ubicacions.json
  def index
    @ubicacions = Ubicacion.all
    @users = User.where(:rol =>0)
  end

  # GET /ubicacions/1
  # GET /ubicacions/1.json
  def show
    @users = User.where(:rol =>0)
  end


  # GET /ubicacions/new
  def new
    @ubicacion = Ubicacion.new
    @users = User.where(:rol =>0)
  end

  # GET /ubicacions/1/edit
  def edit
    @users = User.where(:rol =>0)
  end

  # POST /ubicacions
  # POST /ubicacions.json
  def create
    @users = User.where(:rol =>0)   
    @ubicacion = Ubicacion.new(ubicacion_params)
    print "********************"
    print @ubicacion.user_ids
    respond_to do |format|
      if @ubicacion.save
        format.html { redirect_to @ubicacion, notice: 'Ubicación creada' }
        format.json { render :show, status: :created, location: @ubicacion }
      else
        format.html { render :new }
        format.json { render json: @ubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ubicacions/1
  # PATCH/PUT /ubicacions/1.json
  def update
    @users = User.where(:rol =>0)  
    
    respond_to do |format|
      if @ubicacion.update(ubicacion_params)
        format.html { redirect_to @ubicacion, notice: 'Ubicación actualizada' }
        format.json { render :show, status: :ok, location: @ubicacion }
      else
        format.html { render :edit }
        format.json { render json: @ubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ubicacions/1
  # DELETE /ubicacions/1.json
  def destroy
    @ubicacion.destroy
    respond_to do |format|
      format.html { redirect_to ubicacions_url, notice: 'Ubicación eliminada' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ubicacion
      @ubicacion = Ubicacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ubicacion_params
      params.require(:ubicacion).permit(:lugar, user_ids:[])
    end
end
