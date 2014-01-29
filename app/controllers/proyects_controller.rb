class ProyectsController < ApplicationController
	before_action :usuario_ingresado, only: [:create, :destroy]

	def index
		
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
		
	end

	 private

    def proyect_params
      params.require(:proyect).permit(:nombre)
    end
end