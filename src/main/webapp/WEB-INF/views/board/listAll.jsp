<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->


		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">Search Bar</h3>
					
						<form id="flist" action="/board/listAll" method="get">
							<input type='hidden' id='hpage' name='page' value="${idx}">
							<input type='hidden' id='hbno' name='bno'>
	
	 				<div>
            	<select name = 'type'> <!--검색조건 눌렀을때, 정보유지 + 해당 키워드로 검색 type을 맞춰줘야함 -->
            		<option value='x' ${cri.type eq 'x' ? "selected":""}>-----</option>
            		<option value='t' ${cri.type eq 't' ? "selected":""}>Title</option>
            		<option value='w' ${cri.type eq 'w' ? "selected":""}>Writer</option>
            		<option value='tw' ${cri.type eq 'tw' ? "selected":""}>Title+Writer</option>
            	</select>
            
            	<input type ='text' name='keyword' value="${cri.keyword}">
            	<button id='searchBtn'>Search</button>
            
          </div>

				</form>
				
				</div>

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">BOARD LIST</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>BNO</th>
							<th>TITLE</th>
							<th>WRITER</th>
							<th>REGDATE</th>
						</tr>
					
					<c:choose>
						<c:when test="${listSize != 0 }">
						<c:forEach items="${list}" var="BoardVO">
						
							<tr>
								<td>${BoardVO.bno}</td>
								<td><a href="/board/read?page=${pageMaker.current}&bno=${BoardVO.bno}&type=${cri.type}&keyword=${cri.keyword}"> ${BoardVO.title}</a></td>
								<td>${BoardVO.writer}</td>
								<td>${BoardVO.regdate}</td>
							</tr>	
														
						</c:forEach>
					</c:when>

				<c:when test="${listSize ==0}">
					<tr>
						<td><h2>
							조건에 맞는 검색 결과가 없습니다. <button id="bBtn" type="submit" class="btn btn-primary">List</button>
						</h2>
				</td>
				</tr>				
				</c:when>
						</c:choose>
			
					</table>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">
				
					<div class="text-left"><!--새글쓰기 버튼 왼쪽으로 빼려면 text-left로 사용하면됨  -->
				
				<!--새글쓰기 버튼 -->
				<button id="nBtn" type="submit" class="btn btn-primary">New Write</button>
				
					 <ul class="pagination pagination-sm no-margin pull-right">
					 
				
              <c:if test="${pageMaker.prev}">
                <li><a href="${pageMaker.start-1}">&laquo;</a></li>
                </c:if>
                
                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="idx">
                <li class='${idx == pageMaker.current?"active":"" }'><a href="${idx}">${idx}</a></li>
               </c:forEach>
               
               <c:if test="${pageMaker.next}">
                <li><a href="${pageMaker.end +1 }">&raquo;</a></li>
                </c:if>
                
              </ul>
					</div>
		<form	role="form" action="update" method="post">
			<input type='hidden' name='page' values="${cri.page}">
			<input type='hidden' name='type' values="${cri.type}">
			<input type='hidden' name='keyword' values="${cri.keyword}">
		</form>
		
			
				</div>
				<!-- /.box-footer-->

		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<script>
	var result = '${msg}';
	

	if (result == 'SUCCESS') {
		history.pushState(null, null,"/board/listAll");
		alert("처리가 완료되었습니다.");
	}
	
	window.onpopstate = function(e){
		history.go(1);
	};
	
</script>

<script>
$(document).ready(function() {
	
	var $total= "${pageMaker.total}";
	
	
	$("#bBtn").on("click", function(e){
		
		self.location = "listAll";
		
	})
	
	
	$("#searchBtn").on("click",function(e) {
		e.preventDefault();
		$('#hpage').val("1"); //페이지주소 1페이지로 가게 해줌 
		$("#flist").submit();
		
	}); //end searchBtn
	

	$(".pagination li a").on("click", function(e) {
		
	 	history.pushState(null, null,"/board/listAll");
		e.preventDefault();
		
		var $this = $(this);
		$("#hpage").val($this.attr("href"));
		$("#flist").submit();
	});//end .pagination
	
	
	$("#nBtn").on("click", function(e){
		
		self.location = "regist";
	 	history.pushState(null, null,"/board/listAll");
	}); //end .btn btn-primary
	
});

</script>


<%@include file="../include/footer.jsp"%>
