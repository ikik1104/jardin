$(function(){
	$('#first_sign').val('no_change');
	
});

	function openPreview(){
		
		var first_sign = $('#first_sign').val();
		if(first_sign=='no_change'){//아무것도 수정하지 않은 상태의 미리보기창 열기
			$('#first_wrap').css('display','block');
			$('#backbody').show();	
			return false;
		}
		var img_name = $('#new_content').val();
		if(img_name==''){
			$('#none_layerWrap').css('display','block');
			$('#backbody').show();				
		} else{
			$('#layerWrap').css('display','block');
			$('#backbody').show();				
		}
	
	}
			
	function openOriginal(){
		document.getElementById('first_open_sign').value='opening';
		$('#first_wrap').show();
		$('#backbody').show();			
	}
	
	function change_img(){
		
		$('#first_sign').val('changed');
		
		var content=$('#smartEditor').val();
		var title = $('#e_title').val();
		var img_name = $('#new_content').val();	
		var original_start =$('input#origin_start').val();
		var original_end =$('input#origin_end').val();	
		
		var start_date = inputform.e_start_day.value;
		var end_date = inputform.e_end_day.value;	
		
		if(start_date==''){
			start_date=original_start;
		}
		if(end_date==''){
			end_date=original_end;
		}		
		
		var final_date = start_date+" ~ "+end_date;
	
		if(img_name==''){
			 $('#none_img_title').html(title);
			 $('#none_img_date').html(final_date);			 
			 $('#none_img_content').html(content);				 
		} else{
	        const target = document.getElementsByName('new_content');
	        var html = '';
	        
	        $.each(target[0].files, function(index, file){
	            const fileName = file.name;
	            
	            var img_html='<img src="'+URL.createObjectURL(file)+'">';
	            
	            /*
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
	     		*/
	            const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
	            if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif" &&  fileEx != "bmp" && fileEx != "wmv" && fileEx != "mp4" && fileEx != "avi"){
	                alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");
	                resetFile();
	                return false;
	            }
	            /*
	            $('#layerWrap').html(html);*/
	            $('#img_title').html(title);
	            $('#img_date').html(final_date);	 
	            $('#img_img').html(img_html);	     
	            $('#img_content').html(content);		            
	            
	        });			
		}
    };

    function closePreview(){
    	
    	if($('#first_sign').val()=='no_change' || 	document.getElementById('first_open_sign').value=='opening'){
			$('#first_wrap').hide();
			$('#backbody').hide();	
			document.getElementById('first_open_sign').value='not_opening';
			return false;
    	}
		var img_name = $('#new_content').val();
		if(img_name==''){
			$('#none_layerWrap').hide();
			$('#backbody').hide();				
		} else{
			$('#layerWrap').hide();
			$('#backbody').hide();				
		}   	
    	
    };
    
    
    
    
    
    