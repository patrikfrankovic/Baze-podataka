using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Baze_LV6_predlozak
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnSve_Click(object sender, EventArgs e)
        {
            // OVDJE SLIJEDI PRIMJER IZ PREDLOŠKA:

            SqlConnection conn = new SqlConnection("Data Source=31.147.204.169;Initial Catalog = stuslu; User ID = student; Password = student");
            conn.Open();
            string statement = "SELECT * FROM student";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(statement, conn);
            DataTable dt = new DataTable();
            dataAdapter.Fill(dt);
            dgvPodaci.DataSource = dt;
            conn.Close();
        }

        private void btnTrazi_Click(object sender, EventArgs e)
        {
            // OVDJE PISATI KOD 1. ZADATKA IZ PREDLOŠKA:
            SqlConnection conn = new SqlConnection("Data Source=31.147.204.169;Initial Catalog = stuslu; User ID = student; Password = student");
            conn.Open();
            string ime = txtIme.Text;
            string prezime = txtPrezime.Text;
            string spol = "";
            if (rbM.Checked)
            {
                spol = "M";
            }
            else if (rbZ.Checked)
            {
                spol = "Z";
            }
            string statement = $"SELECT * FROM student WHERE ime LIKE '{ime}%' AND prezime LIKE '{prezime}%' AND spol LIKE '{spol}'";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(statement, conn);
            DataTable dt = new DataTable();
            dataAdapter.Fill(dt);
            dgvPodaci.DataSource = dt;
            conn.Close();
        }
    }
}
