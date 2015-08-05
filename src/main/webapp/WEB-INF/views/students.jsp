<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="GBK"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>学生信息</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--basic styles-->
<link href="<%=request.getContextPath()%>/assets/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/assets/bower_components/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/assets/bower_components/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bower_components/metisMenu/dist/metisMenu.min.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/bower_components/datatables/media/css/jquery.dataTables.css">
<style type="text/css">
.dataTables_filter,.dataTables_length {
	display: none;
}
</style>
</head>

<body>
<div id="wrapper">
<nav class="navbar navbar-default navbar-static-top" style="margin-bottom: 0">
	<div class="navbar-header">
			<a href="/aixuexiao/" class="navbar-brand">
				<i class="fa fa-briefcase"></i>
				&nbsp;爱学校 
			</a><!--/.brand-->
		
	</div><!--/.navbar-inner-->
	<div class="navbar-default sidebar">
	<div class="sidebar-nav navbar-collapse" id="sidebar">
	<ul class="nav" id="side-menu">
		<li class="active" >
			<a href="/aixuexiao/manager/students">
				<i class="icon-user"></i>
				<span class="menu-text"> 学生列表 </span>
			</a>
		</li>
		<li  >
			<a href="/aixuexiao/manager/classes">
				<i class="icon-list-alt"></i>
				<span class="menu-text"> 班级列表 </span>
			</a>
		</li>
		<li  >
			<a href="/aixuexiao/manager/exams">
				<i class="icon-file"></i>
				<span class="menu-text"> 考试列表 </span>
			</a>
		</li>
		<li >
			<a href="#">
				微信消息
				<b class="fa arrow"></b>
			</a>
			<ul class="nav nav-second-level collapse">
				<li>
					<a href="/aixuexiao/manager/messages">
						<i class="icon-double-angle-right"></i>
						接收消息
					</a>
				</li>
				<li  >
					<a href="/aixuexiao/manager/replys">
						<i class="icon-double-angle-right"></i>
						回复消息
					</a>
				</li>
			</ul>
		</li>
		 
	</ul><!--/.nav-list-->
	<div class="sidebar-collapse" id="sidebar-collapse">
		<i class="icon-double-angle-left"></i>
	</div>
</div>
	</div>
</nav>
	
	<div id="page-wrapper" style="">
		<div class="">
			<div class="modal fade" id="studentModal" tabindex="-1" role="dialog" aria-labelledby="studentModalLabel" style="display: none;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="studentModalLabel">Modal title</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<lable for="id_input" class="col-sm-2 control-label">学生编号</lable>
								<div class="col-sm-10">
									<input type="text" name="" id="id_input">
								</div>
							</div>
							<div class="form-group">
								<lable for="name_input" class="col-sm-2 control-label">学生姓名</lable>
								<div class="col-sm-10">
									<input type="text" name="" id="name_input">
								</div>
							</div>
							<div class="form-group">
								<lable for="classid_select" class="col-sm-2 control-label">所属班级</lable>
								<div class="col-sm-10">
									<select id="classid_select">
										<option value="0">选择班级</option>
										
										<option value="301">三年级一班</option>
										
										<option value="302">三年级二班</option>
										
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<lable for="remark_input" class="col-sm-2 control-label">备注</lable>
								<div class="col-sm-10">
									<input type="text" name="" id="remark_input">
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="btn_save">保存</button>
					</div>
				</div>
			</div>
		</div>
			<div class="page-content">
				<div class="row">
					<div class="col-lg-12">
						<h1>
							<i class="fa fa-users"></i> 学生信息
						</h1>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<form class="form-inline" method="get" action="/aixuexiao/manager/students" style="margin-bottom:10px">
							<input type="hidden" name="pagenum" value="">
							&nbsp;&nbsp;姓名：<input type="text" id="name"
								value="" class="search-query form-control">&nbsp;&nbsp;&nbsp;&nbsp;
							<select id="classid" class="form-control">
								<option value="0">选择班级</option>
								
									<option
										
										value="301">三年级一班</option>
								
									<option
										
										value="302">三年级二班</option>
								
							</select>&nbsp;&nbsp;
							<button id="btn_search" type="button" class="btn btn-purple btn-small">
								查找 <i class="fa fa-search"></i>
							</button>
							<button id="btn_undo" type="button" class="btn btn-primary btn-small">
								重置 <i class="fa fa-undo"></i>
							</button>
							<button id="btn_refresh" type="button" class="btn btn-primary btn-small">
								刷新 <i class="fa fa-refresh"></i>
							</button>
							<button id="btn_plus" type="button" class="btn btn-primary btn-small" data-toggle="modal" data-target="#studentModal" data-title="添加学生" data-type="add" data-url="/aixuexiao/manager/students/add">
								添加 <i class="fa fa-plus"></i>
							</button>
							<button id="btn_edit" type="button" class="btn btn-primary btn-small" data-toggle="modal" data-target="#studentModal" data-title="更新学生" data-type="update" data-url="/aixuexiao/manager/students/update">
								更新<i class="fa fa-edit"></i>
							</button>
							<button id="btn_delete" type="button" class="btn btn-primary btn-small" data-type="delete" data-url="/aixuexiao/manager/students/delete">
								删除<i class="fa fa-trash"></i>
							</button>
						</form>
					</div>
					<!--/.span-->
				</div>
				<!--/.row-fluid-->
				<div class="form-inline no-footer">
					<table id="table_id" class="table table-bordered dataTable hover">
						<thead>
							<tr>
								<th>学生编号</th>
								<th>学生姓名</th>
								<th>所属班级</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<!--/.page-content-->
		</div>
		<!--/.main-content-->
	
	</div>
	<!--/.main-container-->
</div>	
	<!--basic scripts-->
<!--[if !IE]>-->
<script type="text/javascript">
	window.jQuery || document.write("<script src='/aixuexiao/assets/bower_components/jquery/dist/jquery.min.js'>"+"<"+"/script>");
</script>
<!--<![endif]-->
<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='/aixuexiao/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script src="/aixuexiao/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!--page specific plugin scripts-->
<!--ace scripts-->

<script type="text/javascript" charset="utf8" src="<%=request.getContextPath()%>/assets/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="<%=request.getContextPath()%>/assets/bower_components/metisMenu/dist/metisMenu.min.js"></script>
<script type="text/javascript" charset="utf8" src="<%=request.getContextPath()%>/assets/bower_components/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js"></script>
<!--inline scripts related to this page-->
	<script>
		$(document).ready(function(){
			var table = $('#table_id').DataTable(
					{
						ajax: {
							url:"/aixuexiao/manager/students/json",
						},
						lengthMenu:[[8,-1],[8,"ALL"]],
						columns: 
						[
							{ data: 'id' },
							{ data: 'name' },
							{ data: 'classid'},
							{ data: 'remark' },
							{ data: 'id'}
						],
						columnDefs:[
							{
								targets: 4,
								render: function(data,type,row,meta){
									var tmp = document.createElement("div");
									var btn=$('<button/>').addClass("btn btn-primary btn-mini");	
									var i=$('<i/>').addClass("icon-comment");
									$(btn).css("margin-right","2px");
									$(btn).append(i);
									$(btn).attr({
										onclick:"location.href='/aixuexiao/manager/leavemessage?studentid="+data + "'"
									});
									$(btn).append("微留言");
									
									var btn1=$('<button/>').addClass("btn btn-primary btn-mini");	
									var i1=$('<i/>').addClass("icon-file");
									$(btn1).css("margin-right","2px");
									$(btn1).append(i1);
									$(btn1).attr({
										onclick:"location.href='/aixuexiao/manager/examdetail?studentid="+ data + "'"
														});
										$(btn1).append("考试情况");

										$(tmp).append(btn);
										$(tmp).append(btn1);
										return $(tmp).html();
									}
								} ]
							});
			$('#table_id tbody').on('click','tr',function(){
				if($(this).hasClass('selected')){
					$(this).removeClass('selected');
				}else{
					table.$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			});
			$('#btn_undo').click(function() {
				table.columns().flatten().each(function(i) {
					table.column(i).search('')
				});
				table.draw();
			});
			$('#btn_refresh').click(function() {
				table.ajax.reload();
			});
			$('#btn_search').click(function() {
				table.column(1).search($('#name').val());
				if ($('#classid').val() == 0)
					table.column(2).search('');
				else
					table.column(2).search($('#classid').val());
				table.draw();
			});
			$('#studentModal').on('show.bs.modal', function (event) {
				 // Button that triggered the modal  
				var button = $(event.relatedTarget);
				  var url = button.data('url');
				  var type = button.data('type');
				  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
				  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
				var title = button.data('title');
				$('#studentModalLabel').text(title);
				if(type=='update'){
					if(!table.$('tr.selected').hasClass('selected'))return;
					var model = table.row('.selected').data();
					$('#id_input').val(model.id);
					$('#name_input').val(model.name);
					$('#classid_select').val(model.classid);
					$('#remark_input').val(model.remark);
				}
				
				  $('#studentModal').attr({
					  "data-url":url
				  });
				});
			$('#btn_save').click(function(){
				var student = {
					id:$('#id_input').val(),
					name:$('#name_input').val(),
					classid:$('#classid_select').val(),
					remark:$('#remark_input').val()
				};
				$.ajax({
					type:"POST",
					url:$('#studentModal').data('url'),
					contentType:"application/json;charset=utf-8",
					data:JSON.stringify(student),
					success:function(message){
						$('#studentModal').modal('hide');
						table.ajax.reload();
					},
					error:function(message){
						$('#studentModal').modal('hide');
						alert(message);
					}
				});
			});
			$('#btn_delete').click(function(){
				if(!table.$('tr.selected').hasClass('selected'))return;
				var model = table.row('.selected').data();
				$.ajax({
					type:"POST",
					url:$('#btn_delete').data('url'),
					data:"id="+model.id,
					success:function(message){
						table.ajax.reload();
					},
					error:function(message){
						alert(message);
					}
				});
			});
		});
	</script>

</body>
</html>