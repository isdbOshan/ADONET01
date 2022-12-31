using OrderManagement.Customers;
using OrderManagement.Products;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OrderManagement
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void viewToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new ProductView { MdiParent= this }.Show();
        }

        private void addToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new ProductAdd { MdiParent=this}.Show();
        }

        private void editDeleteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new ProductEdit { MdiParent = this }.Show();
        }

        private void viewToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            new CustomerView { MdiParent = this }.Show();
        }

        private void addToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            new CustomerAdd { MdiParent = this }.Show();
        }

        private void editDeleteToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            new CustomerEdit { MdiParent = this }.Show();
        }
    }
}
