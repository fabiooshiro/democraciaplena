package democraciaplena

class Usuario {

	String nome
	
	String email
	
	String tituloEleitor
	
	String cpf
	
	String toString(){
		"$nome"	
	}
	
    static constraints = {
    	cpf(unique: true)
    	tituloEleitor(unique: true)
	}
}

