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
	
	//@OneToMany//(mappedBy = "usuario")
	//private List<Reclamacao> reclamacoes = new ArrayList<Reclamacao>();
	
	//@OneToMany
	//private Set<Reclamacao> reclamacoes = new HashSet<Reclamacao>();
	
	//@OneToMany(mappedBy = "usuario")
	//private List<Voto> voltos = new ArrayList<Voto>();

	String toString(){
		"$nome [${id}]"	
	}
	
    static constraints = {
    	id visible:false
	}
}
