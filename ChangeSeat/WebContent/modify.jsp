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
	request.setCharacterEncoding("utf-8");
	String seatTitle=request.getParameter("seatTitle");
	String personNum=request.getParameter("personNum");

	
	if(seatTitle!=null)
	{

		String filePath = request.getRealPath("/txtfile/"+seatTitle+".txt");
		BufferedReader likebr= new BufferedReader(new FileReader(filePath));
		ArrayList<String> strList= new ArrayList<String>();
		BufferedWriter bw=null;
		PrintWriter writer = null;	
		String ss=null;
		
		try{
			while(true){
				ss = likebr.readLine();
				System.out.println(ss);
				if(ss==null)break;
				String[] words = ss.split(",");
				for(String wo:words)
				{
				if(!wo.contains(personNum))
					strList.add(wo);
				}
			}
			likebr.close();
		}catch(Exception e){	
			e.getStackTrace();
		}
		
		for(int i=0; i<strList.size();i++)
			System.out.println(strList.get(i));
			
		try{
			bw = new BufferedWriter(new FileWriter(filePath,false));
			writer = new PrintWriter(bw,false);	
			
			for(int i=0; i<strList.size();i++){
				writer.print(strList.get(i)+",");
			}
			writer.flush();
			writer.close();
			
		}catch(Exception e){
			out.println("지정된 파일을 찾을 수 없습니다");
		}
	}
%>
</body>
</html>