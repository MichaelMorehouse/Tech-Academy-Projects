namespace ContosoUniversity.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddClassroomEntity : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Classroom",
                c => new
                    {
                        BuildingName = c.String(nullable: false, maxLength: 128),
                        RoomNumber = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.BuildingName, t.RoomNumber });
            
            AddColumn("dbo.Course", "Classroom_BuildingName", c => c.String(maxLength: 128));
            AddColumn("dbo.Course", "Classroom_RoomNumber", c => c.Int());
            CreateIndex("dbo.Course", new[] { "Classroom_BuildingName", "Classroom_RoomNumber" });
            AddForeignKey("dbo.Course", new[] { "Classroom_BuildingName", "Classroom_RoomNumber" }, "dbo.Classroom", new[] { "BuildingName", "RoomNumber" });
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Course", new[] { "Classroom_BuildingName", "Classroom_RoomNumber" }, "dbo.Classroom");
            DropIndex("dbo.Course", new[] { "Classroom_BuildingName", "Classroom_RoomNumber" });
            DropColumn("dbo.Course", "Classroom_RoomNumber");
            DropColumn("dbo.Course", "Classroom_BuildingName");
            DropTable("dbo.Classroom");
        }
    }
}
