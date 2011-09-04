package democraciaplena

class Problema{

	String titulo
	
	String texto
	
	String toString(){
		titulo + ' ' + id
	}
	
	static belongsTo = [usuario: Usuario]
	
	static constraints = {
		localizacao(nullable: true)
	}
}
