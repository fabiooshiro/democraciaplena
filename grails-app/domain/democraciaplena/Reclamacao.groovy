package democraciaplena

class Reclamacao{

	String titulo
	
	String texto

	Localizacao localizacao
	
	String toString(){
		titulo + ' ' + id
	}
	
	static belongsTo = [usuario: Usuario]
	
	static constraints = {
		localizacao(nullable: true)
	}
}
