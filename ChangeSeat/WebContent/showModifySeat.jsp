<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.content{
	width:70%;
	margin-top : 150px;
	
	height:700px;
}

.xBtn
{
	margin:0 2% 4%;
}

.hidden
{
	width:1px;
	height:1px;
	border:0;
}
</style>
</head>
<body>
<jsp:include page="header.jsp" flush="false"></jsp:include>

    <form method="post" name="fileSend" action="modify.jsp">
      <input type="hidden" name="seatTitle" value="">
      <input type="hidden" name="personNum" value="">
    </form>
   <iframe class="hidden" name="hiddenifr" src="modify.jsp"></iframe> 
   
<%
	request.setCharacterEncoding("utf-8");
	String selectClass = request.getParameter("selectClass");
%>
<center>
<div class="content">
<div class="w3-row">
<%
		try{
			if(selectClass!=null)
			{
				String filePath = request.getRealPath("/txtfile/"+selectClass+".txt");
				BufferedReader br= new BufferedReader(new FileReader(filePath));
				String ss=null;			
				ss = br.readLine();
				String[] words = ss.split(",");
				for(String wo:words)
				{
					%>
					<div class="w3-col w3-white w3-border w3-container" style="width:25%"><p><%=wo%>
					<button class="w3-button w3-white w3-border w3-small xBtn"  onclick="xButton('<%=wo%>','<%=selectClass%>')" >X</button></p></div>
					<% 	
				}
				br.close();
			}
		}
		catch(Exception e){
			e.getStackTrace();
		}		
%>
</div>
</div>
</center>
  	<jsp:include page="footer.jsp" flush="false"></jsp:include>

<script>
function xButton(num,selectClass){
	  alert(num+" "+selectClass);
	  var form = document.fileSend;
	  form.seatTitle.value=selectClass;
	  form.personNum.value=num;
	  form.target = "hiddenifr";   
	  form.submit();
	  
	  window.location.reload();
}

</script>
</body>
</html>