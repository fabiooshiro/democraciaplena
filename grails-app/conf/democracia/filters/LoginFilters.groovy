package democracia.filters

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import democraciaplena.Usuario;

class LoginFilters {
	static USE_GOOGLE_USER = true
	def filters = {
		loginCheck(controller:'*', action:'*') {
			before = {
				if(controllerName.equals("appEngineReload") || (controllerName=="permissao" && actionName == "erro")){
					return true
				}
				if(USE_GOOGLE_USER){
					try{
						UserService userService = UserServiceFactory.getUserService();
						User user = userService.getCurrentUser();
						if (user == null) {
							redirect(url: userService.createLoginURL("/"));
						}
						def usuario = Usuario.findWhere(email: user.getEmail())
						if(!usuario){
							usuario = new Usuario(
								nome: user.getNickname(),
								email: user.getEmail(),
								username: user.getEmail(),
								password: 'inicial'
							).save(failOnError: true)
						}
						session.usuario = usuario
						if(usuario.autorizado){
							return true
						}else{
							redirect(controller: 'permissao', action: 'erro')
							return false
						}
					}catch(e){
						e.printStackTrace()
						return false
					}
				}else{
					if(!session.usuario && !actionName.equals('login') && !controllerName.equals("usuario")) {
					   redirect(controller:'usuario', action:'login')
					   return false
					}
				}
				
			}
		}
	}
}
