

package democraciaplena

class VotoController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ votoInstanceList: Voto.list( params ), votoInstanceTotal: Voto.count() ]
    }

    def show = {
        def votoInstance = Voto.getByKey( params.id )

        if(!votoInstance) {
            flash.message = "Voto not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ votoInstance : votoInstance ] }
    }

    def delete = {
		Voto.withTransaction {
	        def votoInstance = Voto.getByKey( params.id )
	        if(votoInstance) {
	            try {
	                votoInstance.delete(flush:true)
	                flash.message = "Voto ${params.id} deleted"
	                redirect(action:list)
	            }
	            catch(org.springframework.dao.DataIntegrityViolationException e) {
	                flash.message = "Voto ${params.id} could not be deleted"
	                redirect(action:show,id:params.id)
	            }
	        }
	        else {
	            flash.message = "Voto not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def edit = {
        def votoInstance = Voto.getByKey( params.id )

        if(!votoInstance) {
            flash.message = "Voto not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ votoInstance : votoInstance ]
        }
    }

    def update = {
		Voto.withTransaction {
	        def votoInstance = Voto.getByKey( params.id )
	        if(votoInstance) {
	            if(params.version) {
	                def version = params.version.toLong()
	                if(votoInstance.version > version) {
	                    
	                    votoInstance.errors.rejectValue("version", "voto.optimistic.locking.failure", "Another user has updated this Voto while you were editing.")
	                    render(view:'edit',model:[votoInstance:votoInstance])
	                    return
	                }
	            }
	            votoInstance.properties = params
	            if(!votoInstance.hasErrors() && votoInstance.save()) {
	                flash.message = "Voto ${params.id} updated"
	                redirect(action:show,id:votoInstance.id)
	            }
	            else {
	                render(view:'edit',model:[votoInstance:votoInstance])
	            }
	        }
	        else {
	            flash.message = "Voto not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def create = {
        def votoInstance = new Voto()
        votoInstance.properties = params
        return ['votoInstance':votoInstance]
    }

    def save = {
        def votoInstance = new Voto(params)
		Voto.withTransaction {
	        if(votoInstance.save(flush:true)) {
	            flash.message = "Voto ${votoInstance.id} created"
	            redirect(action:show,id:votoInstance.id)
	        }
	        else {
	            render(view:'create',model:[votoInstance:votoInstance])
	        }
		}
    }
}
