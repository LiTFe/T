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
</head>
<body>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card border-primary mb-3">
					<div class="card-header">
						<form method="post"  autocomplete="off" action="smallTypeAdd">
						<div class="form-group row">
								<label for="inputid" class="col-sm-2 col-form-label text-right">书类选择</label>
								<div class="col-sm-10">
									<select name="bid"class="form-control"id="inputid">
									
									</select>
								</div>
							</div>
						<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">小书分类添加:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="小书分类添加" name="sid" >
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
	<script type="text/javascript"
		src="bower_components/jquery/dist/jquery.slim.js"></script>
	<script type="text/javascript"
		src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
		<script type="text/javascript">
		var xhr=new XMLHttpRequest();
		xhr.open("GET","findAllBigType");
		xhr.send();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
				//	console.dir(xhr.responseText);
					eval(xhr.responseText);
					}
				}
			}
		function fillsel(types){
			for(var i=0;i<types.length;i++){
				var op= new Option(types[i].name,types[i].id);
				document.getElementById("inputid").appendChild(op);
				}
			}
		
		</script>
</body>
</html>