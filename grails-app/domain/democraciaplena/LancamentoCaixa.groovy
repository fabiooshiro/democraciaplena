package democraciaplena

import java.io.Serializable;
import javax.persistence.*;
import com.google.appengine.api.datastore.Key;

@Entity
class LancamentoCaixa implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Key id
	
	@ManyToOne(fetch = FetchType.LAZY)
	Usuario usuario
	
	BigDecimal valor
	
	Date data
	
	String descricao
	
	//static belongsTo = [usuario: Usuario]
	
    static constraints = {
		id visible:false
    }
}
