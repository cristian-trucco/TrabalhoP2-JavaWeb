<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import= "com.javap1.modelo.*"%>
<!DOCTYPE html>
<%@ page language="java" %>
<html>
<head>
   <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
    <link href=".bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href=".bootstrap/css/loja.css" rel="stylesheet">

<title>Login Page</title>
    
<script language = "Javascript">
function Validate(){
	var user=document.frm.user
	var pass=document.frm.pass
	
	if ((user.value==null)||(user.value=="")){
		alert("Please Enter user name")
		user.focus()
		return false
	}
	if ((pass.value==null)||(pass.value=="")){
		alert("Please Enter password")
		pass.focus()
		return false
	}
	return true
 }
</script>

</head>
<body>
    <!-- jQuery (necessario para os plugins Javascript Bootstrap) -->
    <script src="./bootstrap/js/jquery.js"></script>
    <script src="./bootstrap/js/bootstrap.min.js"></script>
     
    <div class="navbar navbar-inverse navbar-fixed-top">
		
                </div>
    <h1>Login<br></h1>

<form name="frm" action="LoginAuthentication" method="Post" onSubmit="return Validate()" >
Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="user" value=""/><br>
Password:<input type="password" name="password" value=""/><br>
<br>&nbsp;&nbsp;&nbsp;<input type="submit" value="Sign-In" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Reset" />
</form>

    <br>
        <jsp:include page="rodape.jspf"/>
</body>
</html>

