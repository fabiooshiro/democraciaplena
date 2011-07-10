package democraciaplena

import javax.persistence.*;

import com.google.appengine.api.datastore.Key;
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
	
	@OneToMany(mappedBy = "usuario")
	private List<LancamentoCaixa> lancamentosCaixa = new ArrayList<LancamentoCaixa>();

    static constraints = {
    	id visible:false
	}
}
