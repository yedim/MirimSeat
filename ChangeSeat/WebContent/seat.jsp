<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String seatTitle=request.getParameter("seatTitle");
	String person=request.getParameter("person");

	if(seatTitle!=null && person!=null)
	{
		String filePath = request.getRealPath("/txtfile/"+seatTitle+".txt");
		 BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, false));
         PrintWriter pw= new PrintWriter(bw,false);	

         // 파일안에 문자열 
         pw.print(person);
         pw.flush();
         // 객체 닫기
         pw.close();

	}
	System.out.println(seatTitle+" "+person);

%>
</body>
</html>