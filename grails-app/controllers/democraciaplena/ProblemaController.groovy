package democraciaplena

class ProblemaController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 100,  200)
		
		def problemaInstanceList = Problema.list()
		def votosMap = [:]
		problemaInstanceList.each{ problema ->
			def pVoto = [simplicidade: 0, dependencia: 0, tempo: 0, beneficio: 0, probabilidade: 0, total: 0]
			MatrizPrioridadeVoto.findAllWhere(problemaId: problema.id).each{ voto ->
				pVoto.simplicidade += voto.simplicidade
				pVoto.dependencia += voto.dependencia
				pVoto.tempo += voto.tempo
				pVoto.beneficio += voto.beneficio
				pVoto.probabilidade += voto.probabilidade
				pVoto.total += (voto.simplicidade + voto.dependencia + voto.tempo + voto.beneficio + voto.probabilidade)  
			}
			votosMap.put('' + problema.id, pVoto)
		}
		problemaInstanceList.sort{ a, b ->
			votosMap.get('' + b.id).total - votosMap.get('' + a.id).total
		}
        [ problemaInstanceList: problemaInstanceList, problemaInstanceTotal: Problema.count(), votosMap: votosMap ]
    }

    def show = {
        def problemaInstance = Problema.get( params.id )
        if(!problemaInstance) {
            flash.message = "Problema not found with id ${params.id}"
            redirect(action:list)
        } else { 
			return [ problemaInstance : problemaInstance ] 
		}
    }

    def delete = {
		Problema.withTransaction {
	        def problemaInstance = Problema.get( params.id )
	        if(problemaInstance) {
	            try {
	                problemaInstance.delete(flush:true)
	                flash.message = "Problema ${params.id} deleted"
	                redirect(action:list)
	            }
	            catch(org.springframework.dao.DataIntegrityViolationException e) {
	                flash.message = "Problema ${params.id} could not be deleted"
	                redirect(action:show,id:params.id)
	            }
	        }
	        else {
	            flash.message = "Problema not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def edit = {
        def problemaInstance = Problema.get( params.id )

        if(!problemaInstance) {
            flash.message = "Problema not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ problemaInstance : problemaInstance ]
        }
    }

    def update = {
		Problema.withTransaction {
	        def problemaInstance = Problema.get( params.id )
	        if(problemaInstance) {
				def usuario = Usuario.get(session.usuario.id)
				problemaInstance.usuario = usuario
	            if(params.version) {
	                def version = params.version.toLong()
	                if(problemaInstance.version > version) {
	                    
	                    problemaInstance.errors.rejectValue("version", "problema.optimistic.locking.failure", "Another user has updated this Problema while you were editing.")
	                    render(view:'edit',model:[problemaInstance:problemaInstance])
	                    return
	                }
	            }
	            problemaInstance.properties = params
	            if(!problemaInstance.hasErrors() && problemaInstance.save()) {
	                flash.message = "Problema ${params.id} updated"
	                redirect(action:show,id:problemaInstance.id)
	            }
	            else {
	                render(view:'edit',model:[problemaInstance:problemaInstance])
	            }
	        }
	        else {
	            flash.message = "Problema not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def create = {
        def problemaInstance = new Problema()
        problemaInstance.properties = params
        return ['problemaInstance':problemaInstance]
    }

    def save = {
        def problemaInstance = new Problema(params)
		Problema.withTransaction {
			def usuario = Usuario.get(session.usuario.id)
			problemaInstance.usuario = usuario
	        if(problemaInstance.save(flush:true)) {
	            flash.message = "Problema ${problemaInstance.id} created"
	            redirect(action:show,id:problemaInstance.id)
	        }
	        else {
	            render(view:'create',model:[problemaInstance:problemaInstance])
	        }
		}
    }
}
