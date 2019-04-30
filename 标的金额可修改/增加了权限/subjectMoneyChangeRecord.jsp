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
                    <li class="active">标的金额修改记录</li>
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
                            <div class="row tables-btn-box" >
								<!-- 稍后 action="cms/return/repayList.action name和value" -->
                            	<form action="cms/subject/subjectMoneyChangeRecordJsp.action" method="get" id='searchForm'>
									<input type="hidden" name="pageNum" id="pageNumForm">
									<div class="col-md-2">
										<span class="" >标的ID</span>
										<input type="number" class="form-control"  placeholder="请输入标的ID" value="${subjectId}" name="subjectId" >
									</div>
									<div class="col-md-2">
										<span class="" >标的名称</span>
										<input type="text" class="form-control"  placeholder="请输入标的名称" value="${subjectName}" name="subjectName" >
									</div>
									<div class="col-md-2">
										<span class="" >修改人</span>
										<input type="text" class="form-control"  placeholder="请输入修改人" value="${changeAdminName}" name="changeAdminName" >
									</div>
									<div class="col-md-2">
										<span class="" >每页数量</span>
										<select  name="pageSize"  class="form-control">
											<option value="5"  <c:if test="${pageSize == 5 }">selected</c:if>>5条</option>
											<option value="10"  <c:if test="${pageSize == 10 }">selected</c:if>>10条</option>
											<option value="20"  <c:if test="${pageSize == 30 }">selected</c:if>>20条</option>
											<!-- <option value="50"  <c:if test="${pageSize == 50 }">selected</c:if>>50条</option> -->
										</select>
									</div>
                              	</form>
                            </div>
                            <div>
	                            <!-- <button class="btn btn-default pull-left search-btn btn-success"  type="button" onclick="selected.watch(2)">审核通过</button> -->
                            </div>
                            <button class="btn btn-default pull-right search-btn btn-primary"  type="button" onclick="doSubmit()" >查询</button>
                       </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" >
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>标的ID</th>
                                        <th>标的名称</th>
                                        <th>修改前标的金额</th>
                                        <th>修改后标的金额</th>
                                        <th>金额修改方式</th>
										<th>修改金额</th>
                                        <th>被取用金额标的</th>
                                        <th>被取用标的取用前金额</th>
                                        <th>被取用标的取用后金额</th>
                                        <th>修改前项目剩余额度</th>
                                        <th>修改后项目剩余额度</th>
                                        <th>修改人</th>
                                        <th>修改时间</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${recordList}" var="list">
                                    <tr class="odd gradeX" id="${list.subjectId }" >
                                        <td>${list.subjectId}</td>
                                        <td>${list.subjectName}</td>
                                        <td>${list.subjectBeforeMoney}</td>
                                        <td>${list.subjectAfterMoney }</td>
                                        <td>
											<c:if test="${1==list.changeType}">从其他标的取额度</c:if>
											<c:if test="${2==list.changeType}">从项目余额取额度</c:if>
											<c:if test="${3==list.changeType}">减少标的额度放到项目余额</c:if>
										</td>
                                        <td>${list.changeMoney}</td>
										<td>${list.fromsubjectName}</td>
										<td>${list.fromsubjectBeforeMoney}</td>
										<td>${list.fromsubjectAfterMoney}</td>
										<td>${list.projectBeforeMoney}</td>
										<td>${list.projectAfterMoney}</td>
										<td>${list.changeAdminName}</td>
										<td><fmt:formatDate value="${list.changeTime}" pattern="yyyy-MM-dd"/></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div>
                            	<input type="hidden" id="pageNum" value="${pageNum }"/>
                                <div class="pull-left">当前显示第${pageNum} / ${pages} 页, 总数目：${total}, 每页显示${pageSize}条记录</div>
                                <div class="pull-right page-box" id="pagediv1" >
                                	<c:if test="${pageNum > 1}">
                                    <span onclick="pageChanged('prev')">前一页</span>
                                    </c:if>
                                    <c:if test="${pageNum < pages}">
                                    <span onclick="pageChanged('next')">后一页</span>
                                    </c:if>
                                    <input type="number" style="width: 50px" id="myPage"/>
                                    <span id="myGo">GO</span>
                                </div>
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

    //提交查询表单
    function doSubmit(){
    	$("#searchForm").submit();
    }
    function pageChanged(flag){
    	var pageNo = Number($("#pageNum").val());
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
    		pageNo = ${pages};
    		break;
    	}
    	$('#pageNumForm').val(pageNo);
		doSubmit();
    }
    
    //go跳转
    $('#myGo').click(function(){
    	var pages = ${pages};
    	var pageNum = Number($("#myPage").val());
    	if(pageNum>pages||pageNum<1){
    		$.alert("请输入正确的页码");
    	}else{
    		$('#pageNumForm').val(pageNum);
    		doSubmit();
    	}
    })
	

    </script>

</body>

</html>
