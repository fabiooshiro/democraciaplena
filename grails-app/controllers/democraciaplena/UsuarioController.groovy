

package democraciaplena

import org.springframework.orm.jpa.JpaTemplate;

class UsuarioController {
    
	def jpaTemplate
	
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ usuarioInstanceList: Usuario.list( params ), usuarioInstanceTotal: Usuario.count() ]
    }

    def show = {
        def usuarioInstance = Usuario.get( params.id )

        if(!usuarioInstance) {
            flash.message = "Usuario not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ usuarioInstance : usuarioInstance ] }
    }

    def delete = {
		Usuario.withTransaction {
	        def usuarioInstance = Usuario.get( params.id )
	        if(usuarioInstance) {
	            try {
	                usuarioInstance.delete(flush:true)
	                flash.message = "Usuario ${params.id} deleted"
	                redirect(action:list)
	            }
	            catch(org.springframework.dao.DataIntegrityViolationException e) {
	                flash.message = "Usuario ${params.id} could not be deleted"
	                redirect(action:show,id:params.id)
	            }
	        }
	        else {
	            flash.message = "Usuario not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def edit = {
        def usuarioInstance = Usuario.get( params.id )

        if(!usuarioInstance) {
            flash.message = "Usuario not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ usuarioInstance : usuarioInstance ]
        }
    }

    def update = {
		Usuario.withTransaction {
	        def usuarioInstance = Usuario.get( params.id )
	        if(usuarioInstance) {
	            if(params.version) {
	                def version = params.version.toLong()
	                if(usuarioInstance.version > version) {
	                    
	                    usuarioInstance.errors.rejectValue("version", "usuario.optimistic.locking.failure", "Another user has updated this Usuario while you were editing.")
	                    render(view:'edit',model:[usuarioInstance:usuarioInstance])
	                    return
	                }
	            }
	            usuarioInstance.properties = params
	            if(!usuarioInstance.hasErrors() && usuarioInstance.save()) {
	                flash.message = "Usuario ${params.id} updated"
	                redirect(action:show,id:usuarioInstance.id)
	            }
	            else {
	                render(view:'edit',model:[usuarioInstance:usuarioInstance])
	            }
	        }
	        else {
	            flash.message = "Usuario not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def create = {
        def usuarioInstance = new Usuario()
        usuarioInstance.properties = params
        return ['usuarioInstance':usuarioInstance]
    }

    def save = {
        def usuarioInstance = new Usuario(params)
		Usuario.withTransaction {
			
	        //if(usuarioInstance.save(flush:true)) {
			if(!usuarioInstance.hasErrors() && usuarioInstance.validate()) {
				jpaTemplate.persist(usuarioInstance)
				jpaTemplate.flush()
	            flash.message = "Usuario ${usuarioInstance.id} created"
	            redirect(action:show,id:usuarioInstance.id)
	        }
	        else {
	            render(view:'create',model:[usuarioInstance:usuarioInstance])
	        }
		}
    }
}
