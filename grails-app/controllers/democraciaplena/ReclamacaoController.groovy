

package democraciaplena

class ReclamacaoController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ reclamacaoInstanceList: Reclamacao.list( params ), reclamacaoInstanceTotal: Reclamacao.count() ]
    }
    
    def discordo = {
        def reclamacaoInstance = Reclamacao.get(params.id)
        if(!reclamacaoInstance) {
            flash.message = "Reclamacao not found with id ${params.id}"
            redirect(action:list)
        }else{
            def usuario = Usuario.get(session.usuario.id)
            def voto = Voto.findWhere(reclamacaoId: reclamacaoInstance.id, usuarioId: usuario.id)
            if(!voto){
                println("novo voto")
                new Voto(reclamacao: reclamacaoInstance, usuario: usuario, positivo: false).save(failOnError: true)
            }else{
                voto.positivo = false
                voto.save(failOnError: true)
            }
            redirect(action:show, params:[id: params.id])
        }
    }
    
    def concordo = {
        def reclamacaoInstance = Reclamacao.get(params.id)
        if(!reclamacaoInstance) {
            flash.message = "Reclamacao not found with id ${params.id}"
            redirect(action:list)
        }else{
            def usuario = Usuario.get(session.usuario.id)
            def voto = Voto.findWhere(reclamacaoId: reclamacaoInstance.id, usuarioId: usuario.id)
            if(!voto){
                println("novo voto")
                new Voto(reclamacao: reclamacaoInstance, usuario: usuario, positivo: true).save(failOnError: true)
            }else{
                voto.positivo = true
                voto.save(failOnError: true)
            }
            redirect(action:show, params:[id: params.id])
        }
    }

    def show = {
        def reclamacaoInstance = Reclamacao.get( params.id )

        if(!reclamacaoInstance) {
            flash.message = "Reclamacao not found with id ${params.id}"
            redirect(action:list)
        } else { 
            def votoList = Voto.findAllWhere(reclamacaoId: reclamacaoInstance.id)
            return [ reclamacaoInstance : reclamacaoInstance, votoList: votoList ] 
        }
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
			reclamacaoInstance.usuario = Usuario.get(session.usuario.id)
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
