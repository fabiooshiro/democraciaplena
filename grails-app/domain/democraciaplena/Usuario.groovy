package democraciaplena

import javax.persistence.*;
// import com.google.appengine.api.datastore.Key;

@Entity
class Usuario implements Serializable {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id

	String nome
	
	String email
	
	String tituloEleitor
	
	String cpf

    static constraints = {
    	id visible:false
	}
}
