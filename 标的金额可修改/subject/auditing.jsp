<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../common_util/path.jsp" %>
<!DOCTYPE html>
<html >
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
                    <li class="active">审核</li>
                </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <form action="cms/subject/update.action" method="post" enctype="multipart/form-data" class="form-horizontal">

                        <div class="collapse" id="collapseExample2">
                            <div class="clearfix">
                                <div class="panel panel-default col-md-8">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">借款方：</label>
                                            <div class="col-md-2">
                                                <p class="form-control-static"><span class="" id="xmze">${originator.originatorName }</span></p>
                                            </div>
                                            <label class="col-md-2 control-label">项目名称：</label>
                                            <div class="col-md-2">
                                                <p class="form-control-static"><span class="" id="mjxx">${project.projectName }</span></p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">项目总额：</label>
                                            <div class="col-md-8">
                                                <p class="form-control-static"> <span class="" id="xmze">${project.getmoney }</span></p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">募集下限：</label>
                                            <div class="col-md-2">
                                                <p class="form-control-static"><span class="" id="mjxx">${project.getmoneylimit }</span></p>
                                            </div>
                                            <label class="col-md-2 control-label">剩余额度：</label>
                                            <div class="col-md-2">
                                                <p class="form-control-static"><span class="" id="syed">${project.getsurplusmoney }</span></p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">融资类型：</label>
                                            <div class="col-md-2">
                                                <p class="form-control-static">
                                                    <c:if test="${project.projectFinancingType==1 }">
                                                        <span class="" >长期融资</span>
                                                    </c:if>
                                                   <c:if test="${project.projectFinancingType==2 }">
                                                        <span class="" >其他周期融资</span>
                                                    </c:if>
                                                    <c:if test="${project.projectFinancingType==3 }">
                                                        <span class="" >短期融资（天）</span>
                                                    </c:if>
                                                </p>
                                            </div>
                                            <label class="col-md-2 control-label">融资期限：</label>
                                            <div class="col-md-2">
                                                <p class="form-control-static">
                                                    <span class="" id="rzqx">
                                                    <c:choose>
                                                	<c:when test="${project.projectFinancingType==3 }">${project.projectFinancingTerm } 天</c:when>
                                                	<c:otherwise>${project.projectFinancingTerm } 个月</c:otherwise>
                                                	</c:choose>
                                                	</span>
                                                    <input type="hidden" name="subjectFinancingPeriod" id="subjectFinancingPeriod">
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 control-label">标的名称：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                        <span class="">${subject.subjectName }</span>
                                        <input type="hidden" name="subjectId" value="${subject.subjectId }">
                                    </p>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-md-2 control-label">期名称：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                        <span class="">${subject.subjectStageShowName }</span>
                                    </p>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-md-2 control-label">置顶号：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                        <span class="">${subject.subjectTop }</span>
                                    </p>
                                </div>
                            </div>
                            

                            <div class="form-group">
                                <label class="col-md-2 control-label">标的金额：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                        <span class="">${subject.getmoney }</span>
                                    </p>
                                </div>
                            </div>
                            

                            <div class="form-group">
                                <label class="col-md-2 control-label">最小认购额度：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                        <span class="">${subject.minmoney }</span> 元
                                    </p>
                                </div>
                            </div>
                            

                            <div class="form-group">
                                <label class="col-md-2 control-label">最大认购额度：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                        <span class="">${subject.maxmoney }</span> 元
                                    </p>
                                </div>
                            </div>
                            

                            <div class="form-group">
                                <label class="col-md-2 control-label">递增金额：</label>
                                <div class="col-md-1">
                                    <p class="form-control-static">
                                        <span data-tofixed>${subject.subjectAdditionalMultiple }</span>
                                    </p>
                                </div>
                                <p class="col-md-5 form-control-static text-warning">
                                    <i class="fa fa-info-circle fa-fw"></i> <span> 在最小认购额度基础上，每次递增的额度为递增金额</span>
                                </p>
                            </div>
                            
							<div class="form-group">
                                <label class="col-md-2 control-label">付息方式：</label>
                                <div class="col-md-2">
                                    <p class="form-control-static">
                                        <c:if test="${subject.subjectPaymentMethod == 1 }">
                                            <span class="">固定日期还息方式</span>
                                        </c:if>
                                        <c:if test="${subject.subjectPaymentMethod == 2 }">
                                            <span class="">按周期递推还息方式</span>
                                        </c:if>
                                    </p>
                                </div>
                                <p class="col-md-5 form-control-static text-warning">
                                    <i class="fa fa-info-circle fa-fw"></i> 
                                    <c:if test="${subject.subjectPaymentMethod == 1 }">
                                        <span id="showMsg">项目启动前约定还息日期</span>
                                    </c:if>
                                    <c:if test="${subject.subjectPaymentMethod == 2 }">
                                        <span id="showMsg">根据用户投资后，满标审核通过作为起始节点，按固定周期递推</span>
                                    </c:if>
                                </p>
                            </div>
							<c:if test="${subject.subjectType == 1 }">
                            <div class="form-group guding">
                                <label class="col-md-2 control-label">还息月份：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                        <c:if test="${subject.subjectPaymentMethodType==0 && subject.subjectPaymentCycle==1  }">
                                            <span class="">按月付息</span>
                                        </c:if>
                                        <c:if test="${subject.subjectPaymentMethodType==1  }">
                                            <span class="">按自然季度付息</span>
                                        </c:if>
                                        <c:if test="${subject.subjectPaymentMethodType==3 }">
                                            <span class="">按自然半年度付息</span>
                                        </c:if>
                                        <c:if test="${subject.subjectPaymentMethodType==0 && subject.subjectPaymentCycle==3  }">
                                            <span class="">按季度付息</span>
                                        </c:if>
                                        <c:if test="${subject.subjectPaymentMethodType==0 && subject.subjectPaymentCycle==6  }">
                                            <span class="">按半年度付息</span>
                                        </c:if>
                                        <c:if test="${subject.subjectPaymentMethodType==0 && subject.subjectPaymentCycle==12  }">
                                            <span class="">按年付息</span>
                                        </c:if>
                                    </p>
                                </div>
                            </div>
                            </c:if>
                            <!-- 固定日期还息方式 -->
                            <c:if test="${subject.subjectPaymentMethod == 1 }">
                            <div class="form-group">
                                <label class="col-md-2 control-label">还息日：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                        <span class="">${subject.subjectPaymentDay }</span> 日
                                    </p>
                                </div>
                            </div>
                            </c:if>
                            <div class="form-group">
                                <label class="col-md-2 control-label">产品类型：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                        <c:if test="${isuser==0 }">
                                            <span class="" >普通标</span>
                                        </c:if>
                                        <c:if test="${isuser==1 }">
                                            <span class="" >用户组标,用户组为：<c:forEach items="${users }" var="user">${user.userGroupName }、</c:forEach></span>
                                        </c:if>
                                    </p>
                                </div>
                            </div>
                            

                            <div class="form-group">
                                <label class="col-md-2 control-label">渠道定向项目：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                        <c:if test="${ischannel == 1 }">
                                            <span class=""><c:forEach items="${chs }" var="channel">${channel.channelName }、</c:forEach></span>
                                        </c:if>
                                        <c:if test="${ischannel == 0 }">
                                            <span class="">否</span>
                                        </c:if>
                                    </p>
                                </div>
                            </div>
                            

                            <div class="form-group">
                                <label class="col-md-2 control-label">起息节点：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                        <c:if test="${subject.subjectNodeInterest==1 }">
                                            <span>T+${subject.subjectNumOfDays }工作日起息</span>
                                        </c:if>
                                        <c:if test="${subject.subjectNodeInterest==2 }">
                                            <span>满标审核后${subject.subjectNumOfDays }日起息</span>
                                        </c:if>
                                        <c:if test="${subject.subjectNodeInterest==3 }">
                                            <span>项目集满后${subject.subjectNumOfDays }日起息</span>
                                        </c:if>
                                        <c:if test="${subject.subjectNodeInterest==4 }">
                                            <span>T+${subject.subjectNumOfDays }起息</span>
                                        </c:if>
                                        <c:if test="${subject.subjectNodeInterest==5 }">
                                            <span>T+0工作日起息(分段贴息${subject.subjectFirDiscDay }个工作日)</span>
                                        </c:if>
                                        <c:if test="${subject.subjectNodeInterest==6 }">
                                            <span>T+0起息(分段贴息${subject.subjectFirDiscDay }天)</span>
                                        </c:if>
                                    </p>
                                </div>
                            </div>
                            

                            <c:forEach items="${arList }" var="ar">
                            <div class="form-group">
                                <label class="col-md-2 control-label">默认年化收益率：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                    	<c:if test="${null != ar.annualizedReturnBaserate }">
                                    		<span><fmt:formatNumber type="percent" maxFractionDigits="2" value="${ar.annualizedReturnBaserate }" /></span>
                                    	</c:if>
                                    	<c:if test="${null == ar.annualizedReturnBaserate }">
	                                        <span><fmt:formatNumber type="percent" maxFractionDigits="2" value="${ar.annualizedReturnNum }" /></span>
                                    	</c:if>
                                    </p>
                                </div>
                            </div>
                            <br/>
                            <div class="form-group">
                                <label class="col-md-2 control-label">加息率：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                        <span><fmt:formatNumber type="percent" maxFractionDigits="2" value="${ar.annualizedReturnAddRate }" /></span>
                                    </p>
                                </div>
                            </div>
                            <br/>
                            </c:forEach>

                            <input type="hidden" id="inserts">
						<c:if test='${subject.subjectNodeInterest==1 || subject.subjectNodeInterest==2|| subject.subjectNodeInterest==3|| subject.subjectNodeInterest==4}'>
                            <div class="form-group">
                                <label class="col-md-2 control-label">贴息利率：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                        <c:if test="${subject.subjectDiscountRate==1 }">
                                            <span>按照投资利率贴息</span>
                                        </c:if>
                                        <c:if test="${subject.subjectDiscountRate==2 }">
                                            <span>自定义贴息利率</span>
                                        </c:if>
                                    </p>
                                </div>
                            </div>
                            
                            <c:if test="${subject.subjectDiscountRate==2 }">
                            <div class="form-group">
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-4 well">
                                    <p class="form-control-static">
                                        <span class=""><fmt:formatNumber type="number" value="${subject.subjectCustomDiscountRate*100} " maxFractionDigits="2"/></span> %
                                    </p>
                                </div>
                            </div>
                            
                            </c:if>
                        </c:if>
                        <c:if test='${subject.subjectNodeInterest==5 || subject.subjectNodeInterest==6}'>
							<div class="form-group">
                                <label class="col-md-2 control-label">贴息利率：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                    	<c:if test="${subject.subjectNodeInterest==5 }">
                                    		<span class="">M（含）个工作日内贴息利率：<fmt:formatNumber type="number" value="${subject.subjectFirDiscRate } " maxFractionDigits="2"/></span> %<br><br>
                                    		<span class="">M个工作日后贴息利率：<fmt:formatNumber type="number" value="${subject.subjectCustomDiscountRate*100} " maxFractionDigits="2"/></span>%
                                    	</c:if>
                                    	<c:if test="${subject.subjectNodeInterest==6 }">
                                    		<span>M（含）天内贴息利率：<fmt:formatNumber type="number" value="${subject.subjectFirDiscRate } " maxFractionDigits="2"/></span> %<br><br>
                                    		<span>M天后贴息利率：<fmt:formatNumber type="number" value="${subject.subjectCustomDiscountRate*100} " maxFractionDigits="2"/></span>%
                                    	</c:if>
                                    	<br><br>
                                   		<span class="">贴息说明：
                                  		<c:if test="${subject.subjectNodeInterest==5 || subject.subjectNodeInterest==6}">
                                    		<c:if test="${subject.subjectDiscountExplain == 1 }">
                                    			活期    按人民银行活期利率贴息
                                    		</c:if>
                                    		<c:if test="${subject.subjectDiscountExplain == 2 }">
                                    			定期    按人民银行定期利率贴息
                                    		</c:if>
                                    		<c:if test="${subject.subjectDiscountExplain == null || subject.subjectDiscountExplain == 0 }">
                                    			无
                                    		</c:if>
                                    	</c:if>
                                   		</span>
                                    </p>
                                </div>
                            </div>
						</c:if>
						<div class="form-group">
		                    <label class="col-md-2 control-label">只能首次购买：</label>
		                    <div class="col-md-8">
		                        <c:if test="${subject.subjectIsNew == 1}">
		                             <p class="form-control-static">是</p>
		                        </c:if>
		                        <c:if test="${subject.subjectIsNew == 0}">
		                             <p class="form-control-static">否</p>
		                        </c:if>
		                    </div>
		                </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">是否有优惠金额：</label>
                            <div class="col-md-8">
                                <c:if test="${subject.subjectIsInvestDiscount == 1}">
                                     <p class="form-control-static">是</p>
                                </c:if>
                                <c:if test="${subject.subjectIsInvestDiscount == 0}">
                                     <p class="form-control-static">否</p>
                                </c:if>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">优惠金额：</label>
                            <div class="col-md-8">
                                <c:if test="${subject.subjectIsInvestDiscount == 1}">
                                     <p class="form-control-static">${subject.discountNum}</p>
                                </c:if>
                                <c:if test="${subject.subjectIsInvestDiscount == 0}">
                                     <p class="form-control-static">无</p>
                                </c:if>
                            </div>
                        </div>
                            
                            <div class="form-group">
		                        <label class="col-md-2 control-label">标的相关资料：</label>
		                        <div class="col-md-8">
		                        	<c:forEach items="${protocolList }" var="protocol">
		                        		<span>${protocol.protocolName }</span>
			                            <button class="btn btn-default btn-primary" type="button" onclick="window.location.href='${basePath}cms/project/downloadFile.action?fileName=${protocol.protocolAddress}'">下载文件</button>
			                            <br>
			                            <br>
		                        	</c:forEach>
		                        </div>
		                    </div>
                            
                            <div class="form-group">
                                <label class="col-md-2 control-label">投资前，用户观看标的协议：</label>
                                <div class="col-md-10">
                                      <span class=""><a class="btn btn-success" onclick="watchprotemp()">点击预览</a></span>
                                      <span class="stat">${purchaseAgree.purchaseAgreeName }</span>
                                      <input type="hidden" id="subjectId" value="${subject.subjectId }">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 control-label">投资后，用于生成协议的模板（含文本域）：</label>
                                <div class="col-md-10">
                                      <span class=""><a class="btn btn-success" onclick="watchtemplate()">点击预览</a></span>
                                      <span class="stat">${purchaseAgree.purchaseAgreeTemplateName }</span>
                                      <input type="hidden" id="" value="">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-8">
                                    <div class="center-box">
                                        <input type="hidden" id="subjectId" value="${subject.subjectId }">
                                        <input type="hidden" id="flag" value="${flag }">
                                        <button type="button" class="btn btn-success dialog">审核通过</button>
                                        <button type="button" class="btn btn-info dialog2">驳回</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
	<!-- Modal -->
	<div id="myModal" class="none">
		<div class="dialogtit">驳回理由</div>
	    <form method="post" action="cms/subject/reject.action" style="height:89px;">
            <textarea class="form-control" name="feedback" style="margin-top:10px;margin-bottom:10px;height:89px;resize:none;" placeholder="请输入驳回理由...... "></textarea>
            <input type="hidden" name="subjectId" value="${subject.subjectId}"/>
            <input type="hidden" name="flag" value="${flag }">
            <input type="hidden" name="type" value="5">
            <br/>
	    </form>
    </div>

    
    <div class="modal fade bs-example-modal-lg" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">标的协议</h4>
          </div>
          <div class="modal-body">
          	 
          	 ${subject.subjectProtemp }
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
          </div>
        </div>
      </div>
    </div>


    <script>
    $(document).ready(function() {
    	$('.dialog').click(function(){
    		$.confirm('确定审核通过？',[{yes:"确定"},{no:'取消'}],function(type,e){
				if(type=='yes'){
					var subjectId = $('#subjectId').val();
			    	var flag = $('#flag').val();
			    	if(flag==1){
			    		$.ajax({
			    		    type:"post",
			    		    url:"cms/subject/getState.action",
			    		    dataType:"json",
			    		    data:{'subjectId':subjectId},
			    		    success:function(data){
			    		 	   if(data.state==0){
			    		 		  $.isLoading.show("请稍后。。。。。。。。",true);
			    		 		  window.location.href = "${basePath}cms/subject/auditing.action?subjectId="+subjectId;
			    		 	   }else{
			    		 		  $.alert("状态异常，返回列表页中。。。。",null,function(){
	                        			location.href='${basePath}cms/subject/list.action?state=0';
	                                })
			    		 	   }
			    		    }
			    		})
			    	}
			    	if(flag==2){
			    		$.ajax({
			    		    type:"post",
			    		    url:"cms/subject/getState.action",
			    		    dataType:"json",
			    		    data:{'subjectId':subjectId},
			    		    success:function(data){
			    		 	   if(data.state==9){
			    		 		  $.isLoading.show("请稍后。。。。。。。。",true);
			    		 		  window.location.href = "${basePath}cms/subject/SecAuditing.action?subjectId="+subjectId;
			    		 	   }else{
			    		 		  $.alert("状态异常，返回列表页中。。。。",null,function(){
	                        			location.href='${basePath}cms/subject/list.action?state=9';
	                                })
			    		 	   }
			    		    }
			    		})
			    	}
		        }
		        this.hide();
		    });	
    	})
    	$('.dialog2').click(function(){
    		$.confirm($('#myModal').html(),[{yes:"提交"},{no:'取消'}],function(type,e){
				if(type=='yes'){
					var textareaHtml=e.find('textarea').val();
					if(textareaHtml=="" || null == textareaHtml ){
						$.alert("请输入驳回理由");
					}else{
						var subjectId = $('#subjectId').val();
						var flag = $('#flag').val();
						if(flag==1){
				    		$.ajax({
				    		    type:"post",
				    		    url:"cms/subject/getState.action",
				    		    dataType:"json",
				    		    data:{'subjectId':subjectId},
				    		    success:function(data){
				    		 	   if(data.state==0){
				    		 		  e.find('form').submit()
				    		 	   }else{
				    		 		  $.alert("状态异常，返回列表页中。。。。",null,function(){
		                        			location.href='${basePath}cms/subject/list.action?state=0';
		                                })
				    		 	   }
				    		    }
				    		})
				    	}
						if(flag==2){
				    		$.ajax({
				    		    type:"post",
				    		    url:"cms/subject/getState.action",
				    		    dataType:"json",
				    		    data:{'subjectId':subjectId},
				    		    success:function(data){
				    		 	   if(data.state==9){
				    		 		  e.find('form').submit()
				    		 	   }else{
				    		 		  $.alert("状态异常，返回列表页中。。。。",null,function(){
		                        			location.href='${basePath}cms/subject/list.action?state=9';
		                                })
				    		 	   }
				    		    }
				    		})
				    	}
					}
		        }
		        this.hide();
		    });	
    	})
    	$("#collapseExample2").collapse('show'); 
    });
    
    function uploadFile() { 
    	$("#pinstructions").click(); 
    }; 
    
    function addFileNameToInput(){
    	$.alert($("#pinstructions").val());
    }

        function changeOr(){
        	$("#collapseExample2").collapse('hide');
        	$('#subjectName').val("");
        	$('#money').val("");
        	$('#minmoney').val("");
        	var originatorId = $('#originator').val();
        	var str = "oId="+originatorId;
        	$.ajax({
	                type:"post",
	                url:"cms/project/opList.action",
	                dataType:"json",
	                data:str,
	                success:function(data){
	                	$('#changetitle').empty();
	                	var htmls = "";
	                	htmls  = htmls + "<option value='0'>请选择</option>";
	                	$('#changetitle').append(htmls);
	                    $.each(data.list, function(i, d) {
	                        var html = "";
	                        html = html + "<option value='"+d.projectId+"'>"+d.projectName+"</option>";
	                        $('#changetitle').append(html);
	                    })	
	                }
	            })
        }
        function titles(){
        	var projectId = $('#changetitle').val();
        	var str = "projectId="+projectId;
        	$.ajax({
                type:"post",
                url:"cms/project/choosepro.action",
                dataType:"json",
                data:str,
                success:function(data){
                	$('#xmze').text(data.getmoney);
                	$('#mjxx').text(data.getmoneylimit);
                	$('#syed').text(data.getsurplusmoney);
                	if(data.projectFinancingType==1){
                		$('#rzlx').text("长期融资");
                	}else{
                		$('#rzlx').text("短期融资");
                	}
                	$('#rzqx').text(data.projectFinancingTerm+"个月");
                	$('#subjectFinancingPeriod').val(data.projectFinancingTerm);
                	if(data.projectPaymentMethod==1){
                		$('#fxfs').text("固定日期");
                	}else{
                		$('#fxfs').text("按周期递推(满标放款后固定周期)");
                	}
                }
            })
        }
        
        $("input[name=subjectPaymentMethod]").click(function(){
			  if(this.value == 1){
			 	  $('#showMsg').html("标的启动前约定还息日期");
			 	  $('.guding').show();
			 	  $('#zhouqi').hide();
			 	 $('#subjectPaymentCycle').val(1);
			  }else{
				  $('#showMsg').html("根据用户投资后，满标审核通过作为起始节点，按固定周期递推");
				  $('.guding').hide();
				  $('#zhouqi').show();
				  $('#subjectPaymentCycle').val("");
			  }
		  });
		
        
        
		 function huanxi(obj){
			 if(obj.value == 0){
				 $('#subjectPaymentMethodType').val(1);
			 }else if(obj.value == -1){
				 $('#subjectPaymentMethodType').val(2);
			 }else if(obj.val == 2){
				 $('#subjectPaymentMethodType').val(3);
			 }else{
				 $('#subjectPaymentCycle').val(obj.value);
				 $('#subjectPaymentMethodType').val(0);
			 }
		 }
        
        function uploadFile() { 
        	$("#pinstructions").click(); 
        }; 
        
        function addAnnualized(){
        	var html = "";
        	html = html + "<div class='row tables-btn-box'><div class='col-md-1'></div><div class='col-md-1'><span class='' >默认年化收益率：</span></div><div class='col-md-1'><input type='text'  class='form-control'  name='SARmin' required placeholder='最小额度' ></div><div class='col-md-1'><span style='line-height: 34px' >-</span></div><div class='col-md-1'><input type='text'  class='form-control' name='SARmax' required placeholder='最大额度' ></div><div class='col-md-1'><input type='text' class='form-control' name='SARrate' required placeholder='年化收益率' ></div><div class='' ><span style='line-height: 34px' >%</span></div></div><br />"
         $('#inserts').after(html);
        }
        function watchprotemp(){
        	var purchaseUrl = "${purchaseAgree.purchaseAgreeAddress}";
        	window.open(purchaseUrl);      	
        }
        function watchtemplate(){
        	var purchaseUrl = "${purchaseAgree.purchaseAgreeTemplateAddress}";
        	window.open(purchaseUrl);      	
        }
        function addFileNameToInput(){
        	$.alert($("#pinstructions").val());
        }
		function cancelzdy(){
			$("#zdy").remove(); 
		}
    </script>
</body>
</html>