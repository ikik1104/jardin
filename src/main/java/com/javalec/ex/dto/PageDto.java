package com.javalec.ex.dto;

public class PageDto {

	private int page, startPage, endPage, total, cntPerPage, lastPage, startRow, endRow;
	private int range = 5; //페이지 레인지 (1~5 페이지 세트로 보여주기)
	
	public PageDto() {}
	public PageDto(int total, int page, int cntPerPage) {
		this.total = total; //전체 게시글 수
		this.page = page; //오픈할 페이지
		this.cntPerPage = cntPerPage; //한 페이지당 글 수
		calcLastPage(total, cntPerPage);
		calcStartEndPage(page, range);
		calcRownum(page, cntPerPage, total);
	}
	
	//마지막페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		lastPage = ((total-1)/cntPerPage)+1;
	}
	
	//현재 페이지 레인지의 첫번째, 마지막 페이지 숫자 계산
	public void calcStartEndPage(int page, int range) {
		startPage = ((page-1)/range)*range+1;
		endPage = startPage+range-1;
		if(endPage > lastPage) { endPage = lastPage; }
	}
	
	//페이지 내에서 rownum 첫번호 끝번호
	public void calcRownum(int page, int cntPerPage, int total) {
//		endRow = page * cntPerPage;
//		startRow = endRow - cntPerPage + 1;
		startRow = total - (page-1) * cntPerPage;
		endRow = startRow - cntPerPage + 1;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}
	

	
	
	
}
