

package democraciaplena

class MatrizPrioridadeVotoController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ matrizPrioridadeVotoInstanceList: MatrizPrioridadeVoto.list( params ), matrizPrioridadeVotoInstanceTotal: MatrizPrioridadeVoto.count() ]
    }

    def show = {
        def matrizPrioridadeVotoInstance = MatrizPrioridadeVoto.get( params.id )

        if(!matrizPrioridadeVotoInstance) {
            flash.message = "MatrizPrioridadeVoto not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ matrizPrioridadeVotoInstance : matrizPrioridadeVotoInstance ] }
    }

    def delete = {
		MatrizPrioridadeVoto.withTransaction {
	        def matrizPrioridadeVotoInstance = MatrizPrioridadeVoto.get( params.id )
	        if(matrizPrioridadeVotoInstance) {
	            try {
	                matrizPrioridadeVotoInstance.delete(flush:true)
	                flash.message = "MatrizPrioridadeVoto ${params.id} deleted"
	                redirect(action:list)
	            }
	            catch(org.springframework.dao.DataIntegrityViolationException e) {
	                flash.message = "MatrizPrioridadeVoto ${params.id} could not be deleted"
	                redirect(action:show,id:params.id)
	            }
	        }
	        else {
	            flash.message = "MatrizPrioridadeVoto not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def edit = {
        def matrizPrioridadeVotoInstance = MatrizPrioridadeVoto.get( params.id )
        if(!matrizPrioridadeVotoInstance) {
            flash.message = "MatrizPrioridadeVoto not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ matrizPrioridadeVotoInstance : matrizPrioridadeVotoInstance ]
        }
    }

    def update = {
		MatrizPrioridadeVoto.withTransaction {
	        def matrizPrioridadeVotoInstance = MatrizPrioridadeVoto.get( params.id )
	        if(matrizPrioridadeVotoInstance) {
	            if(params.version) {
	                def version = params.version.toLong()
	                if(matrizPrioridadeVotoInstance.version > version) {
	                    
	                    matrizPrioridadeVotoInstance.errors.rejectValue("version", "matrizPrioridadeVoto.optimistic.locking.failure", "Another user has updated this MatrizPrioridadeVoto while you were editing.")
	                    render(view:'edit',model:[matrizPrioridadeVotoInstance:matrizPrioridadeVotoInstance])
	                    return
	                }
	            }
	            matrizPrioridadeVotoInstance.properties = params
	            if(!matrizPrioridadeVotoInstance.hasErrors() && matrizPrioridadeVotoInstance.save()) {
	                flash.message = "MatrizPrioridadeVoto ${params.id} updated"
	                redirect(action:show,id:matrizPrioridadeVotoInstance.id)
	            }
	            else {
	                render(view:'edit',model:[matrizPrioridadeVotoInstance:matrizPrioridadeVotoInstance])
	            }
	        }
	        else {
	            flash.message = "MatrizPrioridadeVoto not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def create = {
		def usuario = Usuario.get(session.usuario.id)
		def voto
		if(params['problema.id']){
			voto = MatrizPrioridadeVoto.findWhere(problemaId: Long.valueOf(params['problema.id']), usuarioId: usuario.id)
		}
		if(voto){
			redirect(action: 'edit', id: voto.id)
		}else{
	        def matrizPrioridadeVotoInstance = new MatrizPrioridadeVoto()
	        matrizPrioridadeVotoInstance.properties = params
	        return ['matrizPrioridadeVotoInstance':matrizPrioridadeVotoInstance]
		}
    }

    def save = {
        def matrizPrioridadeVotoInstance = new MatrizPrioridadeVoto(params)
		MatrizPrioridadeVoto.withTransaction {
			def usuario = Usuario.get(session.usuario.id)
			matrizPrioridadeVotoInstance.usuario = usuario
	        if(matrizPrioridadeVotoInstance.save(flush:true)) {
	            flash.message = "MatrizPrioridadeVoto ${matrizPrioridadeVotoInstance.id} created"
	            redirect(action:show,id:matrizPrioridadeVotoInstance.id)
	        }
	        else {
	            render(view:'create',model:[matrizPrioridadeVotoInstance:matrizPrioridadeVotoInstance])
	        }
		}
    }
}
