import democraciaplena.Usuario
class BootStrap {

	def grailsApplication
    def init = { servletContext ->
		new Usuario(
			nome:'Administrador',
			email: 'adm@democraciaplena.org',
			tituloEleitor: '00',
			cpf: '00', 
			username: 'admin', 
			password: 'admin'
		).save(failOnError: true)
		
    }
    def destroy = {
    }
}
