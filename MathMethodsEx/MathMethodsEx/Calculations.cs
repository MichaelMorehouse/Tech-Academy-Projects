using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MathMethodsEx
{
    public static class Calculations
    {
        public static int multiplyByTwo(int number)
        {
            int result = number * 2;
            return result;
        }

        public static int square(int number)
        {
            int result = number * number;
            return result;
        }

        public static int ninetyNineMod(int number)
        {
            int result = 99 % number;
            return result;
        }
    }
}
