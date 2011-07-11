package democraciaplena

import java.util.List;

import javax.persistence.*;

import com.google.appengine.api.datastore.Key;

@Entity
class Reclamacao implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id
	
	String titulo
	
	String texto

	/**
	 * Strong Adapter, 2011-07-10
	 * O google ainda nao aceita relacao not owned
	 * E a owned esta descrita como lenta!!
	 */
	Long usuarioId
		
	@Transient
	Usuario usuario
	
	Usuario getUsuario(){
		if(this.@usuario == null && usuarioId != null ){
			this.@usuario = Usuario.get(usuarioId)
		}
		return this.@usuario
	}
	
	void setUsuario(Usuario usuario){
		usuarioId = usuario.id
		this.@usuario = usuario
	}
	
    static constraints = {
		usuarioId(visible: false)
    }
}
