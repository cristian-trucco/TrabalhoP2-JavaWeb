<%@page import="br.javaweb.beans.*"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>

<%
        CarrinhoCompras carrinho = (CarrinhoCompras) session.getAttribute("carrinhoCompras");
        List<Item> itens = carrinho.getItems();
        String contexto = request.getContextPath();
        String nomeDaLoja = application.getInitParameter("nome-da-loja");
%>

<HTML>
    <HEAD>
        <title>Carrinho de Compras - Java Web</title>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <link href='<%=contexto%>/jw.css' rel='stylesheet' type='text/css'></link>
    </HEAD>

    <BODY>

        <H3>Suas compras em  <%= nomeDaLoja%> (JSP)</H3>
        <TABLE border='0' width='700' border='0'>
            <TR>
                <TD align='right' colspan='7' class='tituloform'>
                    <A HREF='<%=contexto%>/catalogoProdutos'>Continuar compras </A>
                    <A HREF='<%=contexto%>/catalogoProdutos'>
                        <img src='<%=contexto%>/imagem/carrinho.gif' />
                    </A>
                </TD>
            </TR>

            <TR>
                <TD width='%20' class='tituloCampo'>Imagem</TD>
                <TD width='%10' class='tituloCampo'>Nome</TD>
                <TD width='%10' class='tituloCampo'>Codigo</TD>
                <TD width='%20' class='tituloCampo'>Descri&ccedil;&atilde;o</TD>
                <TD width='%5' class='tituloCampo'>Quantidade</TD>
                <TD width='%15' class='tituloCampo'>Pre&ccedil;o unid.</TD>
                <TD width='%20' class='tituloCampo'>total</TD>
            </TR>
            
            <%
        NumberFormat formatadorMoeda = NumberFormat.getCurrencyInstance();
        for (Item item : itens) {
            Produto p = item.getProduto();
            String preco = formatadorMoeda.format(p.getPreco());
            String totalItem = formatadorMoeda.format(p.getPreco() * item.getQuantidade());
            %>
            <TR>
                <TD width='%20'>
                    <IMG SRC='<%=request.getContextPath()%>/imagem/<%=p.getImage()%>' />
                </TD>
                <TD width='%10' class='gridCampo'><%=p.getNome()%></TD>
                <TD width='%10' class='gridCampo'><%=p.getCodigo()%></TD>
                <TD width='%20' class='gridCampo'><%=p.getDescricao()%></TD>
                <TD width='%5' class='gridCampo'><%=item.getQuantidade()%></TD>
                <TD width='%15' class='gridCampo' align='right'><%=preco%></TD>
                <TD width='%20' class='gridCampo' align='right'><%=totalItem%></TD>
            </TR>
            <%
        } // end for
        String precoTotal = formatadorMoeda.format(carrinho.calcularValorTotal());
            %>
            <TR>
                <TD align='right' colspan='7' class='tituloform'><%=precoTotal%></TD>
            </TR>
            <TR>
                <TD align='right' colspan='7' class='tituloform'><A
                        HREF='<%=contexto%>/jsp/FinalizarCompraView.jsp'>Finalizar Compra </A>
                </TD>
            </TR>
        </TABLE>
    </BODY>
</HTML>
