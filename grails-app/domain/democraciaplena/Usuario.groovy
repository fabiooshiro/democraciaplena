package democraciaplena

class Usuario {

	String nome
	
	String email
	
	String tituloEleitor
	
	String cpf
	
	String username
	
	String password
	
	String toString(){
		"$nome"	
	}
	
    static constraints = {
    	cpf(unique: true)
    	tituloEleitor(unique: true)
		email(unique: true)
	}
}

