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
	            <div class=" col-md-12">
	                <ol class="breadcrumb">
	                    <li class="active">项目管理</li>
	                    <li class="active">
	                   		 <c:if test="${state == 1 }">提交项目管理</c:if>
	                   		 <c:if test="${state == 2 }">待初审项目</c:if>
	                   		 <c:if test="${state == 3 }">审核通过项目</c:if>
	                   		 <c:if test="${state == 4 }">审核驳回项目</c:if>
	                   		 <c:if test="${state == 5 }">待复审项目</c:if>
	                    </li>
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
                          	<form action="cms/project/list.action" id="search" method="post">
                            <div class="row tables-btn-box" >
                            	<input type="hidden" name="pageIndex" id="pageIndexForm">
                            	<input type="hidden" name="state" value="${state }">
                                <div class="col-md-2">
                                    <span class="" >项目ID</span>
                                    <input type="number" class="form-control"  placeholder="请输入项目ID" value="${pid }" name="pid" id="pid">
                                </div>
<!--                                 <div class="col-md-2"> -->
<!--                                     <span class="" >项目状态</span> -->
<!--                                     <select  name="state"  class="form-control" id="state"> -->
<%--                                     	<option value="-1"  <c:if test="${state == -1 }">selected</c:if>>全部</option> --%>
<%--                                   		<option value="1"  <c:if test="${state == 1 }">selected</c:if>>待提交</option> --%>
<%--                                   		<option value="2"  <c:if test="${state == 2 }">selected</c:if>>初审中</option> --%>
<%--                                   		<option value="3"  <c:if test="${state == 3 }">selected</c:if>>审核通过</option> --%>
<%--                                   		<option value="4"  <c:if test="${state == 4 }">selected</c:if>>审核驳回</option> --%>
<%--                                   		<option value="4"  <c:if test="${state == 5 }">selected</c:if>>复审中</option> --%>
<!--                                     </select> -->
<!--                                 </div> -->
                                <div class="col-md-2">
                                    <span class="" >创建时间</span>
                                    <input type="text" class="form-control" name="createdate"  placeholder="请输入创建时间" value="<fmt:formatDate value="${createdate }" pattern="yyyy-MM-dd"/>"  id="createdate"/>
                                </div>
                                <div class="col-md-2">
                                    <span class="" >项目名称</span>
                                    <input type="text" class="form-control" name="pname" placeholder="请输入项目名称" id="pname" value="${pname }"/>
                                </div>
                                <div class="col-md-2">
                                    <span class="" >融资类型</span>
                                    <select  name="ptype"  class="form-control" id="ptype">
                                    	<option value="-1"  <c:if test="${ptype == -1 }">selected</c:if>>全部</option>
                                  		<option value="1"  <c:if test="${ptype == 1 }">selected</c:if>>长期理财</option>
                                  		<option value="2"  <c:if test="${ptype == 2 }">selected</c:if>>其他周期</option>
                                  		<option value="3"  <c:if test="${ptype == 3 }">selected</c:if>>短期理财（天）</option>
                                    </select>
                                </div>
                            </div>
                            <button class="btn btn-default pull-right search-btn btn-primary"  type="submit" >查询</button>
                            </form>
                            <div class="row tables-action-box">
                            <shiro:hasPermission name="projectAdd">
                                <div class="col-md-6">
                                   <button class="btn btn-success addData " type="submit"  onclick="window.location.href='${basePath}cms/project/addJsp.action'">新增项目</button>
                                </div>
                                </shiro:hasPermission>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" >
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>名称</th>
                                        <th>创建时间</th>
										<th>募集金额</th>
                                        <th>发起方</th>
										<th>融资类型</th>
										<th>融资期限</th>
										<c:if test="${state == 1}">
											<th>发布人</th>
										</c:if>
										<c:if test="${state == 2 }">
											<th>提交人</th>
										</c:if>
										<c:if test="${state == 3 }">
											<th>复审人</th>
										</c:if>
										<c:if test="${state == 5 }">
											<th>初审人</th>
										</c:if>
										<th>状态</th>
										<c:if test="${state == 4 }">
										<th>驳回理由</th>
										</c:if>
										<c:if test="${state == -1 }">
										<th>操作人</th>
										</c:if>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${list }" var="project">
                                    <tr class="odd gradeX" id="${project.projectId}">
                                    	<td>${project.projectId}</td>
                                        <td>${project.projectName}</td>
                                        <td><fmt:formatDate value="${project.projectCreateTime}" pattern="yyyy-MM-dd HH:mm"/> </td>
                                        <td>${project.getmoney} </td>
										<td>${project.originaname}</td>
                                        <td><c:if test="${project.projectFinancingType == 1 }">长期理财</c:if><c:if test="${project.projectFinancingType == 2 }">其他周期理财</c:if><c:if test="${project.projectFinancingType == 3 }">短期理财（天）</c:if></td>
										<td><c:choose><c:when test="${project.projectFinancingType == 3 }">${project.projectFinancingTerm}天</c:when><c:otherwise>${project.projectFinancingTerm}个月</c:otherwise> </c:choose> </td>
										<c:if test="${state == 1}">
											<td>${project.proCreatName }</td>
										</c:if>
										<c:if test="${state == 2 }">
											<td>${project.proSubName }</td>
										</c:if>
										<c:if test="${state == 3}">
											<td>${project.proSecAuName }</td>
										</c:if>
										<c:if test="${state == 5 }">
											<td>${project.proFirAuName }</td>
										</c:if>
										<td><c:if test="${project.projectState == 1 }">待提交</c:if>
										<c:if test="${project.projectState == 2 }">待审核</c:if>
										<c:if test="${project.projectState == 5 }">初审通过</c:if>
										<c:if test="${project.projectState == 3 }">审核通过</c:if>
										<c:if test="${project.projectState == 4 }">审核驳回</c:if>
										</td>
										<c:if test="${state == 4 }">
										<td>${project.projectFeedback }</td>
										</c:if>
										<c:if test="${state == -1 }">
										<td>${project.popreatName }</td>
										</c:if>
                                        <td class="center">
                                        	<c:if test="${project.projectState == 1 && state != -1}">
                                        	 <shiro:hasPermission name="projectSub ">
                                            <button class="btn btn-success dialog" type="button" data-id="${project.projectId}">提交</button>
                                            </shiro:hasPermission>
                                            </c:if>
                                            <button class="btn btn-info" type="button" onclick="window.location.href='${basePath}cms/project/watch.action?pid=${project.projectId}&flag=1'">详情</button>
                                            <c:if test="${(project.projectState == 1 || project.projectState == 4 ) && state != -1}">
                                            <shiro:hasPermission name="projectRevise ">
                                            <button class="btn btn-primary  " type="button" onclick="window.location.href='${basePath}cms/project/watch.action?pid=${project.projectId}&flag=3'">修改</button>
                                            </shiro:hasPermission>
                                            </c:if>
                                            <c:if test="${project.projectState == 2 && state != -1}">
                                            <shiro:hasPermission name="projectVerifyFirst ">
                                            <button class="btn btn-warning" type="button" onclick="window.location.href='${basePath}cms/project/watch.action?pid=${project.projectId}&flag=4'">开始初审</button>
                                            </shiro:hasPermission>
                                             </c:if>
                                            <c:if test="${project.projectState == 5 && state != -1}">
                                            <shiro:hasPermission name="projectVerify ">
                                            <button class="btn btn-warning" type="button" onclick="window.location.href='${basePath}cms/project/watch.action?pid=${project.projectId}&flag=2'">开始复审</button>
                                            </shiro:hasPermission>
                                             </c:if>
                                            <c:if test="${(project.projectState == 1 || project.projectState == 4) && state != -1 }">
                                            <shiro:hasPermission name="projectDel ">
                                            <button class="btn btn-danger dialog2" type="submit" data-id="${project.projectId}">删除</button>
                                            </shiro:hasPermission>
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
    		$.confirm('确定提交项目吗？',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
					$.ajax({
                        url:'cms/project/getState.action',
                        type:'post',
                        data:{projectId:id},
                        success:function(data){
                        	if(data.state==1){
                        		location.href = "${basePath}cms/project/submitProject.action?pid="+id;
                        	}else{
                        		$.alert("状态异常，请刷新后重新尝试！");
                        	}
                        }
                    });
		        }
		        this.hide();
		    });
    	})
    	$('.dialog2').click(function(){
    		var id=$(this).data('id');
    		$.confirm('确定删除数据吗？',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
                    $.ajax({
                        url:'cms/project/delete.action',
                        type:'post',
                        data:{pid:id},
                        success:function(data){
                            location.reload();
                        }
                    });
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
        
    	 //go跳转
        $('#myGo').click(function(){
        	var totalPage = ${totalPage};
        	var pageIndex = Number($("#myPage").val());
        	if(pageIndex>totalPage||pageIndex<1){
        		$.alert("请输入正确的页码");
        	}else{
        		$('#pageIndexForm').val(pageIndex);
        		doSubmit();
        	}
        })
        
    });
	
  //提交查询表单
    function doSubmit(){
    	$("#search").submit();
    }
   
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
       	$('#pageIndexForm').val(pageNo);
    		doSubmit();
       }
    
    </script>

</body>

</html>
