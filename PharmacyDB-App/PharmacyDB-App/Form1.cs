namespace PharmacyDB_App
{
    public partial class Form1 : Form
    {
        BindingSource plBindingSource = new BindingSource(); // Connects a list of items to the grid control

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            PatientListDAO plDAO = new PatientListDAO();

            // Connect the list to the grid view control using the BindingSource
            plBindingSource.DataSource = plDAO.getAllPatients();


            dataGridView1.DataSource = plBindingSource;
        }
    }
}
