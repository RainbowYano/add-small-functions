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
	                    <c:if test="${state==-2 }"><li class="active">标的的发布管理</li></c:if>
	                    <c:if test="${state==0 }"><li class="active">待初审标的</li></c:if>
	                    <c:if test="${state==1 }"><li class="active">审核通过标的</li></c:if>
	                    <c:if test="${state==-1 }"><li class="active">撤回标的</li></c:if>
	                    <c:if test="${state==5 }"><li class="active">审核驳回标的</li></c:if>
	                    <c:if test="${state==2 }"><li class="active">满标待审核标的</li></c:if>
	                    <c:if test="${state==3 }"><li class="active">满标审核通过标的</li></c:if>
	                    <c:if test="${state==6 }"><li class="active">满标审核未通过标的</li></c:if>
	                    <c:if test="${state==9 }"><li class="active">待复审标的</li></c:if>
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
                            <form action="cms/subject/list.action" method="post" id='searchForm'>
                            <input type="hidden" name="pageIndex" id="pageIndexForm">
                            <div class="row tables-btn-box" style="display: block;">
                                <div class="col-md-2">
                                    <span class="" >标的名称</span>
                                    <input type="text" class="form-control" name="subjectName" id="subjectName" value="${subjectName }"  placeholder="请输入标的名称" >
                                </div>
                                <div class="col-md-2">
                                    <span class="" >对应项目id</span>
                                    <input type="number" class="form-control" name="pId" id="pId" value="${pId }"  placeholder="请输入项目ID" >
                                </div>
                                <div class="col-md-2">
                                    <span class="" >标的id</span>
                                    <input type="number" class="form-control"  name="sId" id="sId" value="${sId }" placeholder="请输入标的ID" >
                                </div>
                                <div class="col-md-2">
                                    <span class="" >创建时间</span>
                                    <input type="text" class="form-control" name="createtime" placeholder="请输入创建时间" value="<fmt:formatDate value="${createtime}" pattern="yyyy-MM-dd"/>"  id="createtime"/>
                                    <input type="hidden" name="state" value="${state }">
                                </div>
                                <div class="col-md-2">
                                	<span style="margin: 37px 0 0 0;">已募集金额：${alreadyInvest}元</span>
                                </div>
                                <div class="col-md-2">
                                	<span style="margin: 37px 0 0 0;">已投资人数：${alreadyPeople}人</span>
                                </div>
                            </div>
                            <button class="btn btn-primary pull-right search-btn" style="display: block;" type="button" onclick="doSubmit()" >查询</button>
                            </form>
                            <div class="row tables-action-box">
                                <div class="col-md-6">
                                <shiro:hasPermission name="subjectAdd ">
                                   <button class="btn btn-success addData " type="submit" class="addData" onclick="window.location.href='${basePath}cms/subject/addJsp.action'">新增</button>
                                   </shiro:hasPermission>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" >
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>名称</th>
<!--                                         <th>对应项目ID</th> -->
                                        <th>创建时间</th>
                                        <th>默认年化率</th>
                                        <th>认购上下限</th>
										<th>融资期限</th>
										<c:if test="${state==-2 }">
											<th>发布人</th>
										</c:if>
										<c:if test="${state==0 }">
											<th>提交人</th>
										</c:if>
										<c:if test="${state==9 }">
											<th>初审人</th>
										</c:if>
										<c:if test="${state==1 }">
											<th>复审人</th>
										</c:if>
										<c:if test="${state==-1 }">
											<th>撤回人</th>
										</c:if>
										<c:if test="${state==3 || state == 6}">
											<th>满标审核人</th>
										</c:if>
										<c:if test="${state==2}">
											<th>结标人</th>
										</c:if>
										<c:if test="${state==3 }">
											<th>正式起息日</th>
										</c:if>
										<th>状态</th>
										<c:if test="${state==5 || state==6}">
										<th>驳回理由</th>
										</c:if>
										<c:if test="${state==-3}">
										 <th>操作人</th>
										</c:if>
										<th>已募集金额</th>
										<th>投资百分比</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${list }" var="subject">
                                    <tr class="odd gradeX" id="${subject.subjectId}">
                                    	<td>${subject.subjectId}</td>
                                        <td>${subject.subjectName}</td>
<%--                                         <td>${subject.subjectProjectId}</td> --%>
                                        <td><fmt:formatDate value="${subject.subjectCreatetime}" pattern="yyyy-MM-dd HH:mm"/></td>
											<td>
											<c:forEach items="${subject.annualizedReturnList }" var="list">
												<fmt:formatNumber maxFractionDigits="2" type="percent" value="${list.annualizedReturnNum }" /><br>
											</c:forEach>
											</td>
											<td>
											<c:forEach items="${subject.annualizedReturnList }" var="list">
	 											 ${list.min }-${list.max }<br>
											</c:forEach>
											</td>
										<td><c:choose><c:when test="${subject.subjectType==1 }">${subject.subjectFinancingPeriod}个月</c:when><c:otherwise>${subject.subjectFinancingPeriod}天</c:otherwise></c:choose> </td>
										<c:if test="${state==-2 }">
											<td>${subject.subAddName }</td>
										</c:if>
										<c:if test="${state==0 }">
											<td>${subject.subSubName }</td>
										</c:if>
										<c:if test="${state==9 }">
											<td>${subject.subFiAuName }</td>
										</c:if>
										<c:if test="${state==1 }">
											<td>${subject.subSAName }</td>
										</c:if>
										<c:if test="${state==-1 }">
											<td>${subject.subCanName }</td>
										</c:if>
										<c:if test="${state==3 || state == 6 }">
											<td>${subject.subFuAuName }</td>
										</c:if>
										<c:if test="${state==2 }">
										<c:choose>
											<c:when test="${null != subject.subendName }">
												<td>${subject.subendName }</td>
											</c:when>
											<c:otherwise>
												<td>—</td>
											</c:otherwise>
										</c:choose>
											
										</c:if>
										<c:if test="${state==3 }">
											<td><fmt:formatDate value="${subject.subjectInterestBearingTime}" pattern="yyyy-MM-dd"/></td>
										</c:if>
										<td>
											<c:if test="${subject.subjectState == -2 }">待提交</c:if>
											<c:if test="${subject.subjectState == -1 }">撤标</c:if>
											<c:if test="${subject.subjectState == 0 }">初审中</c:if>
											<c:if test="${subject.subjectState == 1 }">融资中</c:if>
											<c:if test="${subject.subjectState == 2 }">满标待审核</c:if>
											<c:if test="${subject.subjectState == 3 }">还款中</c:if>
											<c:if test="${subject.subjectState == 4 }">募集成功</c:if>
											<c:if test="${subject.subjectState == 5 }">审核驳回</c:if>
											<c:if test="${subject.subjectState==6 }">满标审核未通过</c:if>
											<c:if test="${subject.subjectState==9 }">复审中</c:if>
										</td>
										<c:if test="${state==5 || state==6}">
										<td>${subject.subjectFeedback}</td>
										</c:if>
										<c:if test="${state == -3}">
										<td>${subject.sopreateName}</td>
										</c:if>
										<td>${subject.alreadyInvest }</td>
										<td>${subject.rate*100 }%</td>
                                        <td class="center">
                                        <shiro:hasPermission name="subjectSubmit">
                                        	<c:if test="${subject.subjectState == -2 && state != -3}">
                                            <button class="btn btn-success dialog2" data-id="${subject.subjectId}" type="button">提交</button>
                                            </c:if>
                                        </shiro:hasPermission>
                                        
                                        <c:if test="${ state ==1 || state == 2 || state == 3 || state == 6}">
                                            <button class="btn btn-success" onclick="tocancelTop(${subject.subjectId})" type="button">清除置顶号</button>
                                        </c:if>
                                        
<!--                                             该审核是提交后审核按钮 -->
										<shiro:hasPermission name="subjectauditing">
											<c:if test="${subject.subjectState == 0 && state != -3}">
	                                           <button class="btn btn-warning" onclick="toauditing(${subject.subjectId})" type="button">开始初审</button>
	                                         </c:if>
                                        </shiro:hasPermission>
	                                         <shiro:hasPermission name="subjectSecauditing">
	                                           <c:if test="${subject.subjectState == 9 && state != -3}">
	                                           <button class="btn btn-warning" onclick="tosecauditing(${subject.subjectId})" type="button">开始复审</button>
	                                          </c:if>
                                        </shiro:hasPermission>
<!--                                             满表待审核状态的审核按钮 -->
										<shiro:hasPermission name="subjectFullAuditing">
                                            <c:if test="${subject.subjectState == 2 && state != -3}">
                                            <button class="btn btn-warning" onclick="fullauditing(${subject.subjectId},${subject.drawbackCount})" type="button" >审核标的</button>
                                            </c:if>
                                        </shiro:hasPermission>
                                            <button class="btn btn-info" type="button" onclick="detailsub(${subject.subjectId})">详情</button>
                                        <shiro:hasPermission name="subjectUpdate">
                                            <c:if test="${(subject.subjectState == -2 || subject.subjectState == 5) && state != -3}">
                                            <button class="btn btn-primary" type="button" onclick="updatesub(${subject.subjectId})">修改</button>
                                            </c:if>
                                        </shiro:hasPermission>
                                        <shiro:hasPermission name="subjectCancel">
                                            <c:if test="${(subject.subjectState == 1 || subject.subjectState == 2)&& state != -3}">
                                            <button class="btn btn-primary dialog" type="submit" data-id="${subject.subjectId}">撤销标的</button>
                                            </c:if>
                                        </shiro:hasPermission>
                                        <shiro:hasPermission name="endsub">
                                            <c:if test="${subject.subjectState == 1&& state != -3}">
                                            <button class="btn btn-danger dialog3" type="submit" data-id="${subject.subjectId}">结标</button>
                                            </c:if>
                                        </shiro:hasPermission>
                                           <shiro:hasPermission name="drawback">
                                           <c:if test="${(subject.subjectState==2||subject.subjectState==1)&& state != -3 }">
                                           		<button class="btn btn-warning relative" onclick="drawback(${subject.subjectId})" type="button">
                                           		用户退款 
                                           		<c:if test="${subject.drawbackCount>0}">
                                           			<div class="spop">${subject.drawbackCount}</div>
                                           		</c:if>
                                           		</button>
                                           </c:if>
                                           </shiro:hasPermission>
                                           <shiro:hasPermission name="sub_cha_cha">
                                           <c:if test="${subject.subjectState == 1||subject.subjectState == 2||subject.subjectState == 3||subject.subjectState == 4}">
	                                        <button type="button" class="btn btn-info" onclick="changeChannel(${subject.subjectId})">修改渠道</button>
	                                        </c:if>
	                                        </shiro:hasPermission>
                                            <c:if test="${subject.subjectState == 1}">
                                                <button class="btn btn-danger dialog4" type="submit" data-id="${subject.subjectId}">导入投资</button>
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
    		$.confirm('确定撤销标的吗？',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
					$.ajax({
				        type:"post",
				        url:"cms/subject/getState.action",
				        dataType:"json",
				        data:{'subjectId':id},
				        success:function(data){
				     	   if(data.state!=-1){
				     		  $.ajax({
			                        url:'cms/subject/cancelSub.action',
			                        type:'post',
			                        data:{subjectId:id},
			                        success:function(data){
			                            location.reload();
			                        }
			                    });
				     	   }else{
				     		   $.alert("状态异常，请刷新后重新尝试！");
				     	   }
				        }
				    })
		        }
		        this.hide();
		    });
    	})
    	$('.dialog2').click(function(){
    		var id=$(this).data('id');
    		$.confirm('确定提交标的吗？',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
					var str = "subjectId="+id+"&flag=0";
					$.ajax({
				        type:"post",
				        url:"cms/subject/getState.action",
				        dataType:"json",
				        data:{'subjectId':id},
				        success:function(data){
				     	   if(data.state==-2){
				     		  $.ajax({
							        type:"post",
							        url:"cms/subject/changestate.action",
							        dataType:"json",
							        data:str,
							        success:function(data){
							     	   location.reload();
							        }
							    })
				     	   }else{
				     		   $.alert("状态异常，请刷新后重新尝试！");
				     	   }
				        }
				    })
				 	
		        }
		        this.hide();
		    });
    	})
    	$('.dialog3').click(function(){
    		var id=$(this).data('id');
    		$.confirm('确定结标吗？',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
					$.ajax({
						url:"cms/subject/getState.action",
				        dataType:"json",
				        data:{'subjectId':id},
                        success:function(data){
                        	if(data.state==1){
                        		$.isLoading.show("请稍后。。。。。。。。",true);
                                $.ajax({
                                    url:'cms/subject/endSub.action',
                                    type:'post',
                                    data:{subjectId:id},
                                    success:function(data){
                                        location.reload();
                                    }
                                });
                        	}else{
                        		$.alert("状态异常，请刷新后重新尝试！");
                        	}
                        }
                    });
		        }
		        this.hide();
		    });
    	})
        $('.dialog4').click(function(){
            var id=$(this).data('id');
            var pageIndex = $('#pageIndexForm').val();
            if(pageIndex == null || pageIndex == ''){
                pageIndex = 1;
            }
            var subjectName = $('#subjectName').val();
            var pId = $('#pId').val();
            var sId = $('#sId').val();
            var createtime = $('#createtime').val();

            window.location.href="cms/invest/addJsp.action?subjectId=" + id +"&pageIndex=" + pageIndex +"&subjectName=" + subjectName + "&pId=" + pId +"&sId=" + sId +"&createtime=" + createtime;
        })
        $('#createtime').datepicker({
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

   
   function detailsub(subjectId){
	   window.location.href="${basePath}cms/subject/detail.action?subjectId="+subjectId;
   }
   function fullauditing(subjectId,drawbackCount){
	   if(drawbackCount==0){
	  	 window.location.href="${basePath}cms/subject/fullauditingJsp.action?subjectId="+subjectId;
	   }else{
		   $.confirm('当前有'+drawbackCount+'条用户退款申请未处理。',[{yes:'确定'}],function(type,e){
		        this.hide();
		    });
	   }
   }
   function updatesub(subjectId){
	   window.location.href="${basePath}cms/subject/updateJsp.action?subjectId="+subjectId;
   }
   function toauditing(subjectId){
	   window.location.href="${basePath}cms/subject/auditingJsp.action?subjectId="+subjectId+"&flag=1";
   }
   function tosecauditing(subjectId){
	   window.location.href="${basePath}cms/subject/auditingJsp.action?subjectId="+subjectId+"&flag=2";
   }
   //用户退款
   function drawback(subjectId){
	   window.location.href="${basePath}cms/subject/drawbackList.action?subjectId="+subjectId;
   }

   
   
 //提交查询表单
   function doSubmit(){
   	$("#searchForm").submit();
   }
 	function tocancelTop(id){
 		$.confirm("确定清除置顶号吗？",[{yes:'确定'},{no:'取消'}],function(type,e){
			if(type=='yes'){
				$.ajax({
		    		url:'cms/subject/cancelTop.action',
		    		type:'post',
		    		data:{"subjectId":id},
		    		success:function(data){
	    				$.alert("清除成功",'','',1500);
		    		}
		    	});
	        }
	       	this.hide();	 
	    });	
 	}
 	function changeChannel(id){
    	window.location.href="${basePath}cms/subject/changeChannelJsp.action?subjectId="+id;
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
