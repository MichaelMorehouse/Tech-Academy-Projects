using System;
using System.Linq;

namespace ExceptionsAdv
{
    class Program
    {
        static void Main(string[] args)
        {
            bool validInput = false;
            int userAge = 0;
            
            while (!validInput)
            {
                try
                {
                    Console.WriteLine("How old are you?");
                    validInput = Int32.TryParse(Console.ReadLine(), out userAge); // Convert user input to integer.
                    if (validInput)                                               // Throw an error if entered number <= 0.
                    {
                        if (userAge < 0) throw new InvalidInputException("Negative input. Please enter a positive, non-zero number.");
                        else if (userAge == 0) throw new InvalidInputException("Zero input. Please enter a positive, non-zero number.");
                        userAge *= -1;                                          // Convert age value to negative so it can be used with DateTimeOffset.Now.AddYears function
                    }                                                           // to calculate past value.
                    else Console.WriteLine("Enter your age as a number.");
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    validInput = false;                                           // Stay in while loop if entered number can be converted to integer
                }                                                                 // but is <= 0.
            }

            validInput = false;
            Console.WriteLine("Have you had a birthday yet this year?");
            while (!validInput)
            {
                try
                {
                    string birthdayThisYear = Console.ReadLine().ToLower();     // Accept a user string input and convert it to lowercase.
                    char birthdayResponse = birthdayThisYear.First();           // Store the first character of the user input string as a char.
                    if (birthdayResponse == 'n')                                // Branch user birth year calculation based on if they have already
                    {                                                           // had a birthday this year. Any string starting with 'n' is interpreted as no.
                        userAge -= 1;                                            
                        validInput = true;
                        DateTimeOffset yearOfBirth = DateTimeOffset.Now.AddYears(userAge);
                        Console.WriteLine($"Your birth year is {yearOfBirth.Year}.");
                    }
                    else if (birthdayResponse == 'y')                           // Any string starting with 'y' is interpreted as yes.
                    {
                        validInput = true;
                        DateTimeOffset yearOfBirth = DateTimeOffset.Now.AddYears(userAge);
                        Console.WriteLine($"Your birth year is {yearOfBirth.Year}.");
                    }
                    else throw new InvalidInputException("Invalid input. Please enter yes or no.");
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
            Console.Read();
        }
    }
}
