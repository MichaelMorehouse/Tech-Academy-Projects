namespace ContosoUniversity.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateClassroom : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Course", new[] { "Classroom_BuildingName", "Classroom_RoomNumber" }, "dbo.Classroom");
            DropIndex("dbo.Course", new[] { "Classroom_BuildingName", "Classroom_RoomNumber" });
            RenameColumn(table: "dbo.Course", name: "Classroom_BuildingName", newName: "ClassroomID");
            DropPrimaryKey("dbo.Classroom");
            AddColumn("dbo.Classroom", "ClassroomID", c => c.String(nullable: false, maxLength: 128));
            AddPrimaryKey("dbo.Classroom", "ClassroomID");
            CreateIndex("dbo.Course", "ClassroomID");
            AddForeignKey("dbo.Course", "ClassroomID", "dbo.Classroom", "ClassroomID");
            DropColumn("dbo.Classroom", "BuildingName");
            DropColumn("dbo.Classroom", "RoomNumber");
            DropColumn("dbo.Course", "Classroom_RoomNumber");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Course", "Classroom_RoomNumber", c => c.Int());
            AddColumn("dbo.Classroom", "RoomNumber", c => c.Int(nullable: false));
            AddColumn("dbo.Classroom", "BuildingName", c => c.String(nullable: false, maxLength: 128));
            DropForeignKey("dbo.Course", "ClassroomID", "dbo.Classroom");
            DropIndex("dbo.Course", new[] { "ClassroomID" });
            DropPrimaryKey("dbo.Classroom");
            DropColumn("dbo.Classroom", "ClassroomID");
            AddPrimaryKey("dbo.Classroom", new[] { "BuildingName", "RoomNumber" });
            RenameColumn(table: "dbo.Course", name: "ClassroomID", newName: "Classroom_BuildingName");
            CreateIndex("dbo.Course", new[] { "Classroom_BuildingName", "Classroom_RoomNumber" });
            AddForeignKey("dbo.Course", new[] { "Classroom_BuildingName", "Classroom_RoomNumber" }, "dbo.Classroom", new[] { "BuildingName", "RoomNumber" });
        }
    }
}
