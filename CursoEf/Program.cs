using CursoEF.Domain;
using Microsoft.EntityFrameworkCore;

namespace CursoEF.Program{
    public class Program{
        public static void Main(String[] args){

            var newProduto = new Produto{
                Descricao = "Garfo",
                Valor = 9.50m,
                CodigoDeBarras = "31232121",
                Tipo = TipoProduto.MercadoriaParaRevenda,
                Ativo = true
            };

            using var DbContext = new Data.AppDbContext();
            //DbContext.Set<Produto>().Add(newProduto);  // Recomendado
            //DbContext.Produtos.Add(newProduto);        // Recomendado
            //DbContext.Entry(newProduto).State = Microsoft.EntityFrameworkCore.EntityState.Added;
            //DbContext.Add(newProduto);

            var rowsChange = DbContext.SaveChanges();
            Console.WriteLine(rowsChange);

            var p = DbContext.Produtos.AsNoTracking().Where(p => p.Descricao.Equals("Garfo")).First();
            Console.WriteLine(p.Descricao);

            //Carregamento adiantado
            // var ip = DbContext.Pedidos
            //     .Include(p => p.Itens)
            //     .ThenInclude(i => i.Produto)
            //     .Where(p=> p.Id > 0);

            //Update
            // var produtoAtualizar = DbContext.Produtos.Find(2);
            // produtoAtualizar.Descricao = "Garfo 2";
            // DbContext.Produtos.Update(produtoAtualizar);
            // DbContext.SaveChanges();


            // Delete
            var searchProduto = DbContext.Produtos.Find(1);
            DbContext.Produtos.Remove(searchProduto);
            DbContext.Remove(searchProduto);
            DbContext.Entry(searchProduto).State = EntityState.Deleted;
            DbContext.SaveChanges();
        }
    }
}