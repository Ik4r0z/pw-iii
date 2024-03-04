using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrjPagamento
{
    public partial class Pagina2 : System.Web.UI.Page
    {
        ClasseConexao conn;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProximo_Click(object sender, EventArgs e)
        {
            try
            {
                int qtdeHora = Convert.ToInt32(txtQtdeHora.Text);
                int valHora = Convert.ToInt32(txtValHora.Text);
                int res = qtdeHora * valHora;
                String cod = Session["cod"].ToString();

                if ((qtdeHora <= 0 || qtdeHora > 160) || valHora <= 0  || res <= 0)
                {
                    lblStatus.Text = "Instrução não efetuada!! Verifique se o primeiro valor é menor que 160!!";
                    txtQtdeHora.Text = "";
                    txtValHora.Text = "";
                    res = 0;
                }
                else
                {
                    conn = new ClasseConexao();
                    dt = new DataTable();
                    dt = conn.executarSQL("EXEC uspCadastroPagamento '" + cod + "', '" + qtdeHora + "', '" + valHora + "', '"+ res +"'");
                    lblStatus.Text = "Instrução efetuada!!";
                    Session["res"] = res.ToString();
                    Response.Redirect("Pagina3.aspx");
                }
            }
            catch (Exception)
            {
                txtQtdeHora.Text = "";
                txtValHora.Text = "";
                lblStatus.Text = "Erro!!";
            }
        }
    }
}