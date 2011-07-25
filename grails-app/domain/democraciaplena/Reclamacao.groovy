package democraciaplena

class Reclamacao{

	String titulo
	
	String texto

	static belongsTo = [usuario: Usuario]
	
	static constraints = {
	
	}
}
