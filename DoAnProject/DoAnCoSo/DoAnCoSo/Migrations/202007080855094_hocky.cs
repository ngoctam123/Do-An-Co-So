namespace DoAnCoSo.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class hocky : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.HocVus", "HocKy", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.HocVus", "HocKy");
        }
    }
}
