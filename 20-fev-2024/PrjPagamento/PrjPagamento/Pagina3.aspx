<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pagina3.aspx.cs" Inherits="PrjPagamento.Pagina3" %>

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
            <h1>Resultado!!</h1><br /><br />
            <asp:Button ID="btnMostrar" Class="botao" runat="server" Text="Mostrar" OnClick="btnMostrar_Click" /><br /><br />
            <asp:Label ID="lblMostrar" Class="texto" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
