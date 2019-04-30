<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../common_util/path.jsp" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <base href="<%=basePath %>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
     <%@ include file="../util/title.jsp" %>

    <link href="css/cms/dist/bootstrap.min.css" rel="stylesheet">
    <link href="css/cms/dist/fontface.css" rel="stylesheet">
    <link href="css/cms/dist/global.css" rel="stylesheet">
</head>
<body>

    <div id="wrapper" class="edit-page">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
			<%@ include file="../util/top.jsp" %>
            <%@ include file="../util/left.jsp" %>
        </nav>
        <div id="page-wrapper">
            <div class="row page-nav">
            	<div class="col-md-12">
                <ol class="breadcrumb">
                    <li class="active">标的管理</li>
                    <li class="active">修改渠道</li>
                </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-9">
                    <form action="cms/subject/changeChannel.action" method="post" class="form-horizontal">
                        <input type="hidden" name="subjectId" value="${subjectId}">
						<div class="form-group">
                            <label class="col-md-3 control-label">标的名称：</label>
                            <div class="col-md-3">
                            <p class="form-control-static">${subject.subjectName }</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">修改渠道：</label>
                                <div class="col-md-4 well">
                                <div class="col-md-6">
                                <c:forEach items="${list }" var="channel" varStatus="status">
                                    <div class="checkbox">
                                        <label>
                                        	<input type="checkbox" name="channelIds" <c:if test="${channel.ischeck == 1 }">checked="checked"</c:if>  value="${channel.channelId}">${channel.channelName }
                                        </label>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <br/>

                        <div class="form-group">
                            <label class="col-md-2 control-label"></label>
                            <div class="col-md-8">
                                <div class="center-box">
                                    <button type="submit" class="btn btn-primary btn-save">保存</button>
                                    <button type="button" class="btn btn-default" onclick="history.go(-1)">取消</button>
                                </div>
                            </div>
                        </div>
                        <br/>

                        
                    </form>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->


	<script type="text/javascript">
	$(document).ready(function() {
		$('#datetime').datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	changeYear: true,
	    	changeMonth: true,
	    	yearRange:'-100:+100',
	    });
	})
	</script>
</body>
</html>