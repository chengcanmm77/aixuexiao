<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="generator"
          content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
    <meta charset="UTF-8" />
    <title>Document</title>
    <%@include file="lky_common/css.jspf"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" />
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default" style="margin-top:25%">
                <div class="panel-heading">
                    <ul class="nav nav-pills">
                        <li role="presentation" class="active">
                            <a href="#login" data-toggle="pill">用户登录</a>
                        </li>
                        <li role="presentation">
                            <a href="#register" data-toggle="pill">注册</a>
                        </li>
                    </ul>
                </div>
                <div class="panel-body tab-content">
                    <div class="tab-pane fade in active" id="login">
                        <form role="form" method="post" action="<%=request.getContextPath()%>/login">
                            <fieldset>
                                <div class="form-group">
                                    <label class="sr-only" for="username">username</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><span class="glyphicon glyphicon-user"/></div>
                                        <input class="form-control" placeholder="用户名" id="username" name="username" type="text" autofocus="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="password">password</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><span class="glyphicon glyphicon-lock"/></div>
                                        <input class="form-control" placeholder="密码" id="password" name="password" type="password" value="" />
                                    </div>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="rememberMe" id="rememberMe" type="checkbox" value="1" />记住我</label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="登录" />
                            </fieldset>
                        </form>
                    </div>
                    <div class="tab-pane fade in" id="register">
                        <form role="form" method="post" action="<%=request.getContextPath()%>/register">
                            <fieldset>
                                <div class="form-group">
                                    <label class="sr-only" for="register_username">username</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><span class="glyphicon glyphicon-user"/></div>
                                        <input class="form-control" placeholder="用户名" id="register_username" name="username" type="text" autofocus="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="register_password">password</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><span class="glyphicon glyphicon-lock"/></div>
                                        <input class="form-control" placeholder="密码" id="register_password" name="password" type="password" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="register_password_again">password_again</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><span class="glyphicon glyphicon-lock"/></div>
                                        <input class="form-control" placeholder="再次确认密码" id="register_password_again" name="password_again"
                                               type="password" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="register_birthday">confirm-password</label>
                                    <div class="input-group date">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                        <input type="text" class="form-control" placeholder="生日" name="birthday" id="register_birthday"/>
                                    </div>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-primary btn-block" value="注册" />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="lky_common/js.jspf"%>
    <script type="text/javascript" charset="utf8" src="<%=request.getContextPath()%>/assets/bower_components/jquery-validate/dist/jquery.validate.min.js"></script>
    <script type="text/javascript" charset="utf8" src="<%=request.getContextPath()%>/assets/bower_components/jquery-validate/dist/additional-methods.min.js"></script>
    <script type="text/javascript" charset="utf8" src="<%=request.getContextPath()%>/assets/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script>
        $('.form-group .input-group.date').datepicker({
            format:"yyyy-mm-dd",
            language: "zh-CN",
            keyboardNavigation: false,
            forceParse: false,
            todayHighlight: true
        });
        validate_config={
            errorPlacement:function(error,element){
                error.appendTo(element.parent().parent())
            },
            rules:{
                username:{required:true},
                password:{required:true},
            }
        }
        $('#login form').validate(validate_config);
        $('#register form').validate(validate_config);

    </script></div>
</body>
</html>
