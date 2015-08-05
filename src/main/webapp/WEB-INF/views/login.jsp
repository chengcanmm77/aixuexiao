<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="GBK"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="<%=request.getContextPath()%>/assets/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/assets/bower_components/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/assets/bower_components/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css" rel="stylesheet" />

</head>
<body>

 <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="POST" action="">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="用户名" id="username" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="密码" id="password" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="rememberMe" id="rememberMe"  type="checkbox" value="1">记住我
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="登录"/>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<script type="text/javascript">
	window.jQuery || document.write("<script src='<%=request.getContextPath()%>/assets/bower_components/jquery/dist/jquery.min.js'>"+"<"+"/script>");
	</script>
	<script src="<%=request.getContextPath()%>/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/bower_components/metisMenu/dist/metisMenu.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/bower_components/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js"></script>
</body>
</html>