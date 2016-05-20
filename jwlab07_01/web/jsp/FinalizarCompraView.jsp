<html>
    <head>
        <title>Formul&aacute;rio Pagamento</title>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <link href='../jw.css' rel='stylesheet' type='text/css'></link>
    </head>

    <body>
        <H3>Dados do Pedido (JSP)</H3>

        <%  String contexto = request.getContextPath();%>

        <form name='formularioPagamento' method='post' action='PedidoView.jsp' >

            <table width='80%'>
                <tr>
                    <td class='tituloform'>Dados pessoais</td>
                </tr>
                <tr>
                    <td class='gridTopico'>
                        <table width='100%' border='0' cellspacing='1'>
                            <tr>
                                <td width='16%' class='gridTopico'>Nome</td>
                                <td width='84%' class='gridTopico'><input name='nome' type='text'
                                                                          size='80'></td>
                            </tr>
                            <tr>
                                <td class='gridTopico'>CPF</td>
                                <td class='gridTopico'><input name='cpf' type='text' size='80'></td>
                            </tr>
                            <tr>
                                <td class='gridTopico'>e-mail</td>
                                <td class='gridTopico'><input name='email' type='text' size='80'></td>
                            </tr>
                            <tr>
                                <td class='gridTopico'>Telefone</td>
                                <td class='gridTopico'><input name='telefone' type='text'></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td><span class='tituloform'><br>
                        Endere&ccedil;o de entrega</span><br>
                    </td>
                </tr>

                <tr>
                    <td bgcolor='#FFFFFF' class='gridTopico'>
                        <table width='100%'>
                            <tr>
                                <td class='gridTopico'>Rua/Av</td>
                                <td class='gridTopico'><input name='rua' type='text' size='60'></td>
                                <td class='gridTopico'>N&uacute;mero</td>
                                <td class='gridTopico'><input name='numero' type='text' size='5'></td>
                            </tr>
                            <tr>
                                <td class='gridTopico'>Bairro</td>
                                <td class='gridTopico'><input name='bairro' type='text' size='60'></td>
                                <td class='gridTopico'>Cidade</td>
                                <td class='gridTopico'><input name='cidade' type='text'></td>
                            </tr>
                            <tr>
                                <td class='gridTopico'>Estado</td>
                                <td class='gridTopico'><input name='estado' type='text' size='60'></td>
                                <td class='gridTopico'>CEP</td>
                                <td class='gridTopico'><input name='cep' type='text'></td>
                            </tr>
                        </table>
                    </td>
                </tr>


                <tr>
                    <td class='tituloform'><br>
                    Dados para pagamento</td>
                </tr>

                <tr>
                    <td bgcolor='#FFFFFF' class='gridTopico'>
                        <table width='100%' border='0' cellspacing='0'>
                            <tr class='gridTopico'>
                                <td width='25%'>Cart&atilde;o de cr&eacute;dito</td>
                                <td width='75%'><select name='tipo'>
                                        <option value='Visa' selected>visa</option>
                                        <option value='Master Card'>mastcard</option>
                                        <option value='American Express'>amex</option>
                                </select></td>
                            </tr>
                            <tr class='gridTopico'>
                                <td>N&uacute;mero do cart&atilde;o</td>
                                <td><input name='numeroCartao' type='text' size='30'></td>
                            </tr>
                            <tr class='gridTopico'>
                                <td>Data Validade</td>
                                <td><input name='dataValidade' type='text' size='10'></td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td class='tituloform'><br>
                    <input type='submit' value='submit'></td>
                </tr>

            </table>

        </form>
    </body>
</html>
