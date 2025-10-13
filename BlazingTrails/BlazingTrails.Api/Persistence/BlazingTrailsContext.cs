using BlazingTrails.Api.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace BlazingTrails.Api.Persistence;

public class BlazingTrailsContext : DbContext
{
    public DbSet<BlazingTrails.Api.Persistence.Entities.Trail> Trails => Set<BlazingTrails.Api.Persistence.Entities.Trail>();
    public DbSet<BlazingTrails.Api.Persistence.Entities.RouteInstruction> RouteInstructions => Set<BlazingTrails.Api.Persistence.Entities.RouteInstruction>();

    public BlazingTrailsContext(DbContextOptions<BlazingTrailsContext> options) : base(options) { }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.ApplyConfiguration(new TrailConfig());
        modelBuilder.ApplyConfiguration(new RouteInstructionConfig());
    }
}
