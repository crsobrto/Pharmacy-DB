using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PharmacyDB_App
{
    internal class PatientList
    {
        public int PatientID { get; set; }
        public String FirstName { get; set; }
        public String LastName { get; set; }
        public char Sex { get; set; }
        public int Age { get; set; }
        public String DOB { get; set; }
        public String PhoneNumber { get; set; }
        public String Address { get; set; }
        public String SSN { get; set; }
    }
}
