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
                    <li class="active">满标审核</li>
                </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <form action="cms/subject/update.action" method="post" enctype="multipart/form-data" class="form-horizontal">

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
                                <div class="col-md-2">
                                    <p class="form-control-static">
                                        <span data-tofixed>${subject.subjectAdditionalMultiple }</span> 元
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
                                        <c:if test="${ischannel == 2 }">
                                            <span class="">是(无渠道)</span>
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
                                    <a class="btn btn-success" onclick="watchprotemp()">点击预览</a>
                                    <span class="stat">${purchaseAgree.purchaseAgreeName }</span>
                                    <input type="hidden" id="subjectId" value="${subject.subjectId }">
                            </div>
                        </div>
                    
                    <!-- /.panel-heading -->
                    
                    
                     <div class="form-group">
                                <label class="col-md-2 control-label">标的投资情况：</label>
                                <div class="col-md-8">
                                	<div class="panel panel-default">
	                                	<div class="panel-heading clearfix ">
	                                		<label class="control-label pull-left">用户手机号：</label>
	                                		<input type="number" class="form-control  pull-left" name="phone" placeholder="请输入手机号" value="${userphone }" style="width:auto;margin-right:20px;" id="phone">
                                   			<a class="btn btn-info  pull-right" onclick="searchphone()">搜索</a>
	                                	</div>
	                                	<div class="panel-body">
	                                   		<table class="table table-striped table-bordered table-hover" style="margin:0 0 20px 0 !important;" >
                                        <thead>
                                            <tr>
                                                <th>用户ID</th>
                                                <th>手机号</th>
                                                <th>用户名称</th>
                                                <th>投资金额</th>
                                                <th>有效金额</th>
                                                <th>投标时间</th>
                                                <th>投资状态</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${InvestmentList }" var="investment">
                                            <tr class="odd gradeX">
                                                <td>${investment.investmentUserId }</td>
                                                <td>${investment.user.userPhone }</td>
                                                <td>${investment.user.userName }</td>
                                                <td>${investment.stringInvest }</td>
                                                <td>${investment.stringActualInvestment }</td>
                                                <td><fmt:formatDate value="${investment.investmentTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                <c:if test="${investment.investmentGatheringStatus==1 }">
                                                	<td>正在投标</td>
                                                </c:if>
                                                <c:if test="${investment.investmentGatheringStatus==2 }">
                                                	<td>正在收款</td>
                                                </c:if>
                                                <c:if test="${investment.investmentGatheringStatus==3 }">
                                                	<td>已收款完成</td>
                                                </c:if>
                                                <c:if test="${investment.investmentGatheringStatus==4 }">
                                                	<td>撤销投标</td>
                                                </c:if>
                                                <c:if test="${investment.investmentGatheringStatus==5 }">
                                                	<td>投标不通过</td>
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
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <input type="hidden" value="${pageIndex }" id="pageIndex"/>
                                    <div class="pull-left">当前显示第${pageIndex} / ${totalPage} 页</div>
                                    <div class="pull-right page-box" id="pagediv1" >
                                       <span onclick="pageChanged('first')">首页</span>
                                        <c:if test="${pageIndex > 1}">
                                       <span onclick="pageChanged('prev')">前一页</span>
                                       </c:if>
                                       <c:if test="${pageIndex < totalPage}">
                                       <span onclick="pageChanged('next')">后一页</span>
                                       </c:if>
                                       <span onclick="pageChanged('last')">尾页</span>
                                       <input type="number" style="width: 50px" id="myPage"/>
                                       <span id="myGo">GO</span>
                                    </div>
	                                   	</div>
                                	</div>
                                </div>
                            </div>


                            

                        <!-- /.panel-body -->
                        
                        <div class="form-group">
                            <label class="col-md-2 control-label">正式起息日：</label>
                            <div class="col-md-2">
                                <c:if test="${subject.subjectNodeInterest ==1 || subject.subjectNodeInterest ==5 || subject.subjectNodeInterest ==6 ||subject.subjectNodeInterest ==2}">
                                    <input class="form-control"  type="text" id="datetime"  required pattern="yyyy-MM-dd" />
                                </c:if>
<%--                                 <c:if test="${subject.subjectNodeInterest ==2 }"> --%>
<%--                                     <input class="form-control"  type="text" required pattern="yyyy-MM-dd" value="${numDayDate}" disabled="disabled"/> --%>
<%--                                 </c:if> --%>
                                <c:if test="${subject.subjectNodeInterest ==4 }">
                                    <input class="form-control"  type="text" id="datetime"  required pattern="yyyy-MM-dd" value="${nowDate}" disabled="disabled"/>
                                </c:if>  
                                <input type="hidden" name="nowDate" id="nowDate" value="${nowDate}">
                            </div>
                        </div>
                        <br>

                        <div class="form-group">
                            <label class="col-md-2 control-label"></label>
                            <div class="col-md-8">
                                <div class="center-box">
                                    <input type="hidden" id="subjectId" value="${subject.subjectId }">
                                    <button type="button" class="btn btn-info btn-save dialog">审核通过</button>
                                    <button type="button" class="btn btn-info dialog2">驳回</button>
                                </div>
                            </div>
                        </div>
                    </form>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->


	<div id="myModal" class="none">
		<div class="dialogtit">驳回理由</div>
	    <form method="post" action="cms/subject/reject.action" style="height:89px;">
            <textarea class="form-control" name="feedback" style="margin-top:10px;margin-bottom:10px;height:89px;resize:none;" placeholder="请输入驳回理由...... "></textarea>
            <input type="hidden" name="subjectId" value="${subject.subjectId}"/>
            <input type="hidden" name="type" value="6">
            <br/>
	    </form>
    </div>
    

    <!-- /#wrapper -->
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
    		var subjectInterest = ${subject.subjectNodeInterest};
			var subjectId = $('#subjectId').val();
			var fullsuccessauditingTime = "";
			if(subjectInterest ==1 || subjectInterest ==5 || subjectInterest ==6 || subjectInterest ==2){
				fullsuccessauditingTime = $('#datetime').val();
			}else{
				fullsuccessauditingTime = $('#nowDate').val();
			}
    		$.confirm('${subject.subjectName }<br>正式起息日为<b style="color:red;">'+fullsuccessauditingTime+'</b><br>确定审核通过吗？',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
					
			        if("" == fullsuccessauditingTime){
			        	$.alert("正式起息日不能为空！");
			        }else{
			        	
			        	$.ajax({
							url:"cms/subject/getState.action",
					        dataType:"json",
					        data:{'subjectId':subjectId},
	                        success:function(data){
	                        	if(data.state==2){
	                        		$.isLoading.show("请稍后。。。。。。。。",true);
	                        		$.ajax({
	            			    		url:'cms/subject/fullauditingNew.action',
	            			    		type:'post',
	            			    		data:{subjectId:subjectId,fullsuccessauditingTime:fullsuccessauditingTime},
	            			    		success:function(data){
	            			    			if(data.message == 'success'){
	            			    			
	            			    			}else{
	            			    				$.isLoading.hide();
	            			    				$.alert(data.msg);
	            			    			}
	            			    		}
	            			    	});
	                        	}else{
	                        		$.alert("状态异常，返回列表页中。。。。",null,function(){
	                        			location.href='${basePath}cms/subject/list.action?state=2';
	                                })
	                        	}
	                        }
	                    });
			        }
		        }
		        this.hide();
		    });
    	})
    	$('.dialog2').click(function(){
    		var subjectId = $('#subjectId').val();
    		$.confirm($('#myModal').html(),[{yes:"提交"},{no:'取消'}],function(type,e){
				if(type=='yes'){
					var textareaHtml=e.find('textarea').val();
					if(textareaHtml=="" || null == textareaHtml ){
						$.alert("请输入驳回理由");
					}else{
						$.ajax({
							url:"cms/subject/getState.action",
					        dataType:"json",
					        data:{'subjectId':subjectId},
	                        success:function(data){
	                        	if(data.state==2){
	                        		e.find('form').submit()
	                        	}else{
	                        		$.alert("状态异常，返回列表页中。。。。",null,function(){
	                        			location.href='${basePath}cms/subject/list.action?state=2';
	                                })
	                        	}
	                        }
	                    });
					}
		        }
		        this.hide();
		    });	
    	})

    	$("#collapseExample2").collapse('show');
        $('#changetitle').change(function(){
        	var change =  $('#changetitle').val();
        	if(change!=0){
        		 $("#collapseExample2").collapse('show'); 
        	}else{
        		$("#collapseExample2").collapse('hide');
        	}
        })
    $('#datetime').datepicker({
    	dateFormat: 'yy-mm-dd',
    	changeYear: true,
    	changeMonth: true,
    	yearRange:'-100:+100',
    });
    $('#myGo').click(function(){
    	var totalPage = ${totalPage};
    	if(1<=$('#myPage').val()&& $('#myPage').val()<=Number(totalPage)){
    		window.location.href = "${basePath}cms/subject/fullauditingJsp.action?pageIndex=" + $('#myPage').val() +"&subjectId="+$('#subjectId').val() + "&phone="+$("#phone").val() ;
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
    	window.location.href = "${basePath}cms/subject/fullauditingJsp.action?pageIndex=" + pageNo +"&subjectId="+$('#subjectId').val() + "&phone="+$("#phone").val();
    }
    function watchprotemp(){
    	var purchaseUrl = "${purchaseAgree.purchaseAgreeAddress}";
    	window.open(purchaseUrl);   	
    }
    function reject(){
    	var subjectId = $('#subjectId').val();
    	 var str = "subjectId="+subjectId+"&flag=6";
       	$.ajax({
            type:"post",
            url:"cms/subject/changestate.action",
            dataType:"json",
            data:str,
            success:function(data){
         	   window.location.href = "${basePath}cms/subject/list.action?state=2";
            }
        })
    }
    function searchphone(){
    	var phone = $('#phone').val();
    	var subjectId = $('#subjectId').val();
    	window.location.href = "${basePath}cms/subject/fullauditingJsp.action?subjectId="+subjectId+"&phone="+phone;
    }
 function aupass(){
    	var subjectId = $('#subjectId').val();
        var fullsuccessauditingTime = $('#datetime').val();
        if(fullsuccessauditingTime!=""&&fullsuccessauditingTime!=null){
	    	window.location.href = "${basePath}cms/subject/fullauditing.action?subjectId="+subjectId+"&fullsuccessauditingTime="+fullsuccessauditingTime;
        }else{
        	$.alert("正式起息日不能为空！");
        }
    }    
    </script>
</body>
</html>