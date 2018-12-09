<%@ page import="com.ddbookmvn.model.Book"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>书分类籍</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" id="zhuti" />
<link href="bower_components/fontawesome/web-fonts-with-css/css/fontawesome-all.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript"
	src="bower_components/jquery/dist/jquery.js"></script>
<script type="text/javascript"
	src="bower_components/jquery.cookie/jquery.cookie.js"></script>
<script type="text/javascript">
	if ($.cookie("bootstrapTheme")) {
		$("#zhuti").attr(
				"href",
				"bower_components/bootswatch/dist/" + $(evt.target).val()
						+ "/bootstrap.css");
		$("#xuan").val($.cookie("bootstrapTheme"));
	} else {
		$("#zhuti").attr("href",
				"bower_components/bootswatch/dist/cerulean/bootstrap.css");
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="navbar-toggler-icon"></span>
					</button>
					<a class="navbar-brand" href="#">Brand</a>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav">
							<li class="nav-item active"><a class="nav-link" href="#">Link
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="http://example.com"
								id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
									link</a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a> <a
										class="dropdown-item" href="#">Something else here</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Separated link</a>
								</div></li>
						</ul>
						<form class="form-inline">
							<input class="form-control mr-sm-2" type="text" />
							<button class="btn btn-primary my-2 my-sm-0" type="submit">
								Search</button>
						</form>
						<ul class="navbar-nav ml-md-auto">
							<li class="nav-item active"><a class="nav-link"
								href="javascript:void[0]"> <select id="xuan"
									class="custom-select">
										<option>cerulean</option>
										<option>cosmo</option>
										<option>cyborg</option>
										<option>darkly</option>
										<option>litera</option>
										<option>lux</option>
								</select>
							</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="http://example.com"
								id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
									link</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a> <a
										class="dropdown-item" href="#">Something else here</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Separated link</a>
								</div></li>
						</ul>
					</div>
				</nav>
				<div class="row">
			<div class="col-md-12">
				<div class="card border-success">
				<div class="card-header">
				<form class="form-inline" action="bookbg" method="post" id="searchFrm">
				<label class="sr-only" for="inputName">书名</label>
				<input type="text" class="form-contorl mb-2 mr-sm-2" id="inputName" placeholder="书名 "name="name">
				<label class="sr-only" for="inlineFomInputGroupUsername2">大类</label>
				<div class="input-group mb-2 mr-sm-2">
				<select class="form-control" id="inputdid"name="bid">
				<option value="-1">---------请选择--------</option>
				</select>
				</div>
				<label class="sr-only" for="inlineFomInputGroupUsername2">小类</label>
				<div class="input-group mb-2 mr-sm-2">
				<select class="form-control" id="inputsmalld"name="sid">
				<option value="-1">---------请选择--------</option>
				</select>
				</div>
				<button type="submit" class="btn btn-primary mb-2">搜索</button>
				</form>	
				</div>
				<div class="card-body" style="padding: 0px;">
				<div class="col-md-12" style="padding: 0px;">
					<table class="table table-bordered table-sm table-hover" style="margin-bottom:0px;">
						<thead>
							<tr>
								<th>编号</th>
								<th>书名字</th>
								<th>作者</th>
								<th>价格</th>
								<th>出版日期</th>
								<th>简介</th>
								<th>照片</th>
								<th>类</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<Book> ls = (List<Book>) request.getAttribute("ls");
								for (Book book : ls) {
							%>
							<tr>
								<td><%=book.getId()%></td>
								<td><%=book.getName()%></td>
								<td><%=book.getAbout()%></td>
								<td><%=book.getPrice()%></td>
								<td><%=book.getC_date()%></td>
								<td><%=book.getBrief()%></td>
								<td><img src="upload/<%=book.getPhoto()%>"></td>
								<td><%=book.getSid()%></td>
								<td>
								<a href="#modal-container-303788" data-toggle="modal" onclick="window.delId='<%=book.getId()%>'" class="fa fa-2x fa-trash" title="删除"></a>
								&nbsp;&nbsp;
								<a class="fa fa-2x fa-edit" title="修改" href="toBookEdit?id=<%=book.getId()%>"></a>
								</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
			</div>
			</div>
			<div class="card-footer" style="padding: 0px;">
					<ul class="pagination">
						<%
							int totalPage = (Integer) request.getAttribute("totalPage");
							int currentPage = (Integer) request.getAttribute("currentPage");
							if (currentPage == 1) {
						%>
						<li class="page-item disabled"><a class="page-link" href="#">上一页</a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=<%=currentPage - 1%>">上一页</a></li>
						<%
							}
						%>
						<%
							if (totalPage <= 5) {
								for (int i = 1; i < totalPage; i++) {
						%>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=<%=i%>"><%=i%></a></li>
						<%
							}
							} else if (currentPage <= 3) {
						%>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=1">1</a></li>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=2">2</a></li>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=3">3</a></li>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=4">4</a></li>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=<%=totalPage%>">...<%=totalPage%></a></li>
						<%
							} else if (currentPage <= totalPage) {
						%>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=1">1...</a></li>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=<%=currentPage - 1%>"><%=currentPage - 1%></a></li>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=<%=currentPage%>"><%=currentPage%></a></li>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=<%=currentPage + 1%>"><%=currentPage + 1%></a></li>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=<%=totalPage%>"><%=totalPage%></a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=1">1...</a></li>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=<%=totalPage - 3%>"><%=totalPage - 3%></a></li>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=<%=totalPage - 2%>"><%=totalPage - 2%></a></li>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=<%=totalPage - 1%>"><%=totalPage - 1%></a></li>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=<%=totalPage%>"><%=totalPage%></a></li>
						<%
							}
						%>
						<%
							if (currentPage == totalPage) {
						%>
						<li class="page-item disabled"><a class="page-link" href="#">下一页</a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							href="bookbg?currentPage=<%=currentPage + 1%>">下一页</a></li>
						<%
							}
						%>
					</ul>
			</div>
			</nav>
		</div>
	</div>
	</div>
	</div>
	<div>
	</div>
	<!--删除确认框-->
	<div class="modal fade" id="modal-container-303788" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								删除确认
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">X</span>
							</button>
						</div>
						<div class="modal-body">
							你真的要删除这条内容吗？
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" onclick="exeDel(event)">
								确认
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								取消
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
	<script type="text/javascript"
		src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#xuan").change(
					function(evt) {
						$("#zhuti").attr(
								"href",
								"bower_components/bootswatch/dist/"
										+ $(evt.target).val()
										+ "/bootstrap.css");
						$.cookie("boostrapTheme", $(evt.target).val(), {
							expires : 30
						});
					});
			//指示当前页
			$('a[href="bookbg?currentPage=<%=currentPage%>"]').parent("li")
					.addClass("active");
		});
		function fillSel(types){
			for(var i=0;i<types.length;i++){
				var op= new Option(types[i].name,types[i].id);
				document.getElementById("inputdid").appendChild(op);
				}
			$("#inputdid").val('<%=request.getAttribute("bid")%>');
			$("#inputdid").trigger("change");
			}
		function fillSmallSel(types){
			document.getElementById("inputsmalld").innerHTML='<option value="-1">---请选择----</option>';
			for(var i=0;i<types.length;i++){
				var op= new Option(types[i].name,types[i].id);
				document.getElementById("inputsmalld").appendChild(op);
				}
			$("#inputsmalld").val('<%=request.getAttribute("sid")%>');
			}
			$.ajax({
				url:"findAllBigType",
				dataType:"jsonp",
				jsonpCallback:"fillSel"
				});
			$("#inputdid").change(function(){
				$.ajax({
					url:"findAllSmallType",
					dataType:"jsonp",
					data:"bid="+$(this).val(),
					jsonpCallback:"fillSmallSel"
					});
				});
			//因为分页链接缺少表单值
			$('a[class="page-link"][href^="bookbg?currentPage="]').click(function(){
				$(this).attr("href",$(this).attr("href")+"&"+$("#searchFrm").serialize());
				});
			//删除确认
			function exeDel(event){
				window.location.href="bookDel?id="+window.delId;
			}
	</script>
</body>
</html>