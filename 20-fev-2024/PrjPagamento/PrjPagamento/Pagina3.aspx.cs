using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrjPagamento
{
    public partial class Pagina3 : System.Web.UI.Page
    {
        ClasseConexao conn;
        DataTable dt;
        static int pos = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMostrar_Click(object sender, EventArgs e)
        {
            int res = Convert.ToInt32(Session["res"].ToString());

            conn = new ClasseConexao();
            dt = new DataTable();
            dt = conn.executarSQL("SELECT salario FROM tblPagamento WHERE salario = '"+ res +"' ");
            if (dt.Rows.Count > 0)
            {
                lblMostrar.Text = "R$ " + dt.Rows[pos]["salario"].ToString();
            }
        }
    }
}