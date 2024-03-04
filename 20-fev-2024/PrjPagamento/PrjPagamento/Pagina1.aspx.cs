using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrjPagamento
{
    public partial class Pagina1 : System.Web.UI.Page
    {
        ClasseConexao conn;
        DataTable dt;
        static int pos = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            lkbProximo.Enabled = false;
            btnAlterar.Enabled = false;
            btnDeletar.Enabled = false;
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            try
            {
                String cod = txtCod.Text;
                String nome = txtNome.Text;
                String ender = txtEnder.Text;
                String bairro = txtBairro.Text;
                String cidade = txtCidade.Text;
                String estado = txtEstado.Text;
                String cep = txtCep.Text;

                if(cod == "" || nome == "" || ender == "" || bairro == "" || cidade == "" || estado == "" || cep == "")
                {
                    lblStatus.Text = "Instrução não efetuada!!";
                    limparTextBoxs();
                }
                else
                {
                    conn = new ClasseConexao();
                    dt = new DataTable();
                    dt = conn.executarSQL("EXEC uspCadastroPessoa '" + cod + "', '" + nome + "', '" + ender + "', '" + bairro + "', '" + cidade + "', '" + estado + "', '" + cep + "' ");
                    limparTextBoxs();
                    lblStatus.Text = "Instrução efetuada!!";
                }
            }
            catch (Exception)
            {
                limparTextBoxs();
                lblStatus.Text = "Erro!!";
            }   
        }

        private void limparTextBoxs()
        {
            txtCod.Text = "";
            txtNome.Text = "";
            txtEnder.Text = "";
            txtBairro.Text = "";
            txtCidade.Text = "";
            txtEstado.Text = "";
            txtCep.Text = "";
            lkbProximo.Text = "";
            txtConsultar.Text = "";
        }

        protected void lkbProximo_Click(object sender, EventArgs e)
        {
            Session["cod"] = txtConsultar.Text;
            Response.Redirect("Pagina2.aspx");
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            try
            {
                String cod = txtConsultar.Text;
                    
                if (cod == "")
                {
                    lblStatus.Text = "Instrução não efetuada!!";
                    limparTextBoxs();
                }
                else
                {
                    conn = new ClasseConexao();
                    dt = new DataTable();
                    dt = conn.executarSQL("SELECT * FROM tblPessoa WHERE cod_pessoa = '" + cod + "'");
                    if(dt.Rows.Count > 0)
                    {
                        txtCod.Text = dt.Rows[pos]["cod_pessoa"].ToString();
                        txtNome.Text = dt.Rows[pos]["nome"].ToString();
                        txtEnder.Text = dt.Rows[pos]["endereco"].ToString();
                        txtBairro.Text = dt.Rows[pos]["bairro"].ToString();
                        txtCidade.Text = dt.Rows[pos]["cidade"].ToString();
                        txtEstado.Text = dt.Rows[pos]["estado"].ToString();
                        txtCep.Text = dt.Rows[pos]["cep"].ToString();
                        lkbProximo.Enabled = true;
                        btnAlterar.Enabled = true;
                        btnDeletar.Enabled = true;
                        lblStatus.Text = "Instrução efetuada!!";
                        lkbProximo.Text = "Próximo";
                    }
                }

            }
            catch (Exception)
            {
                limparTextBoxs();
                lblStatus.Text = "Erro!!";
            }
        }

        protected void btnAlterar_Click(object sender, EventArgs e)
        {
            try
            {
                String cod = txtCod.Text;
                String nome = txtNome.Text;
                String ender = txtEnder.Text;
                String bairro = txtBairro.Text;
                String cidade = txtCidade.Text;
                String estado = txtEstado.Text;
                String cep = txtCep.Text;

                if (cod == "" || nome == "" || ender == "" || bairro == "" || cidade == "" || estado == "" || cep == "")
                {
                    lblStatus.Text = "Instrução não efetuada!!";
                    limparTextBoxs();
                }
                else
                {
                    conn = new ClasseConexao();
                    dt = new DataTable();
                    dt = conn.executarSQL("EXEC uspAlterarPessoa '" + cod + "', '" + nome + "', '" + ender + "', '" + bairro + "', '" + cidade + "', '" + estado + "', '" + cep + "' ");
                    lkbProximo.Enabled = true;
                    btnAlterar.Enabled = true;
                    btnDeletar.Enabled = true;
                    lblStatus.Text = "Instrução efetuada!!";
                    lkbProximo.Text = "Próximo";
                }
            }
            catch (Exception)
            {
                limparTextBoxs();
                lblStatus.Text = "Erro!!";
            }
        }

        protected void btnDeletar_Click(object sender, EventArgs e)
        {
            try
            {
                String cod = txtConsultar.Text;

                if (cod == "")
                {
                    lblStatus.Text = "Instrução não efetuada!!";
                    limparTextBoxs();
                }
                else
                {
                    conn = new ClasseConexao();
                    dt = new DataTable();
                    dt = conn.executarSQL("EXEC uspDeletarPessoa '" + cod + "'");
                    limparTextBoxs();
                    lblStatus.Text = "Instrução efetuada!!";
                }
            }
            catch (Exception)
            {
                limparTextBoxs();
                lblStatus.Text = "Erro!!";
            }
        }
    }
}