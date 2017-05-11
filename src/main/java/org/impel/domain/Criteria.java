package org.impel.domain;


import java.util.Arrays;

public class Criteria {

	private int page;
	private int size;
	private String type;     // 검색에 쓸 것임.
	private String keyword;  //검색에 쓸 것임.
	private String types[];  // 검색에 쓸 것임.
	
	
	public String[] getTypes() {
		return types;
	}


	public void setTypes(String[] types) {
		this.types = types;
	}


	public Criteria(){
		this.page =1;
		this.size = 10;
		
	}
	
	
	public String getType() {
		return type;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setType(String type) {
		this.type = type;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	
	public Criteria settingPage(int page){
		if(page <=0){
			page =1;
		}
		return this;
	}
	//빌드업패턴쓰면 정보를 쓰고 싶은대로 쓸수 있음. 안쓰면 생성자 4개만들어야함.
	public Criteria settingSize(int size){
		if(size <=0 || size <= 5){
			this.size = 5;	
		}
		return this;
	}
	
	public int getSkip(){ 
		
		return (this.page-1)*this.size;
	}
	
	public int getAmount(){
		
		return this.size;
	}


	public int getPage() {
		
		return page;
	}

	
	public void setPage(int page) {
		this.page = page;
	}


	public void setSize(int size) {
		this.size = size;
	}


	public int getSize() {
		
		return this.size;
	}

	
	public String getSql(){
		
		return "AND 1 = 1 AND 2 = 2 AND 3 = 3";
	}




	@Override
	public String toString() {
		return "Criteria [page=" + page + ", size=" + size + ", type=" + type + ", keyword=" + keyword + ", types="
				+ Arrays.toString(types) + "]";
	}



	
	
}
