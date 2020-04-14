<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<div style="margin-top:100px; margin-bottom:100px;">
<img src="${pageContext.request.contextPath }/photo/banner_exam.png">
<div style="margin-bottom:50px;">
	<img src="${pageContext.request.contextPath }/photo/lcbtn.png" onclick="goWindow(1)">
	&nbsp;&nbsp;&nbsp; 
	<img src="${pageContext.request.contextPath }/photo/rcbtn.png" onclick="goWindow(2)">
</div>
</div>	
<script>
function goWindow(x) {
	var uri = '${pageContext.request.contextPath }/test/exam?check='+x;
	var popupName = 'minitest';
	if(x==1){
		var options = 'width=1100,height=950,left=400,top=10,location=no,status=no,scrollbars=yes,resizable=no';
	}else{
		var options = 'width=1100,height=650,left=400,top=150,location=no,status=no,scrollbars=yes,resizable=no';
	}
	openDialog(uri, popupName, options, function(win) {
	    location.href='${pageContext.request.contextPath }/test/delete'
	});
}; 



var openDialog = function(uri, name, options, closeCallback) {
    var win = window.open(uri, name, options);
    var interval = window.setInterval(function() {
        try {
            if (win == null || win.closed) {
                window.clearInterval(interval);
                closeCallback(win);
            }
        }
        catch (e) {
        }
    }, 500);
    return win;
};

</script>
</body>
</html>