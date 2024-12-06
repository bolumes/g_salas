class FormacaosController < ApplicationController
  before_action :set_formacao, only: %i[ show edit update destroy ]

  # GET /formacaos or /formacaos.json
  def index
    @formacaos = Formacao.all
  end

  # GET /formacaos/1 or /formacaos/1.json
  def show
  end

  # GET /formacaos/new
  def new
    @formacao = Formacao.new
  end

  # GET /formacaos/1/edit
  def edit
  end

  # POST /formacaos or /formacaos.json
  def create
    @formacao = Formacao.new(formacao_params)

    respond_to do |format|
      if @formacao.save
        format.html { redirect_to @formacao, notice: "Formacao was successfully created." }
        format.json { render :show, status: :created, location: @formacao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @formacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formacaos/1 or /formacaos/1.json
  def update
    respond_to do |format|
      if @formacao.update(formacao_params)
        format.html { redirect_to @formacao, notice: "Formacao was successfully updated." }
        format.json { render :show, status: :ok, location: @formacao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @formacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formacaos/1 or /formacaos/1.json
  def destroy
    @formacao.destroy!

    respond_to do |format|
      format.html { redirect_to formacaos_path, status: :see_other, notice: "Formacao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formacao
      @formacao = Formacao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def formacao_params
      params.require(:formacao).permit(:nome, :descricao)
    end
end
