// Handles database operations (queries)

using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace PharmacyDB_App
{
    internal class PatientListDAO
    {
        // Connecting the app to the MySQL database
        string connectionString = "datasource = localhost; port = 3306; username = root; password = password; database = Pharmacy";

        public List<PatientList> getAllPatients()
        {
            // Start with an empty list
            List<PatientList> returnThese = new List<PatientList>();

            // Connect to the MySQL Server
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();

            // Define the SQL statement to fetch all patients
            MySqlCommand command = new MySqlCommand("SELECT * FROM PATIENTLIST", connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                // Go through each column in the table
                while (reader.Read())
                {
                    PatientList a = new PatientList
                    {
                        PatientID = reader.GetInt32(0), // At column 0, expect an integer
                        FirstName = reader.GetString(1),
                        LastName = reader.GetString(2),
                        Sex = reader.GetChar(3),
                        Age = reader.GetInt16(4),
                        DOB = reader.GetString(5),
                        PhoneNumber = reader.GetString(6),
                        Address = reader.GetString(7),
                        SSN = reader.GetString(8)
                    };
                    returnThese.Add(a);
                }
            }
            connection.Close(); // Close the connection after you're don querying

            return returnThese; // Return the list
        }
    }
}
