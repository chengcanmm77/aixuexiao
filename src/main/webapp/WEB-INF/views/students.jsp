<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="GBK"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>学生信息</title>
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<%@include file="/WEB-INF/views/common/css.jsp" %>
		<style type="text/css">
			.dataTables_filter,.dataTables_length {
				display: none; 
			}
		</style>
	</head>

	<body>
		<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
		<div class="main-container container-fluid">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>
			<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			<div class="main-content">
				 
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							<small>
								<i class="icon-user"></i>
								学生信息
							</small>
						</h1>
					</div> 
					<div class="row-fluid">
						<div class="span12">
						<form class="form-inline" method="get" action="<%=request.getContextPath() %>/manager/students">
								<input type="hidden" name="pagenum" value="${pagenum}">
								&nbsp;&nbsp;姓名：<input type="text" id="name" value="${student.name}"  class="input-medium search-query">&nbsp;&nbsp;&nbsp;&nbsp;
								<select id="classid">
									<option value="0">选择班级</option>
									<c:forEach items="${clsList}"  var="cls"  >
										<option <c:if test="${student.classid == cls.id}">selected="selected"</c:if> value="${cls.id}">${cls.name}</option>
									</c:forEach>
								</select>&nbsp;&nbsp;
								<button id="btn_search" type="button" class="btn btn-purple btn-small">
									查找
									<i class="icon-search icon-on-right bigger-110"></i>
								</button>
								<button id="btn_refresh" type="button" class="btn btn-primary btn-small">
									重置
									<i class="icon-refresh icon-on-right bigger-110"></i>
								</button>
							</form>
						
							<!--PAGE CONTENT BEGINS-->
							<%-- <form class="form-inline" method="get" action="<%=request.getContextPath() %>/manager/students">
								<input type="hidden" name="pagenum" value="${pagenum}">
								&nbsp;&nbsp;姓名：<input type="text" name="name" value="${student.name}"  class="input-medium search-query">&nbsp;&nbsp;&nbsp;&nbsp;
								<select name="classid">
									<option value="0">选择班级</option>
									<c:forEach items="${clsList}"  var="cls"  >
										<option <c:if test="${student.classid == cls.id}">selected="selected"</c:if> value="${cls.id}">${cls.name}</option>
									</c:forEach>
								</select>&nbsp;&nbsp;
								<button  type="submit" class="btn btn-purple btn-small">
									查找
									<i class="icon-search icon-on-right bigger-110"></i>
								</button>
							</form> --%>
<%-- 							<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th width="15%">学生编号</th>
										<th width="15%">学生姓名</th>
										<th width="15%">所属班级</th>
										<th>备注</th>
										<th width="20%" >操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${studentList}"  var="student"  >
									<tr>
										<td><a href="#">${student.id}</a></td>
										<td>${student.name}</td>
										<td>${student.classid}</td>
										<td>${student.remark}</td>
										<td >
											<button class="btn btn-mini btn-primary" onclick="location.href='<%=request.getContextPath() %>/manager/leavemessage?studentid=${student.id}'" ><i class="icon-comment"></i>微信留言</button>
											<button class="btn btn-mini btn-primary" onclick="location.href='<%=request.getContextPath() %>/manager/examdetail?studentid=${student.id}'"><i class="icon-file"></i>考试情况</button>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table> --%>
							
<%-- 					 		<div class="dataTables_paginate paging_bootstrap pagination">
							  <button class="btn btn-success btn-mini" onclick="location.href='<%=request.getContextPath() %>/manager/students?pagenum=${pagenum-1}'" <c:if test="${pagenum <= 1}">disabled="disabled"</c:if>    >&laquo;</button>
							  <button class="btn btn-success btn-mini" disabled="disabled">第 ${pagenum} 页</button>
							  <button class="btn btn-success btn-mini" onclick="location.href='<%=request.getContextPath() %>/manager/students?pagenum=${pagenum+1}'" <c:if test="${length < 8}">disabled="disabled"</c:if> >&raquo;</button>
					 		</div> --%>
						
						<!--PAGE CONTENT ENDS-->
					</div><!--/.span-->
				</div><!--/.row-fluid-->
				<div class="form-inline no-footer">
							<table 
								id="table_id"
								class="table table-bordered dataTable hover">
								<thead class="thead sorting">
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
			</div><!--/.page-content-->
		</div><!--/.main-content-->
	</div><!--/.main-container-->

		<%@include file="/WEB-INF/views/common/js.jsp" %>
		<script>
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
						{data:'id'}
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
									onclick:"location.href='<%=request.getContextPath() %>/manager/leavemessage?studentid="+data + "'"
								});
								$(btn).append("微留言");
								
								var btn1=$('<button/>').addClass("btn btn-primary btn-mini");	
								var i1=$('<i/>').addClass("icon-file");
								$(btn1).css("margin-right","2px");
								$(btn1).append(i1);
								$(btn1).attr({
									onclick:"location.href='<%=request.getContextPath() %>/manager/examdetail?studentid="+data + "'"
								});
								$(btn1).append("考试情况");
								
								$(tmp).append(btn);
								$(tmp).append(btn1);
								return $(tmp).html();
							}
						}
					]
				}
			);
		$('#btn_refresh').click(function(){
			table.columns().flatten().each(function(i){table.column(i).search('')});
			table.draw();
		});
		$('#btn_search').click(function(){
			table.column(1).search($('#name').val());
			if($('#classid').val()==0)
				table.column(2).search('');
			else
				table.column(2).search($('#classid').val());
			table.draw();
		});
		</script>
		
	</body>
</html>