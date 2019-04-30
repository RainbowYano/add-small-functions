<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common_util/path.jsp" %>
<!DOCTYPE html>
<html lang="en" >

<head>

    <meta charset="utf-8">
    <base href="<%=basePath %>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

   <%@ include file="../util/title.jsp" %>

    <link href="css/cms/dist/bootstrap.min.css" rel="stylesheet">
    <link href="css/cms/dist/fontface.css" rel="stylesheet">
    <link href="css/cms/dist/global.css" rel="stylesheet">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

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
                    <li class="active">模板列表</li>
                </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading clearfix ">
                            <div class="row">
                                <div class="caption font-red-intense col-md-12">
                                    <i class="fa fa-search font-red-intense"></i>
                                    <span class="caption-subject bold uppercase">查询</span>
                                    <button class="btn btn-default hide-search pull-right" type="button">隐藏</button>
                                </div>
                            </div>
                            <br />
                            <div class="row tables-btn-box" style="display: block;">
                            	<form method="post" action="cms/subject/tempList.action" id="searchForm">
                       		    <input type="hidden" name="pageIndex" id="pageIndexForm">
                                <div class="col-md-2">
                                    <span class="" >模板ID</span>
                                    <input type="number" class="form-control"  placeholder="请输入模板ID" id="subjectId" value="${subjectId}" name="subjectId" >
                                </div>
                                <div class="col-md-2">
                                    <span class="" >模板名称</span>
                                    <input type="text" class="form-control" name="subjectName" id="subjectName" placeholder="请输入模板名称" value="${subjectName}"/>
                                </div>
                                </form>
                            </div>
                            <button class="btn btn-primary  pull-right search-btn" style="display: block;" type="submit" onclick="doSubmit()">查询</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" >
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>模板ID</th>
                                        <th>模板名称</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${list}" var="subject">
                                    <tr class="odd gradeX" id="${subject.subjectId}">
                                    	<td >${subject.subjectId}</td>
                                        <td>${subject.subjectName}</td>
                                        <td class="center">
                                         <button class="btn btn-info " type="submit" onclick="detail('${subject.subjectId}')">详情</button>
                                            <button class="btn btn-danger dialog" data-id="${subject.subjectId}" type="submit">删除</button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div>
                            	<%@ include file="../util/page.jsp" %>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
	
    <script>
    $(document).ready(function() {
    	$('.dialog').click(function(){
    		var id=$(this).data('id');
    		$.confirm('确定删除数据吗？',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
					location.href = "${basePath}cms/subject/deleteTemp.action?subjectId="+id;
		        }
		        this.hide();
		    });
    	})
        $('#createdate').datepicker({
        	dateFormat: 'yy-mm-dd',
        	changeYear: true,
        	changeMonth: true,
        	yearRange:'-100:+100',
        });
        
    });
	
    function pageChanged(flag){
    	var pageNo = Number($("#pageIndex").val());
    	switch(flag){
    		case("first"):
    		pageNo = 1;
    		break;
    		case("prev"):
    		pageNo -= 1;
    		break;
    		case("next"):
    		pageNo += 1;
    		break;
    		case("last"):
    		pageNo = ${totalPage};
    		break;
    	}
    	$("#pageIndex").val(pageNo);
    		window.location.href = "${basePath}cms/subject/tempList.action?pageIndex=" + pageNo +"&subjectName="+encodeURIComponent(encodeURIComponent($('#subjectName').val()))+"&subjectId="+$('#subjectId').val();
    }
    function doSubmit(){
    	$("#searchForm").submit();
    }
    function detail(id){
    	window.location.href="${basePath}cms/subject/detail.action?subjectId="+id+"&tempFlag=0";
    }
    //go跳转
    $('#myGo').click(function(){
    	var totalPage = ${totalPage};
    	var pageIndex = Number($("#myPage").val());
    	if(pageIndex>totalPage||pageIndex<1){
    		$.alert("请输入正确的页码");
    	}else{
	    		window.location.href = "${basePath}cms/subject/tempList.action?pageIndex=" + pageIndex+"&subjectName="+encodeURIComponent(encodeURIComponent($('#subjectName').val()))+"&subjectId="+$('#subjectId').val();
    	}
    	
    })

    </script>

</body>

</html>
