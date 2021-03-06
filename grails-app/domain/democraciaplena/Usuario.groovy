package democraciaplena

import java.io.Serializable

class Usuario implements Serializable{

	String nome
	
	String email
	
	String tituloEleitor
	
	String cpf
	
	String username
	
	String password
	
	Boolean autorizado
	
	String toString(){
		"$nome"	
	}
	
    static constraints = {
    	cpf(unique: true)
    	tituloEleitor(unique: true)
		email(unique: true)
		username(unique: true)
	}
}

