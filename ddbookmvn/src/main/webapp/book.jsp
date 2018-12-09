<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>类添加</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="bower_components/bootswatch/dist/cerulean/bootstrap.css"
	rel="stylesheet" type="text/css" />
	<link href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.custom-file-label::after {
	content: "浏览"
}
</style>
</head>
<body>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card border-primary mb-3">
					<div class="card-header">
						<form method="post"  autocomplete="off" action="book"enctype="multipart/form-data">
						<div class="form-group row">
								<label for="inputid" class="col-sm-2 col-form-label text-right">书类选择</label>
								<div class="col-sm-10">
									<select name="bid"class="form-control"id="inputid">
									<option>-------请选择类--------</option>
									</select>
								</div>
							</div>
						<div class="form-group row">
								<label for="inputsmall" class="col-sm-2 col-form-label text-right">小书分类添加:</label>
								<div class="col-sm-10">
									<select name="sid" class="form-control"id="inputsmall">
									
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">书名:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="书名" name="name">
								</div>
							</div>

							<div class="form-group row">
								<label for="inputabout" class="col-sm-2 col-form-label text-right">作者:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputabout" placeholder="作者" name="about">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputprice" class="col-sm-2 col-form-label text-right">价格:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputprice" placeholder="价格" name="price">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputdate" class="col-sm-2 col-form-label text-right">出版日期:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputdate" placeholder="出版日期" name="c_date">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputbrief" class="col-sm-2 col-form-label text-right">简介:</label>
								<div class="col-sm-10">
									<textarea class="form-control" id="inputbrief" placeholder="简介" name="brief"></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPhoto" class="col-sm-2 clo-form-label text-right">图片</label>
								<div class="col-sm-10">
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="inputPhoto" aria-describedby="inputGroupFileAddon04" name="photo"> <label class="custom-file-label" for="inputGroupFile04 ">请选择文件</label>
									</div>
								</div>
							</div>
						<div class="form-group row">
							<div class="col-sm-2"></div>
							<div class="col-sm-10">
								<button type="submit" class="btn btn-primary text-right">添加</button>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"src="bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript"
		src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
		<script type="text/javascript">
		/*var xhr=new XMLHttpRequest();
		xhr.open("GET","findAllBigType");
		xhr.send();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					console.dir(xhr.responseText);
					eval(xhr.responseText);
					}
				}
			}*/
		function fillSel(types){
			for(var i=0;i<types.length;i++){
				var op= new Option(types[i].name,types[i].id);
				document.getElementById("inputid").appendChild(op);
				}
			}
			function fillSmallSel(types){
				document.getElementById("inputsmall").innerHTML="";
				for(var i=0;i<types.length;i++){
					var op= new Option(types[i].name,types[i].id);
					document.getElementById("inputsmall").appendChild(op);
					}
				}
			$.ajax({
				url:"findAllBigType",
				dataType:"jsonp",
				jsonpCallback:"fillSel"	
				});
			$("#inputid").change(function(){
			$.ajax({
				url:"findAllSmallType",
				dataType:"jsonp",
				data:"bid="+$(this).val(),
				jsonpCallback:"fillSmallSel"
				});
		});
		</script>
			<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
		<script type="text/javascript">
		$('#inputdate').datepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd',
			autoclose : true,
		});
		</script>
</body>
</html>