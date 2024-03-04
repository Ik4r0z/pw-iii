<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pagina2.aspx.cs" Inherits="PrjPagamento.Pagina2" %>

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
            <asp:Label ID="Label1" Class="texto" runat="server" Text="Digite a quantidade de horas que você trabalhou:"></asp:Label><br />
            <asp:TextBox ID="txtQtdeHora" Class="texto" MaxLength="3" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" Class="texto" runat="server" Text="Digite o valor de cada hora trabalhada:"></asp:Label><br />
            <asp:TextBox ID="txtValHora" Class="texto" MaxLength="2" runat="server"></asp:TextBox><br /><br />
            <asp:Button ID="btnProximo" Class="botao" runat="server" Text="Proximo" OnClick="btnProximo_Click" /><br />
            <asp:Label ID="lblStatus" Class="mensagem" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
