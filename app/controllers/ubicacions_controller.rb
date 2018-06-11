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
    print "******************"
    #print @users.find(2).nombre
    @ubicacion = Ubicacion.new(ubicacion_params)
    #@ubicacion.users= params[:ubicacion][:users]
    #@ubicacion.save
    #print @ubicacion.users.find(2).nombre
    #@ubicacion.users = params[:ubicacion][:users]
    
    respond_to do |format|
      if @ubicacion.save
        format.html { redirect_to @ubicacion, notice: 'Ubicacion was successfully created.' }
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
    @users = User.all
    if params[:ubicacion][:user_ids]
      params[:ubicacion][:user_ids] = params[:ubicacion][:user_ids].map{|k, v| k}
    else
      params[:ubicacion][:user_ids] = []
    end
    respond_to do |format|
      if @ubicacion.update(ubicacion_params)
        format.html { redirect_to @ubicacion, notice: 'Ubicacion was successfully updated.' }
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
      format.html { redirect_to ubicacions_url, notice: 'Ubicacion was successfully destroyed.' }
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
