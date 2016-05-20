<%@page import="br.javaweb.beans.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<html>
    <head>
        <title>Pedido de compra</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../jw.css" rel="stylesheet" type="text/css"></link>
    </head>

    <body>
        <H3>Dados do Pedido (JSP)</H3>


        <table width="80%">
            <tr>
                <td class="tituloCampo">Dados pessoais</td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="1">
                        <tr>
                            <td width="16%" class="tituloform">Nome:</td>
                            <td width="84%" class="gridCampo"> <%=request.getParameter("nome")%> </td>
                        </tr>
                        <tr>
                            <td class="tituloform">CPF:</td>
                            <td class="gridCampo"> <%=request.getParameter("cpf")%> </td>
                        </tr>
                        <tr>
                            <td class="tituloform">e-mail</td>
                            <td class="gridCampo"> <%=request.getParameter("email")%> </td>
                        </tr>
                        <tr>
                            <td class="tituloform">Telefone</td>
                            <td class="gridCampo"> <%=request.getParameter("telefone")%> </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="tituloCampo">Endere&ccedil;o de entrega <br>
                </td>
            </tr>

            <tr>
                <td bgcolor="#FFFFFF">
                    <table width="100%">
                        <tr>
                            <td class="tituloform">Rua/Av</td>
                            <td class="gridCampo"> <%=request.getParameter("rua")%> </td>
                            <td class="tituloform">N&uacute;mero</td>
                            <td class="gridCampo"> <%=request.getParameter("numero")%> </td>
                        </tr>
                        <tr>
                            <td class="tituloform">Bairro</td>
                            <td class="gridCampo"> <%=request.getParameter("bairro")%>  </td>
                            <td class="tituloform">Cidade</td>
                            <td class="gridCampo"> <%=request.getParameter("cidade")%>  </td>
                        </tr>
                        <tr>
                            <td class="tituloform">Estado</td>
                            <td class="gridCampo"> <%=request.getParameter("estado")%> </td>
                            <td class="tituloform">CEP</td>
                            <td class="gridCampo"> <%=request.getParameter("cep")%>  </td>
                        </tr>
                    </table>
                </td>
            </tr>


            <tr>
                <td class="tituloCampo">Dados para pagamento</td>
            </tr>

            <tr>
                <td bgcolor="#FFFFFF">
                    <table width="100%" border="0" cellspacing="0">
                        <tr>
                            <td width="25%" class="tituloform">Cart&atilde;o de cr&eacute;dito</td>
                            <td width="75%" class="gridCampo"> <%=request.getParameter("tipo")%>  </td>
                        </tr>
                        <tr>
                            <td class="tituloform">N&uacute;mero do cart&atilde;o</td>
                            <td class="gridCampo"> <%=request.getParameter("numeroCartao")%>  </td>
                        </tr>
                        <tr>
                            <td class="tituloform">Data Validade</td>
                            <td class="gridCampo"> <%=request.getParameter("dataValidade")%>  </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <%
        CarrinhoCompras carrinho = (CarrinhoCompras) session.getAttribute("carrinhoCompras");
        List<Item> itens = carrinho.getItems();
        %>

        <H3>Items do Pedido (JSP)</H3>
        <TABLE border='0' width='700' border='0'>
            <TR>
                <TD width='%10' class='tituloCampo'>Nome</TD>
                <TD width='%10' class='tituloCampo'>Codigo</TD>
                <TD width='%20' class='tituloCampo'>Descri&ccedil;&atilde;o</TD>
                <TD width='%5' class='tituloCampo'>Quantidade</TD>
                <TD width='%35' class='tituloCampo'>Pre&ccedil;o</TD>
            </TR>

            <%
        NumberFormat formatadorMoeda = NumberFormat.getCurrencyInstance();
        String valorTotal = formatadorMoeda.format(carrinho.calcularValorTotal());
        for(Item item: itens) {
            Produto p = item.getProduto();
            String preco = formatadorMoeda.format(p.getPreco());
            %>
            <TR>
                <TD width='%10' class='gridCampo'><%=p.getNome()%></TD>
                <TD width='%10' class='gridCampo'><%=p.getCodigo()%></TD>
                <TD width='%20' class='gridCampo'><%=p.getDescricao()%></TD>
                <TD width='%5' class='gridCampo'><%=item.getQuantidade()%></TD>
                <TD width='%35' class='gridCampo'><%=preco%> (preco unid.)</TD>
            </TR>
            <%
        } // end for
%>
            <TR>
                <TD align='right' colspan='6' class='tituloform'><%=valorTotal%></TD>
            </TR>
        </TABLE>

    </body>
</html>
