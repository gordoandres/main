module SessionsHelper
	def ingreso(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.usuario_actual = user 
	end

	def ingresado?
		!usuario_actual.nil?
	end

	def usuario_actual=(user)
		@usuario_actual=user
	end

	def usuario_actual
		remember_token = User.encrypt(cookies[:remember_token])
		@usuario_actual ||=User.find_by(remember_token: remember_token)
	end

	def usuario_actual?(user)
		user == usuario_actual
	end

	def usuario_ingresado
		unless ingresado?
			store_location
			redirect_to ingreso_url, notice: "Por favor ingresa."
		end
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url if request.get?
	end

	def salir
		usuario_actual.update_attribute(:remember_token, 
			User.encrypt(User.new_remember_token))
		cookies.delete(:remember_token)
		self.usuario_actual=nil
	end

	def openii_proyect
		@proyect = usuario_actual.proyects.find(params[:format])
		session[:proyect_id] = @proyect.nombre
		
	end

	def proyecto_actual
		@proyect_id = session[:proyect_id]
		@proyect = usuario_actual.proyects.find_by nombre: @proyect_id
	end

	def problema_actual
		
	end



end
