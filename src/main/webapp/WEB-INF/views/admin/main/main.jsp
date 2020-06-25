<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
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
                success : function(mbdtos) {
                	alert("업로드 성공!!");
                	location.reload();
                },
                error: function(){
                    alert("데이터 가져오기 실패");
                }
            });
        }
        
        
        function uploadFile_mid() {
        	var formData = new FormData(); 
        	formData.append("config", $("#config2").val()); 
        	formData.append("mid_left", $("#mid_left")[0].files[0]);


            $.ajax({
                url : 'admin_file',
                processData : false,
                contentType : false,
                enctype: 'multipart/form-data',
                data : formData,
                type : 'POST',
                success : function(mbdtos) {
                	alert("업로드 성공!!");
                	location.reload();
                },
                error: function(){
                    alert("데이터 가져오기 실패");
                }
            });
        }
    </script>
    <style>
    .banners{ width: 100px;}
    .bannerImg{margin-top: 41px;}
    </style>
</head>
<body>
    <jsp:include page="../nav/admin_header.jsp" />
    <jsp:include page="../nav/main_nav.jsp" />
    <section>
        <h1>메인 디자인 관리</h1>
        <div id="main_list">
            <div id="roll_bann">
                <h2>메인 롤배너</h2>
                    <form id="main_banner" method="post" enctype="multipart/form-data" action="">
                        <input type="hidden" id="config1" name="config" value="config1"><br>
                        <input type="file" id="banner1" name="banner1">
                        <input type="file" id="banner2" name="banner2">
                        <input type="file" id="banner3" name="banner3">
                        <input type="file" id="banner4" name="banner4">
                        <a href="javascript:uploadFile();">등록</a>
                    </form>
                    <div class="bannerImg">
                        <span>배너1</span>
                        <img class="banners" src="${ mbdto.getB_1() }">
                        <span>배너2</span>
                        <img class="banners" src="${ mbdto.getB_2() }">
                        <span>배너3</span>
                        <img class="banners" src="${ mbdto.getB_3() }">
                        <span>배너4</span>
                        <img class="banners" src="${ mbdto.getB_4() }">
        
                    </div>
            </div>
            <div id="middle_bann">
                <h2>중간배너</h2>
                <form id="middle_banner" method="post" enctype="multipart/form-data" action="">
                    <input type="hidden" id="config2" name="config" value="config2"><br>
                    <input type="file" id="mid_left" name="mid_left">
                    <a href="javascript:uploadFile_mid();">등록</a>
                </form>
            </div>  
        </div>
    </section>
</body>
</html>