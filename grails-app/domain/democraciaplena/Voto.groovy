package democraciaplena

import java.io.Serializable;
import javax.persistence.*;

import com.google.appengine.api.datastore.Key;

@Entity
class Voto implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id
	
	@ManyToOne(fetch = FetchType.LAZY)
	Usuario usuario
	
	@ManyToOne(optional = true, fetch = FetchType.LAZY)
	Reclamacao reclamacao
	
	/**
	 * true para apoiar, ou seja, quem reclama tem razao
	 */
	Boolean positivo 
	
	/**
	 * true se esse voto foi criado pelo representante
	 */
	Boolean porRepresentante
	
    static constraints = {
		reclamacao(nullable: true)
    }
}
