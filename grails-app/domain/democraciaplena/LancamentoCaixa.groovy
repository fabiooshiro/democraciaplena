package democraciaplena

class LancamentoCaixa{
	
	BigDecimal valor
	
	Date data
	
	String descricao
	
	static belongsTo = [usuario: Usuario]
	
    static constraints = {
    }
}
