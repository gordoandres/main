class UsersController < ApplicationController

  before_action :usuario_ingresado, only: [:index, :edit, :update]
  before_action :usuario_correcto, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      ingreso @user
      flash[:success] = "Bienvenido a Openii!"
      redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
  #  @user = User.find(params[:id])
  end

  def update
  #  @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success]="Perfil actualizado"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password,
  		:password_confirmation)
  end

  # Antes de los filtros

  def usuario_ingresado
    unless ingresado?
      store_location
      redirect_to ingreso_url, notice: "Por favor registrate."
    end
  end

  def usuario_correcto
    @user = User.find(params[:id])
    redirect_to(root_url) unless usuario_actual?(@user)
  end
end
