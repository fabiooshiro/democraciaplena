package democracia.filters

class LoginFilters {
	def filters = {
		loginCheck(controller:'*', action:'*') {
			before = {
			   if(!session.usuario && !actionName.equals('login')) {
				   redirect(controller:'usuario', action:'login')
				   return false
				}
			}
		}
	}
}
