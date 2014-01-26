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

	def salir
		usuario_actual.update_attribute(:remember_token, 
			User.encrypt(User.new_remember_token))
		cookies.delete(:remember_token)
		self.usuario_actual=nil
	end
end
