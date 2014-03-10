class VariablesEntradaController < ApplicationController

def seism
	@problemas = proyecto_actual.problemas.paginate(page: params[:page])
	@manoobra = Manoobra.new
	@metodo = Metodo.new
	@maquina = Maquina.new
	@medioambiente = Medioambiente.new
	@material = Material.new
	@medicion = Medicion.new
end

end