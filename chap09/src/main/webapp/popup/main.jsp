<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>들어오면 팝업창이 뜨는 페이지</title>
</head>
<body>

	<h3>원래 여기 들어오면 팝업창이 뜸</h3>
	
	<script>
		const url = "./popup.jsp";
		const name = "popup";
		
		// window.open() : 새 창을 열어주는 자바스크립트 메서드
		window.open(url, name, 
				"width=250, height=200, toolbar=no, status=no, location=no");
	</script>

</body>
</html>