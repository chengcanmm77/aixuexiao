<!--basic scripts-->
<!--[if !IE]>-->
<script type="text/javascript">
	window.jQuery || document.write("<script src='<%=request.getContextPath()%>/assets/bower_components/jquery/dist/jquery.min.js'>"+"<"+"/script>");
</script>
<!--<![endif]-->
<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script type="text/javascript">
	if("ontouchend" in document) document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="<%=request.getContextPath()%>/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!--page specific plugin scripts-->
<!--ace scripts-->
<script src="<%=request.getContextPath()%>/assets/js/ace-elements.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/ace.min.js"></script>
<script type="text/javascript" charset="utf8" src="<%=request.getContextPath()%>/assets/js/jquery.dataTables.min.js"></script>
<!--inline scripts related to this page-->