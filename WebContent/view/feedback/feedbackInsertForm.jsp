
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/feedback/insertFeedback" method="post">
<div style="text-align: center;">
    <table style="border: 0px; width: 1000px; text-align: center; margin: auto;">
        <tr style="background-color: yellow;">
            <td style="width:100%; height: 50px;"><h2 style="font-size: 2em;">불편사항</h2></td>
		<tr>
   </table>
   
   
   
   
	<textarea style="width: 900px; height:120px;" name="feedback"></textarea>
	

 
</div>
    <div><input type="submit" style="background-color: yellow; 
    border: 0px; height: 50px; width: 200px;" value="글쓰기"/></div>
</form>
 
  <div id="result"></div>
</body>
</html>
