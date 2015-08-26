<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>学生信息</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!--basic styles-->
    <%@include file="/WEB-INF/views/lky_common/css.jspf" %>
    <style type="text/css">
        .dataTables_filter, .dataTables_length {
            display: none;
        }
    </style>
</head>

<body>
<%@include file="/WEB-INF/views/modal/studentModal.jspf" %>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-static-top" style="margin-bottom: 0">
        <div class="navbar-header">
            <a href="/aixuexiao/" class="navbar-brand">
                <i class="fa fa-briefcase"></i>
                &nbsp;爱学校
            </a><!--/.brand-->

        </div>
        <!--/.navbar-inner-->
        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-gear fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw">用户信息</i></a></li>
                    <li class="divider"></li>
                    <li><a href="<%=request.getContextPath()%>/logout"><i class="fa fa-sign-out fa-fw">退出登录</i></a></li>
                </ul>
            </li>
        </ul>
        <div class="navbar-default sidebar">
            <div class="sidebar-nav navbar-collapse" id="sidebar">
                <ul class="nav" id="side-menu">
                    <li class="active">
                        <a href="/aixuexiao/manager/students">
                            <i class="icon-user"></i>
                            <span class="menu-text"> 学生列表 </span>
                        </a>
                    </li>
                    <li>
                        <a href="/aixuexiao/manager/classes">
                            <i class="icon-list-alt"></i>
                            <span class="menu-text"> 班级列表 </span>
                        </a>
                    </li>
                    <li>
                        <a href="/aixuexiao/manager/exams">
                            <i class="icon-file"></i>
                            <span class="menu-text"> 考试列表 </span>
                        </a>
                    </li>
                    <li>
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
                            <li>
                                <a href="/aixuexiao/manager/replys">
                                    <i class="icon-double-angle-right"></i>
                                    回复消息
                                </a>
                            </li>
                        </ul>
                    </li>

                </ul>
                <!--/.nav-list-->
                <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="icon-double-angle-left"></i>
                </div>
            </div>
        </div>
    </nav>

    <div id="page-wrapper" style="">
        <div class="">
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
                        <form class="form-inline" method="get" action="/aixuexiao/manager/students"
                              style="margin-bottom:10px">
                            <input type="hidden" name="pagenum" value="">
                            &nbsp;&nbsp;姓名：<input type="text" id="name"
                                                  value="" class="search-query form-control">&nbsp;&nbsp;&nbsp;&nbsp;
                            <select id="classid" class="form-control">
                                <option value="0">选择班级</option>

                                <option

                                        value="301">三年级一班
                                </option>

                                <option

                                        value="302">三年级二班
                                </option>

                            </select>&nbsp;&nbsp;
                            <button id="btn_search" type="button" class="btn btn-purple btn-small">
                                查找 <i class="fa fa-search"></i>
                            </button>
                            <button id="btn_undo" type="button" class="btn btn-info btn-small">
                                重置 <i class="fa fa-undo"></i>
                            </button>
                            <button id="btn_refresh" type="button" class="btn btn-info btn-small">
                                刷新 <i class="fa fa-refresh"></i>
                            </button>
                            <button id="btn_plus" type="button" class="btn btn-primary btn-small" data-toggle="modal"
                                    data-target="#studentModal" data-title="添加学生" data-type="add"
                                    data-url="/aixuexiao/manager/students/add">
                                添加 <i class="fa fa-plus"></i>
                            </button>
                            <button id="btn_edit" type="button" class="btn btn-primary btn-small" data-toggle="modal"
                                    data-target="#studentModal" data-title="更新学生" data-type="update"
                                    data-url="/aixuexiao/manager/students/update">
                                更新<i class="fa fa-edit"></i>
                            </button>
                            <button id="btn_delete" type="button" class="btn btn-danger btn-small" data-type="delete"
                                    data-url="/aixuexiao/manager/students/delete">
                                删除<i class="fa fa-trash"></i>
                            </button>
                        </form>
                    </div>
                    <!--/.span-->
                </div>
                <!--/.row-fluid-->
                <div class="dataTables_wrapper form-inline no-footer">
                    <table id="table_id" class="table table-striped table-bordered dataTable hover">
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
<%@include file="/WEB-INF/views/lky_common/js.jspf" %>
<script>
    $(document).ready(function () {
        var table = $('#table_id').DataTable(
                {
                    ajax: {
                        url: "/aixuexiao/manager/students/students.json",
                    },
                    lengthMenu: [[8, -1], [8, "ALL"]],
                    columns: [
                        {data: 'id'},
                        {data: 'name'},
                        {data: 'classid'},
                        {data: 'remark'},
                        {data: 'id'}
                    ],
                    columnDefs: [
                        {
                            targets: 4,
                            render: function (data, type, row, meta) {
                                var tmp = document.createElement("div");
                                var btn = $('<button/>').addClass("btn btn-primary btn-mini");
                                var i = $('<i/>').addClass("icon-comment");
                                $(btn).css("margin-right", "2px");
                                $(btn).append(i);
                                $(btn).attr({
                                    onclick: "location.href='/aixuexiao/manager/leavemessage?studentid=" + data + "'"
                                });
                                $(btn).append("微留言");

                                var btn1 = $('<button/>').addClass("btn btn-primary btn-mini");
                                var i1 = $('<i/>').addClass("icon-file");
                                $(btn1).css("margin-right", "2px");
                                $(btn1).append(i1);
                                $(btn1).attr({
                                    onclick: "location.href='/aixuexiao/manager/examdetail?studentid=" + data + "'"
                                });
                                $(btn1).append("考试情况");

                                $(tmp).append(btn);
                                $(tmp).append(btn1);
                                return $(tmp).html();
                            }
                        }]
                });
        $('#table_id tbody').on('click', 'tr', function () {
            if ($(this).hasClass('active')) {
                $(this).removeClass('active');
            } else {
                table.$('tr.active').removeClass('active');
                $(this).addClass('active');
            }
        });
        $('#btn_undo').click(function () {
            table.columns().flatten().each(function (i) {
                table.column(i).search('')
            });
            table.draw();
        });
        $('#btn_refresh').click(function () {
            table.ajax.reload();
        });
        $('#btn_search').click(function () {
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
            if (type == 'update') {
                var model = table.row('.active').data();
                $('#id_input').val(model.id);
                $('#name_input').val(model.name);
                $('#classid_select').val(model.classid);
                $('#remark_input').val(model.remark);
            }

            $('#studentModal').attr({
                "data-url": url
            });
        });
        $('#btn_save').click(function () {
            var student = {
                id: $('#id_input').val(),
                name: $('#name_input').val(),
                classid: $('#classid_select').val(),
                remark: $('#remark_input').val()
            };
            $.ajax({
                type: "POST",
                url: $('#studentModal').data('url'),
                contentType: "application/json;charset=utf-8",
                dataType: "text",
                data: JSON.stringify(student),
                success: function (message) {
                    if (message == null) {
                        $('#studentModal').modal('hide');
                        table.ajax.reload();
                    } else {
                        $('div#alert').css('display', 'block');
                        $('#alert_content').text(message);
                    }
                },
                error: function (message) {
                    $('#studentModal').modal('hide');
                    alert(message);
                }
            });
        });
        $('#btn_delete').click(function () {
            var model = table.row('.active').data();
            $.ajax({
                type: "POST",
                url: $('#btn_delete').data('url'),
                data: "id=" + model.id,
                success: function (message) {
                    table.ajax.reload();
                },
                error: function (message) {
                    alert(message);
                }
            });
        });
    });
</script>

</body>
</html>