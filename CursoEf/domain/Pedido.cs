namespace CursoEF.Domain{

    public class Pedido {

        public int Id {get;set;}

        public String IniciadoEm {get;set;}

        public String FinalizadoEm {get;set;}

        public TipoFrete TipoFrete {get;set;}

        public PedidoStatus Status {get;set;}
        
        public String Observacao {get;set;}

        public ICollection<PedidoItem> Itens {get;set;}
    }
}