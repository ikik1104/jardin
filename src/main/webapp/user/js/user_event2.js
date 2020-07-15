/**
 * 
 */

//페이지 로드 시 작동
$(function(){
	
	var search_type=${search_type};
	var search_keyword=${search_keyword};
	
	if(search_type!='' && search_type!=null){
		$('#search_type').val(search_type).attr('selected', 'selected');
	}
	if(search_keyword!='' && search_keyword!=null){
		$('#search_keyword').val(search_keyword);
	}	
	
});

//페이징 - 안 쓰는데 지우기 아까워서 놔두는 메소드..
function paging(mode, newpage){
	
	var page=$('#page').val();//지금 페이지값
	var pageinput = $('#page');//페이지값 넣을 input
	
	if(mode=='firstPage'){
		pageinput.val(1);
	}
	if(mode=='prePage'){
		pageinput.val(page-1);
	}
	if(mode=='page'){
		pageinput.val(newpage);
	}
	if(mode=='nextPage'){
		pageinput.val(page+1);
	}
	if(mode=='lastPage'){
		pageinput.val(newpage);
	}
	
	//검색값 설정
	pagingForm.search_type.value=searchForm.search_type.value;
	pagingForm.search_keyword.value=searchForm.search_keyword.value;
	
	alert(pagingForm.search_type.value);
	alert(pagingForm.search_keyword.value);	
	
	pagingForm.submit();				
}