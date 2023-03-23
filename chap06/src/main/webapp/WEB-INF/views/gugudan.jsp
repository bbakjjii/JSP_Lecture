<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>06_�ݺ���.html</title>
    <link rel="stylesheet" href="./css06.css">
    <style>
        /* display:grid�� �̿��� �������� ���ְ� ������ �������� */ 
        #grid-container {
            display: grid;
            grid-template-columns: 0.5fr repeat(9, 1fr);
            grid-template-rows: repeat(9, 50px);
        }

        #grid-container > div {
            border: dashed orange 3px;
            border-radius: 10px;
        }

        #grid-container > .gop {
            border-color: red;
        }

        #grid-container > .dan {
            border-color: green;
        }
    </style>
</head>
<body>

    <h3>�ڹٽ�ũ��Ʈ���� �ݺ����� �ִ�</h3>

    <ul>
        <li>for���� �ִ�</li>
        <li>while���� �ִ�</li>
    </ul>

    <div id="grid-container"></div>

    <script>
        // QUIZ. �ڹٽ�ũ��Ʈ�� �̿��� �������� �����غ����� 
        // ����� ����
        const gugudan = document.getElementById('grid-container');

        let dan = 2;
        let gop = 0;

        while (gop <= 9){
            if (gop === 0){
                gugudan.innerHTML += '<div></div>';
            } else {
                gugudan.innerHTML += '<div class="gop">x' + gop + '</div>';
            }
            ++gop;
        }

        while (dan <= 9){
            gop = 1;
            gugudan.innerHTML += '<div class="dan">' + dan + '��</div>';
            while (gop <= 9) {
                gugudan.innerHTML += '<div>' + dan + ' x ' + gop + ' = ' 
                + dan * gop + '</div>';
                ++gop;
            }
            ++dan;
        }
    </script>    
</body>
</html>