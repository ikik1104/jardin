//미리보기창 보여주기
	function openPreview(){
			$('#layerWrap').css('display','block');
			$('#backbody').css('display','block');	
	}	
			
	function change_img(){
		
		var content=$('#smartEditor').val();
		var title = $('#e_title').val();
		/*
		var start = "";
		var end = "";
		
		if(inputform.e_start_day.value==null ||inputform.e_start_day.value=="" ){
			start = $('input#origin_start').val();
			alert(start);
		} else {
			start = $('#e_start_day').val();
		}
		if(inputform.e_end_day.value==null ||inputform.e_end_day.value==""){
			end = $('#origin_end').val();
			alert(end);
		} else {
			end = $('#e_end_day').val();
		}		
		*/
        const target = document.getElementsByName('new_content');
        var html = '';
        
        $.each(target[0].files, function(index, file){
            const fileName = file.name;
            html += '<div class="subject" style="width:670px;margin:0 auto; ';
            html += 'border-top:1px #5b524d solid; border-bottom:1px #5b524d solid; background:#ebebeb; word-break:keep-all; overflow:hidden;">';
            html+= '<ul style="width:100%; padding:11px 20px 10px 20px; overflow:hidden;">';
            html+= '<li style="float:left; font-size:14px; color:#444; font-weight:600; line-height:1.3;">';
            html += title+'</li></ul></div>';
            html+='<div class="day" style="width:670px; margin:0 auto; margin-bottom:30px; font-size:14px; font-weight:600; color:#666; border-bottom:1px #d9d9d9 solid; overflow:hidden;">';
            html+='<p class="txt" style="float:left; padding:13px 0 12px 0; margin:0 0 0 20px; color:#666;">';
            html+='이벤트 기간<span style="font-size:13px; color:#666; font-weight:normal; padding:0 18px 0 14px;">';
            html+= ' ~ </span></p></div>';
            html += '<img src="'+URL.createObjectURL(file)+'" style="width:630px; display:block; margin:0 auto;"><br>';
            html += '<pre id="preview_text" style="width:630px;margin:0 auto;  margin-top:10px;white-space:pre-wrap; word-break:break-all;font-size:14px; color:#727272; font-family: "Nanum Gothic", sans-serif, "Dotum", "Gulim", "Arial", sans-serif;'; 
            html += '">'+content+'</pre>';
            html += '</div>';
     
            /*
            html += '<span>기간 '+'<input type="text" /></span>';
            html += '<a href="#" id="removeImg">╳</a>';
            */
            const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
            if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif" &&  fileEx != "bmp" && fileEx != "wmv" && fileEx != "mp4" && fileEx != "avi"){
                alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");
                resetFile();
                return false;
            }
            $('#layerWrap').html(html);
        });
 
    };

    function closePreview(){
    	$('#layerWrap').css('display', 'none');
    	$('#backbody').css('display', 'none');   	
    }
    
    
    
    
    
    