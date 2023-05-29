namespace CursoEF.Domain
{   
    public class Produto {

        public int Id {get;set;}
        public String CodigoDeBarras {get;set;}

        public String Descricao {get;set;}

        public Decimal Valor {get;set;}

        public TipoProduto Tipo {get;set;}

        public Boolean Ativo {get;set;}
    }
    
}