
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
                    <li class="active">满标待审核标的</li>
                    <li class="active">用户退款列表</li>
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
                            	<form action="cms/subject/drawbackList.action" method="post" id='searchForm'>
                                <input type="hidden" name="pageIndex" id="pageIndexForm">
                                <input type="hidden" name="subjectId" value="${subjectId}">
                                 <div class="col-md-2">
                                    <span class="" >用户号码</span>
                                    <input type="text" class="form-control" name="phone" placeholder="请输入用户号码" id="phone" value="${phone }"/>
                                </div>
                                <div class="col-md-2">
                                    <span class="" >状态</span>
                                    <select  name="status"  class="form-control" id="state">
                                    	<option value="-1"  <c:if test="${status == -1 }">selected</c:if>>全部</option>
                                  		<option value="1"  <c:if test="${status == 1 }">selected</c:if>>正在投标</option>
                                  		<option value="6"  <c:if test="${status == 6 }">selected</c:if>>等待退款申请</option>
                                  		<option value="7"  <c:if test="${status == 7 }">selected</c:if>>退款审核中</option>
                                  		<option value="8"  <c:if test="${status == 8 }">selected</c:if>>退款成功</option>
                                    </select>
                                </div>
                              	</form>
                            </div>
                            <button class="btn btn-default pull-right search-btn btn-primary"  type="button" onclick="doSubmit()" >查询</button>
                       </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" >
                        	<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>用户ID</th>
										<th>手机号</th>
										<th>用户名称</th>
										<th>投资金额</th>
										<th>有效金额</th>
										<th>投标时间</th>
										<th>投资状态</th>
										<th>驳回理由</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${investmentList }" var="investment">
										<tr class="odd gradeX">
											<td>${investment.investmentUserId }</td>
											<td>${investment.user.userPhone }</td>
											<td>${investment.user.userName }</td>
											<td>${investment.stringInvest }</td>
											<td>${investment.stringActualInvestment }</td>
											<td><fmt:formatDate value="${investment.investmentTime}"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<c:if test="${investment.investmentGatheringStatus==1 }">
												<td>正在投标</td>
											</c:if>
											<c:if test="${investment.investmentGatheringStatus==2 }">
												<td>正在收款</td>
											</c:if>
											<c:if test="${investment.investmentGatheringStatus==3 }">
												<td>已收款完成</td>
											</c:if>
											<c:if test="${investment.investmentGatheringStatus==6 }">
												<td>等待退款申请</td>
											</c:if>
											<c:if test="${investment.investmentGatheringStatus==7 }">
												<td>退款审核中</td>
											</c:if>
											<c:if test="${investment.investmentGatheringStatus==8 }">
												<td>退款成功</td>
											</c:if>
											<td>
												${investment.investmentReason }
											</td>
											<td>
											 <shiro:hasPermission name="drawback">
											  <c:if test="${investment.investmentGatheringStatus==1 }">
											  <button class="btn btn-warning dialog3"  type="submit" data-id="${investment.investmentId }" >允许退款</button>
											  </c:if>
											  <c:if test="${investment.investmentGatheringStatus==7 }">
											  <button class=" btn btn-info dialog"  type="submit" data-id="${investment.investmentId }" data-userid="${investment.user.userId }" data-sid="${subjectId }">审核通过</button>
											  <button class="btn btn-danger dialog2"  type="submit" data-id="${investment.investmentId }" >审核不通过</button>
											  </c:if>
											  </shiro:hasPermission>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
                            <div>
                            	<input type="hidden" id="pageIndex" value="${pageIndex }"/>
                                <div class="pull-left">当前显示第${pageIndex} / ${totalPage} 页, 总数目：${totalCount}, 每页显示${pageSize}条记录</div>
                                <div class="pull-right page-box" id="pagediv1" >
                                	<c:if test="${pageIndex > 1}">
                                    <span onclick="pageChanged('prev')">前一页</span>
                                    </c:if>
                                    <c:if test="${pageIndex < totalPage}">
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
    $(document).ready(function() {
        $('#createdate').datepicker({
        	dateFormat: 'yy-mm-dd',
        	changeYear: true,
        	changeMonth: true,
        	yearRange:'-100:+100',
        });
        
    });
    //提交查询表单
    function doSubmit(){
    	$("#searchForm").submit();
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
    
    $(document).ready(function() {
		$('.dialog3').click(function(){
			var id=$(this).data('id');
    		$.confirm('允许用户退款吗？',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
				     $.ajax({
				      	url:"${basePath}cms/subject/drawback.action",
				 		type:'post',
				 		data:{"investmentId":id,"status":4},
				 		success:function(data){
				 			if(data=="success"){
			    					location.reload();
					 			}else if(data=="status"){
					 				$.alert("该投资状态有误，请等待自动刷新",null,function(){
				    					location.reload();
				    				});
					 			}
				 		}
				      });
		        }
		        this.hide();
		    });
    	})
    	
    	$('.dialog').click(function(){
    		var id=$(this).data('id');
    		var userid=$(this).data('userid');
    		var sid=$(this).data('sid');
    		$.confirm('确定审核通过吗？',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
				     $.ajax({
					      	url:"${basePath}cms/subject/drawback.action",
					 		type:'post',
					 		data:{"investmentId":id,"status":6,"userId":userid,"sid":sid},
					 		success:function(data){
					 			if(data=="success"){
				    					location.reload();
					 			}else if(data=="status"){
					 				$.alert("该投资状态有误，请等待自动刷新",null,function(){
				    					location.reload();
				    				});
					 			}
					 		}
					 });
		        }
		        this.hide();
		    });
    	})
    	
    	$('.dialog2').click(function(){
    		var id=$(this).data('id');
    		$.confirm('<div class="confirm-title2">请填写不通过理由:<textarea style="margin-top:10px;resize:none;" class="form-control"></textarea></div>',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
					var reason=e.find('textarea').val()
					 $.ajax({
					      	url:"${basePath}cms/subject/drawback.action",
					 		type:'post',
					 		data:{"investmentId":id,"status":7,"reason":reason},
					 		success:function(data){
					 			if(data=="success"){
				    					location.reload();
						 			}else if(data=="status"){
						 				$.alert("该投资状态有误，请等待自动刷新",null,function(){
					    					location.reload();
					    				});
						 			}
					 		}
					 });
		        }
		        this.hide();
		    });	
    	})
        
    });
    </script>

</body>

</html>

</html>