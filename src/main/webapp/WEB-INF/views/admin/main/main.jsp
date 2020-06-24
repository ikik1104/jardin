<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function uploadFile() {
//         	var formData = new FormData($("#main_banner")[0]);

        	var formData = new FormData(); 
        	formData.append("config", $("#config1").val()); 
        	formData.append("banner1", $("#banner1")[0].files[0]);
        	formData.append("banner2", $("#banner2")[0].files[0]);
        	formData.append("banner3", $("#banner3")[0].files[0]);
        	formData.append("banner4", $("#banner4")[0].files[0]);


            $.ajax({
                url : 'admin_file',
                processData : false,
                contentType : false,
                enctype: 'multipart/form-data',
                data : formData,
                type : 'POST',
                success : function(result) {
                    alert("업로드 성공!!");
                },
                error: function(){
                    alert("데이터 가져오기 실패");
                }
            });
        }
    </script>
</head>
<body>
    <jsp:include page="../nav/admin_header.jsp" />
    <jsp:include page="../nav/main_nav.jsp" />
    <section>
        <h1>관리자 메인</h1>
        <div id="main_list">
            <form id="main_banner" method="post" enctype="multipart/form-data" action="">
                <input type="hidden" id="config1" name="config" value="config1">
                <input type="file" id="banner1" name="banner1">
                <input type="file" id="banner2" name="banner2">
                <input type="file" id="banner3" name="banner3">
                <input type="file" id="banner4" name="banner4">
                <a href="javascript:uploadFile();">전송</a>
            </form>
        </div>
    </section>
</body>
</html>