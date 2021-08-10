namespace DoAnCoSo.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ParentID : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.HocVus", "YeuCauThem", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.HocVus", "YeuCauThem");
        }
    }
}
