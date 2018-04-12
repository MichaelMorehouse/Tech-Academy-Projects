using System;
using System.Reflection;
using System.Collections.Generic;

namespace ClassesExc
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter 1, 2, or 3 to generate a new Painter, Paint, or Brush respectively.");
            bool valid = false;

            while (!valid) // Only accepts user input of 1, 2, or 3
            {
                try
                {
                    int method = Convert.ToInt32(Console.ReadLine());

                    switch (method)
                    {
                        case 1:
                            valid = true;
                            Object painter = getPainter();
                            objInfo(painter);
                            break;
                        case 2:
                            valid = true;
                            Object paint = getPaint();
                            objInfo(paint);
                            break;
                        case 3:
                            valid = true;
                            Object brush = getBrush();
                            objInfo(brush);
                            break;
                        default:
                            Console.WriteLine("Something went wrong! Please enter 1, 2, or 3.");
                            break;
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message + " Please enter 1, 2, or 3.");
                }
            }
            Console.ReadLine();
        }

        public static void objInfo(object obj) // List object class, properties and values
        {
            Type objType = obj.GetType(); // Get passed object type
            List<PropertyInfo> propInfo = new List<PropertyInfo>(objType.GetProperties()); // Build list of passed object's properties

            Console.WriteLine("You created a new object from class " + objType.Name + " with properties:");

            foreach (var prop in propInfo) // Iterate through properties and print property and corresponding value to console
            {
                object value = prop.GetValue(obj, null);
                Console.WriteLine(prop.Name + " = " + value.ToString());
            }
        }

        public static Painter getPainter()
        {
            Painter painter = new Painter();
            painter.name = "Bob";
            painter.skill = "master";
            painter.style = "landscape";
            return painter;
        }

        public static Paint getPaint()
        {
            Paint paint = new Paint();
            paint.color = "titanium white";
            paint.sheen = "matte";
            paint.type = "acrylic";
            return paint;
        }

        public static Brush getBrush ()
        {
            Brush brush = new Brush();
            brush.bristle = "hogshair";
            brush.shape = "flat";
            brush.size = "one inch";
            return brush;
        }
    }
}
