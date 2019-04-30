<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
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
	                    <li class="active">工作时间管理</li>
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
                            <form action="cms/timetable/list.action" method="post">
                            <div class="row tables-btn-box" style="display: block;">
                                <div class="col-md-2">
                                    <span class="" >时间</span>
                                    <input type="text" class="form-control" name="date" placeholder="请输入搜索时间" value="<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>"  id="date"/>
                                </div>
                            </div>
                            <button class="btn btn-primary pull-right search-btn" style="display: block;" type="submit" >查询</button>
                            </form>
                            <div class="row tables-action-box">
                                <div class="col-md-6">
<%--                                    <button class="btn btn-success addData " type="submit" class="addData" onclick="window.location.href='${basePath}cms/subject/addJsp.action'">新增</button> --%>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" >
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>日期</th>
                                        <th>星期</th>
                                        <th>节假日</th>
                                        <th>计息/不计息</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${list }" var="timetable">
	                                    <tr class="odd gradeX" id="${timetable.timetableId}">
	                                    	<td>
	                                    		<fmt:formatDate value="${timetable.timetableDate}" pattern="yyyy-MM-dd"/>
	                                    	</td>
	                                        <td>${timetable.timetableWeekday}</td>
	                                    	<c:if test="${timetable.timetableWorkholiday == 0 }">
		                                        <td>休息</td>
	                                    	</c:if>
	                                    	<c:if test="${timetable.timetableWorkholiday == 1 }">
		                                        <td>加班</td>
	                                    	</c:if>
	                                    	<c:if test="${timetable.timetableWorkholiday == -1 }">
		                                        <td>不是节假日</td>
	                                    	</c:if>
	                                    	<c:if test="${timetable.timetableIsrest==0 }">
	                                    		<td>不计息</td>
	                                    	</c:if>
	                                    	<c:if test="${timetable.timetableIsrest==1 }">
	                                    		<td>计息</td>
	                                    	</c:if>
	                                        <td class="center">
	                                            <c:if test="${timetable.timetableIsrest == 0}">
	                                            	<button class="btn btn-danger dialog" type="button" data-id="${timetable.timetableId}">计息</button>
	                                            </c:if>
	                                            <c:if test="${timetable.timetableIsrest == 1}">
	                                            	<button class="btn btn-success dialog2" type="button" data-id="${timetable.timetableId}">不计息</button>
	                                            </c:if>
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
    		$.confirm('确定改为上班吗？',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
					var str = "tId="+id+"&state=1";
			     	$.ajax({
			            type:"post",
			            url:"cms/timetable/change.action",
			            dataType:"json",
			            data:str,
			            success:function(data){
			         	   window.location.reload();
			            }
			        })
		        }
		        this.hide();
		    });
    	})
    	$('.dialog2').click(function(){
    		var id=$(this).data('id');
    		$.confirm('确定改为休息吗？',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
					var str = "tId="+id+"&state=0";
			     	$.ajax({
			            type:"post",
			            url:"cms/timetable/change.action",
			            dataType:"json",
			            data:str,
			            success:function(data){
			         	   window.location.reload();
			            }
			        })
		        }
		        this.hide();
		    });
    	})
        $('#myModal').on('show.bs.modal', function (e){
            $(e.relatedTarget).parents('tr').addClass('actTr');
        });
        $('#myModal').on('hide.bs.modal', function (e){
            $('.actTr').removeClass('actTr');
        });
        
        $('#myModal1').on('show.bs.modal', function (e){
            $(e.relatedTarget).parents('tr').addClass('actTr');
        });
        $('#myModal1').on('hide.bs.modal', function (e){
            $('.actTr').removeClass('actTr');
        });
        
        $('#date').datepicker({
        	dateFormat: 'yy-mm-dd',
        	changeYear: true,
        	changeMonth: true,
        	yearRange:'-100:+100',
        });
        
        $('#myGo').click(function(){
        	var totalPage = ${totalPage};
        	if(1<=$('#myPage').val()&& $('#myPage').val()<=Number(totalPage)){
        		window.location.href = "${basePath}cms/timetable/list.action?pageIndex=" + $('#myPage').val() +"&date="+$('#date').val();
        	}else{
        		$.alert("请输入有效页码！")
        	}
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
    	window.location.href = "${basePath}cms/timetable/list.action?pageIndex=" + pageNo+"&date="+$('#date').val();
    }
    
    </script>

</body>

</html>
