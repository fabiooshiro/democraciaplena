package democraciaplena

class Voto{

	static belongsTo = [
		usuario: Usuario, 
		reclamacao: Reclamacao
	]
	
	/**
	 * Caso o voto tenha sido feito por um representante
	 */
	Usuario representante
	
	/**
	 * true para apoiar, ou seja, quem reclama tem razao
	 */
	Boolean positivo
	
    static constraints = {
		representante(nullable: true)
    }
}
