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
	width:80%;
	text-align:center;
	margin-top : 150px;
	height:700px;
}

</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"></jsp:include>

<%
	request.setCharacterEncoding("utf-8");
	String selectClass = request.getParameter("selectClass");
	String selectDesk = request.getParameter("selectDesk");
	String filePath = request.getRealPath("/txtfile/"+selectClass+".txt");
	
	ArrayList<String> list= new ArrayList<String>();

%>
<center>
<div class="content"  >


<div class="w3-button w3-teal" style="position:absolute; bottom:125px;" onclick="document.getElementById('id01').style.display='block'" >열기</div>
<div class="w3-button w3-teal" style="position:absolute; right:10px;"  onclick="changeSeat()">다음</div>
<div class="w3-border" >교탁</div>
<div class="w3-row" >
<%
		try{
			if(selectClass!=null)
			{
				BufferedReader br= new BufferedReader(new FileReader(filePath));
				String ss=null;			
				ss = br.readLine();
				String[] words = ss.split(",");
				int cnt=0;
				for(String wo:words)
				{
					if(selectDesk.contains("2"))
					{
						%>
						<div class="w3-col w3-border w3-container seatDiv" id="desk<%=cnt%>" style="width:25%; height:50px;" ondrop="drop(event)" ondragover="allowDrop(event)"> <p> </p> </div>
						<% 
					}else if(selectDesk.contains("3"))
					{
						%>
						<div class="w3-col w3-border w3-container seatDiv" id="desk<%=cnt%>" style="width:16%; height:50px;"  ondrop="drop(event)" ondragover="allowDrop(event)"><p> </p></div>
						
						<%
					}else if(selectDesk.contains("4"))
					{
						%>
						<div class="w3-col w3-border w3-container seatDiv" id="desk<%=cnt%>" style="width:12%; height:50px; " ondrop="drop(event)" ondragover="allowDrop(event)"><p> </p></div>
						<%
					}			
					list.add(wo);
					cnt++;
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

<center>

</center>
 <div id="id01" style="position:absolute; bottom:20%; left:40%; display:none">
    <div class="w3-modal-content w3-card-4 "  style="width:155%">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h6>사람 목록</h6>
      </header>
      <div class="w3-container" id ="personlist">
        <%
       		for(int i=0; i<list.size();i++){
       			%>
       			<p class="pTag" style="display:inline; border:1px solid black;" draggable="true" ondragstart="drag(event)" id="<%=list.get(i) %>"<%--  ondblclick="lock('<%=list.get(i) %>')"  --%>><%=list.get(i) %></p>
       			<% 
       		}
       %>
      </div>
     
    </div>
  </div>

</center>
 <script>
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}

/* function lock(id){
	document.getElementById(id).style.backgroundColor="red";
	document.getElementById(id).setAttribute('draggable','false');
} */

function changeSeat()
{
	var seatDiv = document.querySelectorAll(".seatDiv");//책상
	var pTag = document.querySelectorAll(".pTag");//사람
	var pid;
	var i;
	var j;	
	var arr=[];
	
	for(i=0; i< pTag.length; i++){
		arr.push(pTag[i]);
		alert(pTag[i].id);
	}
	
	 arr = shuffle(arr);
	 alert(arr); 
	 
	 var seatNum=0;
	 
	 
	 for(i=0; i<seatDiv.length; i++){
		 document.getElementById(seatDiv[i].id).innerHTML=arr[seatNum]; seatNum++;
	 } 
	
}

function shuffle(arr){
	for(var c = arr.length-1; c>0;c--){
		var b= Math.floor(Math.random()*(c+1));
		var a = arr[c]; 
		arr[c]=arr[b]; 
		arr[b]=a;
	}
	return arr;
}

</script>
 	<jsp:include page="footer.jsp" flush="false"></jsp:include>
</body>
</html>