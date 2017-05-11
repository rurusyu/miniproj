<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>

<form role="form" method="post">

	<input type="hidden" name='bno' value="${boardVO.bno}">

</form>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- /.box-header -->

				
					<div class="box-body">
					
					<div class="form-group">
							<label for="exampleInputEmail1">Bno</label> <input type="text" name='bno' class="form-control" placeholder="${boardVO.bno}" readonly="readonly">
						</div>
					
						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> <input type="text" name='title' class="form-control" placeholder="${boardVO.title}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="content" rows="3" placeholder="${boardVO.content}" readonly="readonly"></textarea>
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> <input type="text"
								name="writer" class="form-control" placeholder="${boardVO.writer}" readonly="readonly">
						</div>
					</div>
					<!-- /.box-body -->

			
					<div class="box-footer" align="right">
						<button id="lBtn" type="submit" class="btn btn-warning">List</button>
						<button id="mBtn" type="submit" class="btn btn-primary">Modify</button>
						<button id="dBtn" type="submit" class="btn btn-danger">Delete</button>
					</div>
						
			<form	role="form1" method="get">
			<input type='hidden' name='page' value="${cri.page}">
			<input type='hidden' name='bno' value="${boardVO.bno}">
			<input type='hidden' name='type' value="${cri.type}">
			<input type='hidden' name='keyword' value="${cri.keyword}">
		</form>
		

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>

$(document).ready(function(){

	var formObj = $("form[role='form']");
	var formObj1 = $("form[role='form1']");
	
	$("#mBtn").on("click", function(e){
		if(confirm("정말 수정하시겠습니까?")==true){
		formObj.attr("action", "/board/update");
		formObj.attr("method", "get");
		formObj.submit();
		
		}else{return;};
	});//end mBtn
	
	
	$("#dBtn").on("click", function(e){
		
		if(confirm("정말 삭제하시겠습니까?")==true){
			formObj.attr("action", "/board/delete");
			formObj.submit();
			alert("삭제되었습니다.")
			
	}else{return;};
		
	}); //end dBtn
	
	$("#lBtn").on("click", function(e){
		
		if(confirm("목록으로 이동하겠습니까?")==true){
			formObj1.attr("action", "/board/listAll");
			formObj1.submit();
		
		}else{return;};
		
	}); // end lBtn
	
});

</script>

<%@include file="../include/footer.jsp"%>