package democraciaplena

class Mensagem {

	static belongsTo = [usuario: Usuario, voto: Voto]
	
	String texto
	
    static constraints = {
    }
	
	static mapping = {
		texto(type: 'text')
	}
}
