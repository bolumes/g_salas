class SalasController < ApplicationController
  before_action :set_sala, only: %i[ show edit update destroy ]

  def estadisticas
    # Agrupa as salas por edifício e conta a quantidade de salas em cada
    @estatisticas_edificios = Sala.group(:edificio).count

    # Separa os dados para serem utilizados na view
    @edificios = @estatisticas_edificios.keys
    @quantidades = @estatisticas_edificios.values
  rescue StandardError => e
    # Renderiza mensagem de erro em caso de problema
    flash[:error] = "Problema ao calcular estatísticas! Contate o administrador: #{e.message}"
    @edificios = []
    @quantidades = []
  end

  def salas_edificio
  end

  # GET /salas or /salas.json
  def index
    @salas = Sala.all
  end

  # GET /salas/1 or /salas/1.json
  def show
  end

  # GET /salas/new
  def new
    @sala = Sala.new
  end

  # GET /salas/1/edit
  def edit
  end

  # POST /salas or /salas.json
  def create
    @sala = Sala.new(sala_params)

    respond_to do |format|
      if @sala.save
        format.html { redirect_to @sala, notice: "Sala was successfully created." }
        format.json { render :show, status: :created, location: @sala }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salas/1 or /salas/1.json
  def update
    respond_to do |format|
      if @sala.update(sala_params)
        format.html { redirect_to @sala, notice: "Sala was successfully updated." }
        format.json { render :show, status: :ok, location: @sala }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salas/1 or /salas/1.json
  def destroy
    @sala.destroy!

    respond_to do |format|
      format.html { redirect_to salas_path, status: :see_other, notice: "Sala was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sala
      @sala = Sala.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sala_params
      params.require(:sala).permit(:nome, :capacidade, :projetor, :dispo, :edificio_id)
    end
end
