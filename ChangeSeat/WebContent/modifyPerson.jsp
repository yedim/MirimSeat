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
		    <h3>사람 수정</h3>
		  </div>
		  <form class="w3-container" method="post" action="showModifySeat.jsp">
		   
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
		    <button class="w3-btn w3-brown">Register</button></p>
		  </form>
		</div>
	</section>
	
	</div>
	<jsp:include page="footer.jsp" flush="false"></jsp:include>

</body>
</html>