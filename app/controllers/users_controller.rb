class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  #def index
  #  @users = User.all
  #end
  
  # Método para realizar login
  def login
    user = User.find_by(login: params[:login])

    if user&.authenticate(params[:senha]) # Verifica se o login e senha estão corretos
      session[:user_id] = user.id
      redirect_to root_path, notice: "Bem-vindo, #{user.nome}!"
    else
      flash[:alert] = "Login ou senha inválidos."
      redirect_to login_path
    end
  end

  # Método para realizar logout
  def logout
    session[:user_id] = nil
    redirect_to login_path, notice: "Você saiu da conta."
  end

  def index
    if params[:search].present?
      @users = User.where("nome LIKE ?", "%#{params[:search]}%")
    else
      @users = []  # Se não houver pesquisa, não retorna nenhum usuario
    end
  end

  def listUsers
    @users = User.all
  end


  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  #def create
   # @user = User.new(user_params)

   # respond_to do |format|
    #  if @user.save
    #    format.html { redirect_to @user, notice: "User was successfully created." }
    #    format.json { render :show, status: :created, location: @user }
    #  else
    #    format.html { render :new, status: :unprocessable_entity }
    #    format.json { render json: @user.errors, status: :unprocessable_entity }
    #  end
    #end
  #end

  def create
    # Verifica se o usuário já existe com base no e-mail
    if User.exists?(email: user_params[:email])
      flash[:alert] = "Este e-mail já está registrado. Por favor, tente outro."
      redirect_to new_user_path and return
    end
  
    @user = User.new(user_params)
  
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "Usuário criado com sucesso." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:nome, :login, :senha)
    end
end
