<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>강의게시판</title>
 </head>
 <style>
 table.absolute {
 position: absolute;
  top: 80px;
  right: 0;
  width: 1200px;
  height: 500px;
 }
 </style>
 <body>
<form method="post" name="videowriteform" enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/video/writePro">
			<input type="hidden" name="num" value="${num }">
<table class="absolute">
  <tr>
   <td>
    <table width="50%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>강의등록</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table width="50%">
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
      <tr>
      <td>&nbsp;</td>
      <td align="center">강사명</td>
      <td><input name="teacher" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">과목명</td>
      <td><input name="subject_name" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">강의명</td>
      <td><input name="class_name" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">file</td>
      <td><input type="file" size="40" maxlength="100"
						name="uploadfile"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=submit value="등록">
       <input type=reset value="다시작성">
       <input type=button value="취소" onclick="window.location='${pageContext.request.contextPath}/view/loginpage/mypagelist.jsp'">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 </form>
</body> 
</html>



