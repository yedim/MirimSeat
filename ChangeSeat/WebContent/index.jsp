<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.content{
	width:100%;
	margin-top : 150px;
	height:700px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp" flush="false"></jsp:include>

	<center>
		<div class="content">
		<form action = "changeSeat.jsp">
			<h2>짝꿍</h2>
			<input type="submit" value="로그인">
		</form>
		</div>
	</center>
<jsp:include page="footer.jsp" flush="false"></jsp:include>
	
</body>
</html>