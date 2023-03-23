<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>HttpProtocol.jsp</title>
</head>
<style>
#url-example {
	position: relative;
	padding: 15px;
	word-spacing: -5px;
	<!--
	����
	����
	����
	-->
}

#protocol {
	border: solid 2px blue;
}

/* + : protocol ������ ������ div ���� */
#protocol+div {
	position: absolute;
	color: blue;
	font-size: 0.8em;
}

#ip-address {
	border: solid 2px tomato;
}

/* absolute : �θ�(����) ��Ҹ� �������� ��ġ */
#ip-address+div {
	position: absolute;
	color: tomato;
	font-size: 0.8em;
	left: 7em;
	top: -3px;
}

#port-number {
	border: solid 2px green;
}

#port-number+div {
	position: absolute;
	color: green;
	font-size: 0.8em;
	left: 15em;
}

#uri {
	border: solid 2px purple;
}

#uri+div {
	position: absolute;
	color: purple;
	font-size: 0.8em;
	left: 20em;
	top: -3px;
	word-spacing: 0;
}
</style>
<body>

	<h3># �������� (Protocol)</h3>
	<ul>
		<li>��� �Ծ�</li>
		<li>��ǻ�͵� ���� ��� ������ �����ϰ� �ش� ������ �̸��� ���̴� ��</li>
		<li>ftp, http, https, telnet, smtp ... ���</li>
	</ul>

	<h3># HTTP ���������� �۵� ����</h3>

	<!-- ol : ������� ��ȣ�� ���� -->
	<ol>
		<li>�����(Ŭ���̾�Ʈ, ��Client)�� �� �������� �ּ�â�� ���� ���� �������� URL�� �Է��Ѵ�. 
			(��ũ�� Ŭ���ϴ� �͵� �ּ�â�� URL�� �Է��ϴ� �Ͱ� ���� ȿ���� �ִ�)</li>
		<li>�� �������� URL�� ���Ե� ȣ��Ʈ�� *IP�ּҸ� ���� �ش� �� ������ ��û(��Request)�� ������.<br>
			ex)<br>
			�� https://comic.naver.com/webtoon/detail?titleId=748105&no=197&weekday=sun����<br>
			�� URL = protocol://ip_addr:port/uri<br> �� protocol : http://<br>
			�� ip_addr:port : comic.naver.com (port��ȣ�� 80���� 443���� ������ �����ϴ�)<br>
			�� (IP �ּ� ��� �������ּ� ��� : Domain Name Service, DNS)<br> 
			�� http://127.0.0.1:9000/chap01/HttpProtocol.jsp<br> 
			�� protocol : http://<br> 
			�� ip_addr:port : 127.0.0.1:9000<br> 
			�� uri : chap01/HttpProtocol.jsp<br>
		</li>
		<li>��û�� ���� �� ������ Ŭ���̾�Ʈ�� ���� URL�� ���� �˸��� ���(html, �̹���, css, js ��)�� Ŭ���̾�Ʈ���� ����(��Response)�Ѵ�</li>
		<li>������ ���� Ŭ���̾�Ʈ�� �� �������� �ش� ������ �ؼ��Ͽ� Ŭ���̾�Ʈ���� �����ش�</li>
	</ol>

	<h3># URL</h3>
	<div id="url-example">
		<span id="protocol">https://</span>
		<div>��������</div>
		<span id="ip-address">comic.naver.com</span>
		<div>IP�ּ�(DNS)</div>
		<span id="port-number">(:443)</span>
		<div>��Ʈ��ȣ(���� ����)</div>
		<span id="uri">/webtoon/detail?titleId=748105&no=197&weekday=sun</span>
		<div>URI(� ������ ��û�� ������)</div>
	</div>

	<h3># DNS (Domain Name Service)</h3>
	<ul>
		<li>IP�ּ� �ڸ��� ��� �� �� �ִ� IP�ּҺ��� ���� ���� �̸�</li>
		<li>IP�ּҴ� �ܿ�� ���� �ܿ�� ���� �̸����� ġȯ���ִ� �����̴�</li>
		<li>URL�� IP�ּ� ��� ������ �̸��� ����ϸ� ��ó�� DNS�������� �˸��� IP�ּҸ� ã�� �� �ش� ������
			ã�ư��� �ȴ�</li>
	</ul>

	<h3># ��Ʈ ��ȣ</h3>
	<ul>
		<li>�ش� �����Ͱ� � ���α׷��� ���������� �����ϱ� ���� ��ȣ</li>
		<li>0 ~ 65535�� ���� �ִ� (2byte)</li>
		<li>���������� ����ϴ� �� �˷��� ��Ʈ��ȣ(well-known port)���� �ִ�</li>
		<li>�� �˷��� ��Ʈ��ȣ���� URL���� ������ �����ϴ� (80, 22, 23, 443, ...)</li>
	</ul>
</body>
</html>