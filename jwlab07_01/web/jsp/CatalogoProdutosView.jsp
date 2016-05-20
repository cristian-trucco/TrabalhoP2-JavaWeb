<%@page import="br.javaweb.beans.*, java.util.*, java.text.NumberFormat"%>
<%
        String contexto = request.getContextPath();
        String nomeDaLoja = application.getInitParameter("nome-da-loja");
%>
<html>
    <head>
        <title>Catalogo Produtos - Java Web</title>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <link href='<%=contexto%>/jw.css' rel='stylesheet' type='text/css'></link>
    </head>
    <body>
        <H3>Catalogo de produtos <%= nomeDaLoja%> (JSP)</H3>
        <TABLE width='700' border='0'>
            <TR width = '%100' class='tituloCampo'>
                <TD width = '%20'>Imagem</TD>
                <TD width = '%10' >Nome</TD>
                <TD width = '%10' >Codigo</TD>
                <TD width = '%10'  >Descri&ccedil;&atilde;o</TD>
                <TD width = '%10' >Pre&ccedil;o</TD>
                <TD width = '%20' colspan = '2'>Comprar</TD>
            </TR>

            <%
        List<Produto> catalogoProdutos = (List<Produto>) request.getAttribute("catalogo");
        NumberFormat formatadorMoeda = NumberFormat.getCurrencyInstance();
        for (Produto produto : catalogoProdutos) {
            %>
            <TR width='%100'>
                <TD width='%20' class='gridCampo'>
                    <IMG SRC='<%=contexto%>/imagem/<%=produto.getImage()%>' />
                </TD>
                <TD width='%10' class='gridCampo'><%=produto.getNome()%></TD>
                <TD width='%10' class='gridCampo'><%=produto.getCodigo()%></TD>
                <TD width='%10' class='gridCampo'><%=produto.getDescricao()%></TD>
                <TD width='%10' class='gridCampo'><%=formatadorMoeda.format(produto.getPreco())%></TD>
                <TD width='%20' colspan='2'>
                    <%
                String linkAdicionarProdutoCarrinho = contexto + "/adicionarProdutoCarrinho?idProduto=" + produto.getId();
                String imagemCarrinho = contexto + "/imagem/carrinho.gif";
                    %>
                    <A HREF='<%=linkAdicionarProdutoCarrinho%>'><IMG SRC='<%=imagemCarrinho%>' /></A>
                </TD>
            </TR>
            <%
        }
            %>
        </TABLE>
    </body>
</html>
