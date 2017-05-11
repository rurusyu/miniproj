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
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- /.box-header -->

	<form role="form" method="post">

					<div class="box-body">
					
					<div class="form-group">
							<label for="exampleInputEmail1">Bno</label> <input type="text" name='bno' class="form-control" placeholder="${boardVO.bno}" readonly="readonly">
						</div>
					
						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> <input type="text" name='title' class="form-control" value="${boardVO.title}">
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="content" rows="3">${boardVO.content}</textarea>
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> <input type="text"
								name="writer" class="form-control" value="${boardVO.writer}">
						</div>
					</div>
					<!-- /.box-body -->

				</form>
			
					<div class="box-footer" align="right">
						<button id="sBtn" type="submit" class="btn btn-primary">Save</button>
						<button id="cBtn1" type="submit" class="btn btn-danger">Cancle</button>
					</div>		
					

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
	
	
	$("#sBtn").on("click", function(e) {	
		formObj.submit();
		history.pushState(null, null, "/board/update"); 		
		
	});//end sBtn
	
	$("#cBtn1").on("click",function(e){
		
		confirm("취소되었습니다.");
		self.location = "/board/listAll?page=${cri.page}&keyword=${cri.keyword}";

	});//end cBtn1
	
});

</script>

<%@include file="../include/footer.jsp"%>