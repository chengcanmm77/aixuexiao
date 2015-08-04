<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="GBK"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="/aixuexiao/assets/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="/aixuexiao/assets/bower_components/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet" />
<link href="/aixuexiao/assets/css/bootstrap-responsive.min.css" rel="stylesheet" />

</head>
<body>

	<div class="container" style="width: 600px">
		<div class="error">${error}</div>
		<form class="form-horizontal" method="post" action="">
			<h2 style="text-align: center">登录</h2>
			<div class="form-group">
				<label for="username" class="col-sm-2 control-label">用户名:</label>
				<div class="col-sm-10">
					<input type="text" id="username" name="username"
						class="form-control" placeholder="请填写用户名" required autofocus>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">密码:</label>
				<div class="col-sm-10">
					<input type="password" id="password" name="password"
						class="form-control" placeholder="请输入密码" required>
				</div>
			</div>

			<div class="checkbox col-sm-offset-2"
				style="padding-left: 10px; padding-bottom: 10px;">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<input type="submit" id="login_btn" class="btn btn-lg btn-primary btn-block">Log in</input>
		</form>

	</div>
	<!-- /container -->
	<script type="text/javascript">
	window.jQuery || document.write("<script src='/aixuexiao/assets/bower_components/jquery/dist/jquery.min.js'>"+"<"+"/script>");
</script>
	<!--<![endif]-->
	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='/aixuexiao/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
	<script type="text/javascript">
	if("ontouchend" in document) document.write("<script src='/aixuexiao/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
	<script
		src="/aixuexiao/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<%-- <script type="text/javascript">
		$(document).ready(
			function(){
				$('#login_btn').click(
					function(){
						var username=$('#username').val();
						var password=$('#password').val();
						if(username==""){
							$('#username').addClass("has-error");
							return false;
						}
						if(password==""){
							$('#password').addClass("has-error");
							return false;
						}
						$.ajax({
							type:'POST',
							url:'<%=request.getContextPath()%>/login',
							data:{
								username:username,
								password:password,
							},
							error:function(response){
								alert("请求发送失败");
							},
							success:function(response){
								window.location.href='/aixuexiao/manager/students';
							}
						});
						
					}
				);
			}
		);
	</script> --%>
</body>
</html>