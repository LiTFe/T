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
						<form method="post"  autocomplete="off" action="bigTypeAdd">
							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">书类添加:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="书类添加" name="name" >
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
</body>
</html>