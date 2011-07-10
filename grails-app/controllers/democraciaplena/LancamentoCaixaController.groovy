

package democraciaplena

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

class LancamentoCaixaController {
    
	def jpaTemplate
	
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ lancamentoCaixaInstanceList: LancamentoCaixa.list( params ), lancamentoCaixaInstanceTotal: LancamentoCaixa.count() ]
    }

    def show = {
		def lancamentoCaixaInstance = LancamentoCaixa.getByKey(params.id)
        if(!lancamentoCaixaInstance) {
            flash.message = "LancamentoCaixa not found with id '${params.id}'"
            redirect(action:list)
        }
        else { return [ lancamentoCaixaInstance : lancamentoCaixaInstance ] }
    }

    def delete = {
		LancamentoCaixa.withTransaction {
	        def lancamentoCaixaInstance = LancamentoCaixa.getByKey( params.id )
	        if(lancamentoCaixaInstance) {
	            try {
	                lancamentoCaixaInstance.delete(flush:true)
	                flash.message = "LancamentoCaixa ${params.id} deleted"
	                redirect(action:list)
	            }
	            catch(org.springframework.dao.DataIntegrityViolationException e) {
	                flash.message = "LancamentoCaixa ${params.id} could not be deleted"
	                redirect(action:show,id:params.id)
	            }
	        }
	        else {
	            flash.message = "LancamentoCaixa not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def edit = {
        def lancamentoCaixaInstance = LancamentoCaixa.getByKey( params.id )

        if(!lancamentoCaixaInstance) {
            flash.message = "LancamentoCaixa not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ lancamentoCaixaInstance : lancamentoCaixaInstance ]
        }
    }

    def update = {
		LancamentoCaixa.withTransaction {
	        def lancamentoCaixaInstance = LancamentoCaixa.getByKey( params.id )
	        if(lancamentoCaixaInstance) {
	            if(params.version) {
	                def version = params.version.toLong()
	                if(lancamentoCaixaInstance.version > version) {
	                    
	                    lancamentoCaixaInstance.errors.rejectValue("version", "lancamentoCaixa.optimistic.locking.failure", "Another user has updated this LancamentoCaixa while you were editing.")
	                    render(view:'edit',model:[lancamentoCaixaInstance:lancamentoCaixaInstance])
	                    return
	                }
	            }
	            lancamentoCaixaInstance.properties = params
	            if(!lancamentoCaixaInstance.hasErrors() && lancamentoCaixaInstance.save()) {
	                flash.message = "LancamentoCaixa ${params.id} updated"
	                redirect(action:show,id:lancamentoCaixaInstance.id)
	            }
	            else {
	                render(view:'edit',model:[lancamentoCaixaInstance:lancamentoCaixaInstance])
	            }
	        }
	        else {
	            flash.message = "LancamentoCaixa not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def create = {
        def lancamentoCaixaInstance = new LancamentoCaixa()
        lancamentoCaixaInstance.properties = params
        return ['lancamentoCaixaInstance':lancamentoCaixaInstance]
    }

    def save = {
        def lancamentoCaixaInstance = new LancamentoCaixa(params)
		
		LancamentoCaixa.withTransaction {
	        if(lancamentoCaixaInstance.save(flush:true)) {
	            flash.message = "LancamentoCaixa created"
	            redirect(action:show,id:lancamentoCaixaInstance.id)
	        }
	        else {
	            render(view:'create',model:[lancamentoCaixaInstance:lancamentoCaixaInstance])
	        }
		}
    }
}
