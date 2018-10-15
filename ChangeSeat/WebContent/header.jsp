<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Insert title here</title>
<style>
body{
	margin:0;
	padding:0;
}
.topnav {
   list-style-type: none;
   margin: 0;
   overflow: hidden;
   position: fixed;
   top: 0;
   width: 100%;
   color:#1f4e5f;
   background-color:#79a8a9;
   padding-right:8%;
   z-index:100
}

.topnav a {
    float: right;
    display: block;
    color:#f4f7f7;
    text-align: center;
    padding: 15px;
    text-decoration: none;
    font-size:1.2em;
    margin: 20px;
    cursor:pointer;   
    font-weight:bold;
}

.topnav a.logo {
    float: left;
    margin-left:7%;
    text-decoration: none;
}

.topnav a:hover {
    color: #1f4e5f;/*연보라  */
}


</style>
</head>
<body>
	
    <nav class="topnav">
      <a href="index.jsp" class="logo">짝꿍</a>
      <a href="modifyPerson.jsp">수정하기</a>
      <a href="addPerson.jsp">추가하기</a>
      <a href="changeSeat.jsp">자리배치</a>
    </nav>
    
</body>
</html>