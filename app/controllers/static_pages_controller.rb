class StaticPagesController < ApplicationController
  def home
  	@proyect = usuario_actual.proyects.build if ingresado?
  end

  def help
  end

  def acerca_de
  end
  
  def contacto
  end

end
