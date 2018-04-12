using System;

namespace MathMethodsEx
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Please enter an integer:");
            bool valid = false;

            while (!valid)
            {
                try
                {
                    int number = Convert.ToInt32(Console.ReadLine());
                    if(number != 0) // Accepts all integers except zero
                        valid = true;
                    int result1 = Calculations.multiplyByTwo(number);
                    int result2 = Calculations.square(number);
                    int result3 = Calculations.ninetyNineMod(number);
                    Console.WriteLine("Your number times 2 is " + result1);
                    Console.WriteLine("Your number squared is " + result2);
                    Console.WriteLine("The remainder of 99 divided by your number is " + result3);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message + " Try again!");
                }
            }
            Console.ReadLine();
        }
    }
}
