using Domain;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using MVCDemo.Areas.Identity.Data;

namespace MVCDemo.Data;

public class MVCDemoContext : IdentityDbContext<MVCDemoUser>
{
    public MVCDemoContext(DbContextOptions<MVCDemoContext> options)
        : base(options)
    {
       
    }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);
        // Customize the ASP.NET Identity model and override the defaults if needed.
        // For example, you can rename the ASP.NET Identity table names and more.
        // Add your customizations after calling base.OnModelCreating(builder);
    }

    public DbSet<Books> Books { get; set; }
}
