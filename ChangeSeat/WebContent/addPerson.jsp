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
.hidden
{
	width:1px;
	height:1px;
	border:0;
}
	
body{
	margin:0;
	padding:0;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"></jsp:include>
	
	<form method="post" name="fileSend" action="seat.jsp">
      <input type="hidden" name="seatTitle" value=""><!-- 설문제목 -->
      <input type="hidden" name="person" value=""><!--사람들 -->
    </form>
   <iframe class="hidden" name="hiddenifr" src="seat.jsp"></iframe>
   
<div class="content">

 <div id="id01" class="w3-modal">
      <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

        <div class="w3-center"><br>
          <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-brown w3-display-topright" title="Close Modal">&times;</span>
        </div>

          <div class="w3-section w3-padding" id="modalArea">
            <label>학급 제목</label>
            <input type="text" class="w3-input" placeholder="Enter Title" name="seatTitle" id="seatTitle" required>
            <br>
            <label>사람 수 </label>&nbsp;
            <input type="number" placeholder="Increase Number" name="person" id="person" required>
            <input type="button" value="OK" class="btn" onclick="createPerson()" required>
           </div>

        <div class="w3-container w3-border-top w3-light-grey">
           <button class="w3-button w3-block w3-brown w3-section w3-padding" onclick="document.getElementById('id01').style.display='none';createCardSurvey()">설문지 만들기</button>
        </div>

      </div>
    </div>
    
    <div class="w3-green w3-card w3-large">
   <a class="w3-bar-item w3-button w3-padding-large w3-hover-white w3-right" 
   style="position:absolute; right:5%; bottom:10%;" onclick="document.getElementById('id01').style.display='block'">+</a>
 </div>
</div>


	<jsp:include page="footer.jsp" flush="false"></jsp:include>
<script>
function createPerson()
{
  var cnt = document.getElementById("person").value;
  
  var i;
  var question;
  var question_text;
  var br = document.createElement("br");
  for(i=0; i<cnt; i++){
      question = document.createElement("input");
      question_text= document.createElement("p");

      question_text_node= document.createTextNode("사람"+(i+1));
      question_text.appendChild(question_text_node);
      question_text.setAttribute("id","question_text"+(i+1));
      document.getElementById("modalArea").appendChild(question_text);

      question.setAttribute("type", "text");
      question.className="w3-input w3-border";
      question.setAttribute("placeholder", "Select"+(i+1));
      question.setAttribute("id","question"+(i+1));//question설문제목1
      document.getElementById("modalArea").appendChild(question);
      document.getElementById("modalArea").appendChild(br);
  }

}

function createCardSurvey()
{
    //surveycard 생성되는 공간
	var surveyTitle_value=document.getElementById("seatTitle").value;
    var cnt = document.getElementById("person").value;
	
    var q="";
    //파일에 추가
    for(i=0;i<cnt;i++){
        q+=document.getElementById("question"+(i+1)).value;
        q+=",";
    }
    
  var form = document.fileSend;
  form.seatTitle.value=document.getElementById("seatTitle").value;
  form.person.value=q;
  form.target = "hiddenifr";   
  form.submit();
    
  resetSurvey();
}
function resetSurvey()
{
    var cnt = document.getElementById("person").value;

      var i;
      var question;
      var question_text;

      //지우기
      for(i=0;i<cnt;i++)
      {
          question=document.getElementById("question"+(i+1));
          question_text=document.getElementById("question_text"+(i+1));
          document.getElementById("modalArea").removeChild(question);
          document.getElementById("modalArea").removeChild(question_text);
      }
      document.getElementById("person").value="";
      document.getElementById("seatTitle").value="";
}
</script>
</body>
</html>