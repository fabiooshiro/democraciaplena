package democraciaplena

class MatrizPrioridadeVoto{

	static belongsTo = [
		usuario: Usuario,
		problema: Problema
	]
	
	Integer simplicidade
	
	Integer dependencia
	
	Integer tempo
	
	Integer beneficio
	
	Integer probabilidade
	
}
