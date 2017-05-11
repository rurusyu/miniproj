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
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post" id="form1">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> <input type="text" name='title' class="form-control" placeholder="Enter Title">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="content" rows="3" placeholder="Enter ..."></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> <input type="text"
								name="writer" class="form-control" placeholder="Enter Writer">
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer" align="right">
						<button id="rBtn" type="submit" class="btn btn-primary">Submit</button>
					</div>
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
$(document).ready(function() {
	
	var $title = $("input[name=title]");
	var $content = $("textarea[name=content]");
	var $writer = $("input[name=writer]");
	
	//공백등록 방지
	$("#form1").submit(function(){
        
        if($title.val()!='' && $title.val()!=null
           && $content.val()!='' && $content.val()!=null
           && $writer.val()!='' && $writer.val()!=null){
            
          history.pushState(null, null, "/board/regist"); //뒤로가기 방지
            
          return true;
        }
    });

    $("#rBtn").on("click",function(e){
        
        if($title.val()=='' || $title.val()==null){
            alert("제목을 입력해 주세요.");
            return false;
        }else if($content.val()=='' || $content.val()==null){
            alert("내용을 입력해 주세요.");
            return false;
        }else if($writer.val()=='' || $writer.val()==null){
            alert("이름을 입력해 주세요.");
            return false;
        }
        
    });
})


</script>

<%@include file="../include/footer.jsp"%>