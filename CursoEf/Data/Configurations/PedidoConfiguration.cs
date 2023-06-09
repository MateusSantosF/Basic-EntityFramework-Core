using CursoEF.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CursoEF.Data.Configurations {
    public class PedidoConfiguration : IEntityTypeConfiguration<Pedido>
    {
        public void Configure(EntityTypeBuilder<Pedido> builder)
        {
                builder.ToTable("Pedidos");
                builder.HasKey(p => p.Id);
                builder.Property(p=> p.IniciadoEm).HasDefaultValue("now()").ValueGeneratedOnAdd();
                builder.Property(p=>p.Observacao).HasColumnType("VARCHAR(512)");
                builder.HasMany(p=> p.Itens).WithOne(p => p.Pedido).OnDelete(DeleteBehavior.Cascade);
        }
    }
}