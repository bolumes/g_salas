class EventoSalasController < ApplicationController
  before_action :set_evento_sala, only: %i[ show edit update destroy ]

  # GET /evento_salas or /evento_salas.json
  def index
    @evento_salas = EventoSala.all
  end

  # GET /evento_salas/1 or /evento_salas/1.json
  def show
  end

  # GET /evento_salas/new
  def new
    @evento_sala = EventoSala.new
  end

  # GET /evento_salas/1/edit
  def edit
  end

  # POST /evento_salas or /evento_salas.json
  def create
    @evento_sala = EventoSala.new(evento_sala_params)

    respond_to do |format|
      if @evento_sala.save
        format.html { redirect_to @evento_sala, notice: "Evento sala was successfully created." }
        format.json { render :show, status: :created, location: @evento_sala }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @evento_sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evento_salas/1 or /evento_salas/1.json
  def update
    respond_to do |format|
      if @evento_sala.update(evento_sala_params)
        format.html { redirect_to @evento_sala, notice: "Evento sala was successfully updated." }
        format.json { render :show, status: :ok, location: @evento_sala }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @evento_sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evento_salas/1 or /evento_salas/1.json
  def destroy
    @evento_sala.destroy!

    respond_to do |format|
      format.html { redirect_to evento_salas_path, status: :see_other, notice: "Evento sala was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento_sala
      @evento_sala = EventoSala.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def evento_sala_params
      params.require(:evento_sala).permit(:sala_id, :evento_id)
    end
end
