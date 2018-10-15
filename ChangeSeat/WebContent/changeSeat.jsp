<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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
	<section class="content" >
		<div class="w3-card-4" style="width:60%;margin:5% 20%;">
		  <div class="w3-container w3-brown">
		    <h3>자리배치</h3>
		  </div>
		  <form class="w3-container" method="post" action="showSeat.jsp">
		   
		    <p>      
		     <label class="w3-text-brown"><b>반 선택</b></label>
		     <select class="w3-select" name="selectClass">
		     	<option value="" disabled selected>반을 선택하세요</option>
		     
		     <%
				File folder = new File(request.getRealPath("/txtfile/"));
				File[] listOfFiles = folder.listFiles();
				String tmpFileName=null;
				
				for(int i=0; i<listOfFiles.length;i++)
				{
					if(listOfFiles[i].isFile()){
						
						tmpFileName=listOfFiles[i].getName().replace(".txt","");
						String filePath = request.getRealPath("/txtfile/"+tmpFileName+".txt");
						String desk=null;
						try{
							if(tmpFileName!=null && !tmpFileName.contains("null"))
							{
								%>
								<option value="<%=tmpFileName%>"><%=tmpFileName%></option>
								<% 
								
							}
						}
						catch(Exception e){
							e.getStackTrace();
						}		
					}
				}
			%>
			  </select>
			</p>
			 <p>      
		    <label class="w3-text-brown"><b>분단 수</b></label>
		    <select class="w3-select" name="selectDesk">
		     	<option value="" disabled selected>분단 수를 선택하세요</option>
		     	<option value="2">2</option>
		     	<option value="3">3</option>
		     	<option value="4">4</option>
		     </select>
		    <p>
		    <button class="w3-btn w3-brown">Register</button></p>
		  </form>
		</div>
	</section>
	<jsp:include page="footer.jsp" flush="false"></jsp:include>

</body>
</html>