package democraciaplena

class Representante {

	static belongsTo = [representante: Usuario, representado: Usuario]
	
    static constraints = {
    }
}
