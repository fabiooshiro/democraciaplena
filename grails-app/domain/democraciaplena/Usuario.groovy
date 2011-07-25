package democraciaplena

class Usuario {

	String nome
	
	String email
	
	String tituloEleitor
	
	String cpf
	
	//private List<LancamentoCaixa> lancamentosCaixa = new ArrayList<LancamentoCaixa>();
	
	//@OneToMany//(mappedBy = "usuario")
	//private List<Reclamacao> reclamacoes = new ArrayList<Reclamacao>();
	
	//@OneToMany
	//private Set<Reclamacao> reclamacoes = new HashSet<Reclamacao>();
	
	//@OneToMany(mappedBy = "usuario")
	//private List<Voto> voltos = new ArrayList<Voto>();

	String toString(){
		"$nome"	
	}
	
    static constraints = {
    	cpf(unique: true)
    	tituloEleitor(unique: true)
	}
}

