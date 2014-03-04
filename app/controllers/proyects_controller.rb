class ProyectsController < ApplicationController
	before_action :usuario_ingresado, only: [:create, :destroy]
	before_action :usuario_correcto, only: :destroy 

	def index
	end

	def openii_proyect
		
		@proyect = usuario_actual.proyects.find(params[:format])
	end
 

	def create
	    @proyect = usuario_actual.proyects.build(proyect_params)
	    if @proyect.save
	      flash[:success] = "Proyecto creado!"
	      redirect_to root_url
	    else
	      @feed_items = []
	      render 'static_pages/home'
	    end
	end

	def destroy
		@proyect.destroy
		redirect_to root_url
	end

	 private

    def proyect_params
      params.require(:proyect).permit(:nombre)
    end

    def usuario_correcto
    	@proyect = usuario_actual.proyects.find_by(id: params[:id])
    rescue
    	redirect_to root_url if @proyect.nil?
    end
end