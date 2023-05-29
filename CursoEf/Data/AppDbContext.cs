using CursoEF.Domain;
using Microsoft.EntityFrameworkCore;

namespace CursoEF.Data{

    public class AppDbContext : DbContext{

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder){
            
            // Foi utilizado um Container com a porta 8080 mapeada para a 3306
            var connectionString =  "Server=127.0.0.1;Port=8080;Database=CursoEF;User=root;Password=root";
            var serverVersion = new MySqlServerVersion(new Version(5, 7));
            optionsBuilder.UseMySql(connectionString, serverVersion);

            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(typeof(AppDbContext).Assembly);
            base.OnModelCreating(modelBuilder);
        }

        public DbSet<Cliente> Clientes {get;set;}
        public DbSet<Pedido> Pedidos {get;set;}
        public DbSet<Produto> Produtos {get;set;}
    }
}