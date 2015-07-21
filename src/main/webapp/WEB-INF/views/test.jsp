<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>mytable</title>
	<!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/jquery.dataTables.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css">
</head>
<body>
<div class="dataTables_wrapper form-inline dt-bootstrap no-footer">
	<table data-order='[[ 1, "asc" ]]' data-page-length='25' id="table_id" class="table table-striped table-bordered dataTable">
    <thead class="thead sorting">
        <tr>
            <th>学生编号</th>
            <th>学生姓名</th>
            <th>所属班级</th>
            <th>备注</th>
        </tr>
    </thead>
</table>
</div>

	<!-- jQuery -->
	<script type="text/javascript" charset="utf8" src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
	
	<!-- DataTables -->
	<script type="text/javascript" charset="utf8" src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf8" src="<%=request.getContextPath()%>/assets/js/jquery.dataTables.min.js"></script>
	<script>
 
	$(document).ready( 
		function () {
			$('#table_id').DataTable(
				{
					ajax: {
						url:"/aixuexiao/manager/students/json",
					},
					columns: 
					[
						{ data: 'id' },
						{ data: 'classid' },
						{ data: 'name' },
						{ data: 'remark' }
					]
				}
			);
		} 
	);
	</script>
</body>
</html>