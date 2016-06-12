

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.javap1.modelo.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Loja de Robôs!</title>
        <head>
<link rel="stylesheet" type="text/css"
    href="./bootstrap/css/bootstrap.min.css">
 
<link href="./bootstrap/css/loja.css" rel="stylesheet">
 
<script src="./bootstrap/js/bootstrap.min.js"></script>
    
        </head>
    <body style="width: 750px">

        <jsp:include page="cabecalho.jspf"/>

        <h1> Skynet! - Escolha seu Robô</h1>
        <div>
            <p>Bem vindo a Skynet lider  em
                robotica.<br>
                Escolha um dos nosso produtos abaixo.<br>


            </p>

        </div>
        <h3 align="center">Nossos Robos - desenvolvidos com tecnologia de ponta!!!</h3>
        <jsp:useBean id= "CardapioBean" class= "com.javap1.modelo.Cardapio" scope="session"/>
        <table border="1">
            <tr>
                <th>Código</th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Preço</th>
                <th>Ação</th>
            </tr>
            <c:forEach var="robo" items= "${CardapioBean.cardapio}" >
                <tr>
                    <td><c:out value= "${robo.codigo}" /></td>
                    <td>
                        <c:if test="${robo.codigo == 1}"> <img src="images/domestico.jpeg" width="50" height="50" alt="domestico"/> 
                        </c:if>
                        <c:if test="${robo.codigo == 2}"> <img src="images/seguranca.jpeg" width="60" height="60" alt="seguranca"/>
                        </c:if>
                        <c:if test="${robo.codigo == 3}"> <img src="images/medico.jpeg" width="50" height="50" alt="medico"/>
                        </c:if>                       
                        <c:if test="${robo.codigo == 4}"> <img src="images/t800.png" width="60" height="60" alt="exterminador"/>
                        </c:if>
                        
                        <c:out value= "${robo.nome}" />
                    </td>
                    <td><c:out value= "${robo.descricao}" /></td>
                    <td><c:out value= "${robo.preco}" /></td>
                    <td>
                        <input type="button" class="btn btn-success"value="Adicionar ao carrinho" onclick= "javascript:document.location = 'ServletController?cmd=AdicionarItem&codigo=${robo.codigo}'"/>
                    
                    </td>
                </tr>
            </c:forEach>
        </table>

        <br />
        <jsp:include page="rodape.jspf" />



    </body>
</html>
