<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pagina1.aspx.cs" Inherits="PrjPagamento.Pagina1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="Style.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Pagamento!!</h1><br /><br />
            <asp:Label ID="Label1" Class="texto" runat="server" Text="Digite seu código:"></asp:Label><br />
            <asp:TextBox ID="txtCod" Class="texto" MaxLength="3" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" Class="texto" runat="server" Text="Digite seu nome:"></asp:Label><br />
            <asp:TextBox ID="txtNome" Class="texto" MaxLength="20" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label3" Class="texto" runat="server" Text="Digite seu endereço:"></asp:Label><br />
            <asp:TextBox ID="txtEnder" Class="texto" MaxLength="50" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label4" Class="texto" runat="server" Text="Digite seu bairro:"></asp:Label><br />
            <asp:TextBox ID="txtBairro" Class="texto" MaxLength="20" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label5" Class="texto" runat="server" Text="Digite sua cidade:"></asp:Label><br />
            <asp:TextBox ID="txtCidade" Class="texto" MaxLength="20" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label6" Class="texto" runat="server" Text="Digite seu estado:"></asp:Label><br />
            <asp:TextBox ID="txtEstado" Class="texto" MaxLength="20" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label7" Class="texto" runat="server" Text="Digite seu CEP:"></asp:Label><br />
            <asp:TextBox ID="txtCep" Class="texto" MaxLength="8" runat="server"></asp:TextBox><br /><br />
            <asp:Button ID="btnCadastrar" Class="botao" runat="server" Text="Cadastrar" OnClick="btnCadastrar_Click" /><br /><br />
            <asp:Label ID="lblStatus" Class="mensagem" runat="server" Text=""></asp:Label><br />
            <asp:LinkButton ID="lkbProximo" Class="texto" runat="server" OnClick="lkbProximo_Click"></asp:LinkButton><br /><br />
            <asp:Label ID="Label8" runat="server" Class="texto" Text="Caso já tenha conta, digite seu código para a consulta:"></asp:Label><br />
            <asp:TextBox ID="txtConsultar" Class="texto" runat="server"></asp:TextBox><br /><br />
            <asp:Button ID="btnConsultar" Class="botao" runat="server" Text="Consultar" OnClick="btnConsultar_Click" /><br /><br />
            <asp:Button ID="btnAlterar" Class="botao" runat="server" Text="Alterar" OnClick="btnAlterar_Click" /><br /><br />
            <asp:Button ID="btnDeletar" Class="botao" runat="server" Text="Deletar" OnClick="btnDeletar_Click" />
        </div>
    </form>
</body>
</html>
