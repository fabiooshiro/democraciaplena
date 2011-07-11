

package democraciaplena

class ReclamacaoController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ reclamacaoInstanceList: Reclamacao.list( params ), reclamacaoInstanceTotal: Reclamacao.count() ]
    }

    def show = {
        def reclamacaoInstance = Reclamacao.get( params.id )

        if(!reclamacaoInstance) {
            flash.message = "Reclamacao not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ reclamacaoInstance : reclamacaoInstance ] }
    }

    def delete = {
		Reclamacao.withTransaction {
	        def reclamacaoInstance = Reclamacao.get( params.id )
	        if(reclamacaoInstance) {
	            try {
	                reclamacaoInstance.delete(flush:true)
	                flash.message = "Reclamacao ${params.id} deleted"
	                redirect(action:list)
	            }
	            catch(org.springframework.dao.DataIntegrityViolationException e) {
	                flash.message = "Reclamacao ${params.id} could not be deleted"
	                redirect(action:show,id:params.id)
	            }
	        }
	        else {
	            flash.message = "Reclamacao not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def edit = {
        def reclamacaoInstance = Reclamacao.get( params.id )

        if(!reclamacaoInstance) {
            flash.message = "Reclamacao not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ reclamacaoInstance : reclamacaoInstance ]
        }
    }

    def update = {
		Reclamacao.withTransaction {
	        def reclamacaoInstance = Reclamacao.get( params.id )
	        if(reclamacaoInstance) {
	            if(params.version) {
	                def version = params.version.toLong()
	                if(reclamacaoInstance.version > version) {
	                    
	                    reclamacaoInstance.errors.rejectValue("version", "reclamacao.optimistic.locking.failure", "Another user has updated this Reclamacao while you were editing.")
	                    render(view:'edit',model:[reclamacaoInstance:reclamacaoInstance])
	                    return
	                }
	            }
	            reclamacaoInstance.properties = params
	            if(!reclamacaoInstance.hasErrors() && reclamacaoInstance.save()) {
	                flash.message = "Reclamacao ${params.id} updated"
	                redirect(action:show,id:reclamacaoInstance.id)
	            }
	            else {
	                render(view:'edit',model:[reclamacaoInstance:reclamacaoInstance])
	            }
	        }
	        else {
	            flash.message = "Reclamacao not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def create = {
        def reclamacaoInstance = new Reclamacao()
        reclamacaoInstance.properties = params
        return ['reclamacaoInstance':reclamacaoInstance]
    }

    def save = {
        def reclamacaoInstance = new Reclamacao(params)
		Reclamacao.withTransaction {
	        if(reclamacaoInstance.save(flush:true)) {
	            flash.message = "Reclamacao ${reclamacaoInstance.id} created"
	            redirect(action:show,id:reclamacaoInstance.id)
	        }
	        else {
	            render(view:'create',model:[reclamacaoInstance:reclamacaoInstance])
	        }
		}
    }
}
