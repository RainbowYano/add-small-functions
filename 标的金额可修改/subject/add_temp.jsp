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
                    <li class="active">新增</li>
                </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="alert alert-warning" role="alert">请选择您要发标的对应项目</div>	
                    <form action="cms/subject/add.action" method="post" enctype="multipart/form-data" class="form-horizontal" onsubmit="return checkForm();">
                        <div class="form-group">
                            <label class="col-md-2 control-label">项目发起方：</label>
                            <div class="col-md-3">
                                <select  class="form-control" id="originator" onchange="changeOr()">
                                    <option value="0">请选择</option>
                                    <c:forEach items="${list }" var="originator">
                                            <option value="${originator.originatorId }" <c:if test="${orig.originatorId == originator.originatorId }">selected</c:if>>${originator.originatorName }</option>
                                    </c:forEach>
                                </select>
                             </div>
                        </div>
                        <br />

                        <div class="form-group">
                            <label class="col-md-2 control-label">项目标题：</label>
                            <div class="col-md-3">
                                <select  class="form-control" id="changetitle" name="subjectProjectId" onchange="titles()">
                                    <c:forEach items="${projectList }" var="project">
                                        <option value="${project.projectId }"<c:if test="${pro.projectId == project.projectId }">selected</c:if>>${project.projectName }</option>
                                    </c:forEach>
                                </select>
                             </div>
                        </div>
                        <br />
                         
                        <div class="collapse" id="collapseExample2">
                            <div class="clearfix">
                                <div class="panel panel-default col-md-8">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">项目总额：</label>
                                            <div class="col-md-2">
                                                <p class="form-control-static"><span class="" id="xmze"></span></p>
                                            </div>
                                            <label class="col-md-2 control-label">募集下限：</label>
                                            <div class="col-md-2">
                                                <p class="form-control-static"><span class="" id="mjxx"></span></p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">剩余额度：</label>
                                            <div class="col-md-8">
                                                <p class="form-control-static"><span class="text-info" id="syed"></span><input type="hidden" id="lastMoney"></p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">融资类型：</label>
                                            <div class="col-md-2">
                                                <p class="form-control-static"><span class="" id="rzlx"></span></p>
                                            </div>
                                            <label class="col-md-2 control-label">融资期限：</label>
                                            <div class="col-md-2">
                                                <p class="form-control-static"><span class="" id="rzqx"></span><input type="hidden" name="subjectFinancingPeriod" id="subjectFinancingPeriod"></p>
                                            </div>
                                        </div>
<!--                                         <div class="form-group"> -->
<!--                                             <label class="col-md-2 control-label">付息方式：</label> -->
<!--                                             <div class="col-md-8"> -->
<!--                                                 <p class="form-control-static"><span id="fxfs"></span></p> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 control-label">标的模板：</label>
                                <div class="col-md-3" >
                                <select class="form-control" name="Temp" id="Temp" onchange="checktemp()">
                                    <option value="0">未选择</option>
                                    <c:forEach items="${temps }" var="temp">
                                        <option value="${temp.subjectId }" <c:if test="${temp.subjectId==subject.subjectId }">selected</c:if>>${temp.subjectName }</option>
                                    </c:forEach>
                                </select>
                            </div>
                            </div>
                            <br />

                            <div class="form-group">
                                <label class="col-md-2 control-label">标的名称：</label>
                                <div class="col-md-3">
                                    <input type="text" id="subjectName" value="${subject.subjectName }" name="subjectName" class="form-control" required placeholder="标的名称" >
                                </div>
                                <div class="col-md-7 text-danger form-control-static">（首页推荐展示最大显示11个文字，超出隐藏）</div>
                            </div>
                            <br />

                            <div class="form-group">
                                <label class="col-md-2 control-label">期名称：</label>
                                <div class="col-md-3">
                                    <input type="text" id="subjectStageShowName" value="${subject.subjectStageShowName }" name="subjectStageShowName" class="form-control" required placeholder="期名称" >
                                    
                                </div>
                                <div class="col-md-7 text-danger form-control-static">（用于安存凭证中，存证项目名称展示为期名）</div>
                            </div>
                            <br />

                            <div class="form-group">
                                <label class="col-md-2 control-label">置顶号：</label>
                                <div class="col-md-3">
                                    <input type="text" id="subjectTop" name="subjectTop" value="${subject.subjectTop }" class="form-control"  placeholder="标的置顶号" >
                                </div>
                            </div>
                            <br />

                            <div class="form-group" id="moneyparent">
                                <label class="col-md-2 control-label">标的金额：</label>
                                <div class="col-md-3">
                                	<div class="input-group">
	                                    <input type="text" id="money" name="subjectMoney" data-tofixed value="${subject.subjectMoney }" class="form-control" required placeholder="标的金额" onblur="checkMoney()" data-money-ToUpper>
	                                    <div class="input-group-addon">元</div>
                                   	</div>
                                <span id="checkmoney"></span>
                                </div>
                            </div>
                            <br />

                            <div class="form-group">
                                <label class="col-md-2 control-label">最小认购额度：</label>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <input type="text" id="minmoney" data-tofixed value="${subject.subjectSubscriptionAmountMin }" name="SARmin" class="form-control" required placeholder="最小认购额度" data-money-ToUpper>
                                        <div class="input-group-addon">元</div>
                                    </div>
                                </div>
                            </div>
                            <br />

                            <div class="form-group">
                                <label class="col-md-2 control-label">最大认购额度：</label>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <input type="text" id="maxmoney" data-tofixed name="SARmax" value="${subject.subjectSubscriptionAmountMax }" class="form-control" required placeholder="最大认购额度" data-money-ToUpper>
                                        <div class="input-group-addon">元</div>
                                    </div>
                                </div>
                            </div>
                            <br />

                            <div class="form-group">
                                <label class="col-md-2 control-label">递增金额：</label>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <input type="text" id="subjectAdditionalMultiple" name="subjectAdditionalMultiple" value="${subject.subjectAdditionalMultiple }" class="form-control" required data-money-ToUpper>
                                        <div class="input-group-addon">元</div>
                                    </div>
                                    <p class="form-control-static text-warning">
	                                    <i class="fa fa-info-circle fa-fw"></i> <span> 在最小认购额度基础上，每次递增的额度为递增金额</span>
	                                </p>
                                </div>
                            </div>
                            <br />

                            <div class="form-group">
                                <label class="col-md-2 control-label">付息方式：</label>
                                <div class="col-md-3">
                                    <div class="radio">
                                        <label>
                                        <input type="radio" name="subjectPaymentMethod" value="1" <c:if test="${subject.subjectPaymentMethod == 1 }">checked="checked"</c:if>>固定日期还息方式
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                        <input type="radio" name="subjectPaymentMethod" value="2" <c:if test="${subject.subjectPaymentMethod == 2 }">checked="checked"</c:if>>按周期递推还息方式
                                        </label>
                                    </div>
                                </div>
                                <p class="col-md-5 form-control-static text-warning">
                                    <i class="fa fa-info-circle fa-fw"></i> <span id="showMsg">项目启动前约定还息日期</span>
                                </p>
                            </div>
                            <br />

                            <div class="form-group" id="hxyf">
                                <label class="col-md-2 control-label">还息月份：</label>
                                <div class="col-md-3">
                                    <select class="form-control" name="incomeWay"  onchange="huanxi(this)">
                                        <option value="1" <c:if test="${subject.subjectPaymentMethodType==0 && subject.subjectPaymentCycle==1  }">selected</c:if>>按月付息</option>
                                        <option value="0" <c:if test="${subject.subjectPaymentMethodType==1  }">selected</c:if>>按自然季度付息</option>
                                        <option value="2" <c:if test="${subject.subjectPaymentMethodType==3  }">selected</c:if>>按自然半年度付息</option>
                                        <option value="3" <c:if test="${subject.subjectPaymentMethodType==0 && subject.subjectPaymentCycle==3  }">selected</c:if>>按季度付息</option>
                                        <option value="6" <c:if test="${subject.subjectPaymentMethodType==0 && subject.subjectPaymentCycle==6  }">selected</c:if>>按半年度付息</option>
                                        <option value="12" <c:if test="${subject.subjectPaymentMethodType==0 && subject.subjectPaymentCycle==12  }">selected</c:if>>按年付息</option>
                                    </select>
                                    <input type="hidden" id="subjectPaymentMethodType" name="subjectPaymentMethodType" value="0"/>
                                    <input type="hidden" id="subjectType" value="${subject.subjectType }" name="subjectType" />
                                </div>
                            </div>
                            <br />

                            <div class="form-group <c:if test="${subject.subjectPaymentMethod == 2 }">none</c:if> guding" >
                                <label class="col-md-2 control-label">还息日：</label>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <input type="text"  onblur="this.value=this.value.replace(/[^\d]/g,'')" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"  class="form-control" name="subjectPaymentDay" value="${subject.subjectPaymentDay }"  placeholder="还息日" >
                                        <div class="input-group-addon">日</div>
                                    </div>
                                </div>
                            </div>
                            <br />

                            <div class="form-group">
                                <label class="col-md-2 control-label">产品类型：</label>
                                <div class="col-md-3">
                                    <select  class="form-control" name="typechange" id="typechange">
                                        <option value="0" <c:if test="${isuser==0 }">selected</c:if>>普通标</option>
                                        <option value="1" <c:if test="${isuser==1 }">selected</c:if>>用户组专享标</option>
                                    </select>
                                </div>
                            </div>
                            <br/>

                            <div class="collapse" id="collapseExample3">
                                <div class="form-group">
                                    <label class="col-md-2 control-label"></label>
                                    <div class="col-md-4 well">
                                        <c:forEach items="${groupList }" var="usergroup">
                                        <div class="col-md-6">
                                            <div class="checkbox">
                                                <label>
                                                <input type="checkbox" <c:if test="${usergroup.ischeck == 1 }">checked="checked"</c:if>  name="types" value="${usergroup.userGroupId }">${usergroup.userGroupName }
                                                </label>
                                            </div>
                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 control-label">渠道定向项目：</label>
                                <div class="col-md-3">
                                    <div class="radio">
                                        <label>
                                        <input type="radio" name="checks" <c:if test="${ischannel==1 }">checked="checked"</c:if> id="checkyes" >是
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                        <input type="radio" name="checks" <c:if test="${ischannel==0 }">checked="checked"</c:if> id="checkno">否
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <br/>

                            <div class="collapse" id="collapseExample1">
                                <div class="form-group">
                                    <label class="col-md-2 control-label"></label>
                                    <div class="col-md-4 well">
                                        <c:forEach items="${channelList }" var="channel">
                                            <div class="col-md-6">
                                                <div class="checkbox">
                                                    <label>
                                                    <input type="checkbox" <c:if test="${channel.ischeck == 1 }">checked="checked"</c:if> name="pro" value="${channel.channelId }">
                                                    ${channel.channelName }
                                                    </label>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 control-label">起息节点：</label>
                                <div class="col-md-3">
                                    <div class="radio">
                                        <label>
                                        <input type="radio" name="subjectNodeInterest" <c:if test="${subject.subjectNodeInterest==1 }">checked="checked"</c:if> value="1" id="">T+N工作日起息
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                        <input type="radio" name="subjectNodeInterest" <c:if test="${subject.subjectNodeInterest==4 }">checked="checked"</c:if> value="4" id="">T+N起息
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                        <input type="radio" name="subjectNodeInterest" <c:if test="${subject.subjectNodeInterest==2 }">checked="checked"</c:if> value="2" id="">满标审核后N日起息
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                        <input type="radio" name="subjectNodeInterest" <c:if test="${subject.subjectNodeInterest==3 }">checked="checked"</c:if> value="3" id="">项目集满后N日起息
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                        <input type="radio" name="subjectNodeInterest" <c:if test="${subject.subjectNodeInterest==5 }">checked="checked"</c:if> value="5" id="">T+0工作日起息(分段贴息M个工作日)
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                        <input type="radio" name="subjectNodeInterest" <c:if test="${subject.subjectNodeInterest==6 }">checked="checked"</c:if> value="6" id="">T+0起息(分段贴息M天)
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <br/>

                            <div class="form-group <c:if test='${subject.subjectNodeInterest==5 || subject.subjectNodeInterest==6}'>none</c:if>" id="NDay">
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-4 well">
                                    <div class="input-group col-md-6">
                                        
                                        <div class="input-group-addon">N=</div>
                                        <input type="text" id="subjectNumOfDays" onblur="this.value=this.value.replace(/[^\d]/g,'')" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" value="${subject.subjectNumOfDays }" name="subjectNumOfDays" class="form-control"  >
                                        <div class="input-group-addon">天</div>
                                    </div>
                                </div>
                            </div>
								
							<div class="form-group <c:if test='${subject.subjectNodeInterest==1 || subject.subjectNodeInterest==2|| subject.subjectNodeInterest==3|| subject.subjectNodeInterest==4}'>none</c:if>" id="MDay">
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-4 well">
                                    <div class="input-group col-md-6">
                                        
                                        <div class="input-group-addon">M=</div>
                                        <input type="text" id="subjectFirDiscDay" onblur="this.value=this.value.replace(/[^\d]/g,'')" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" value="${subject.subjectFirDiscDay }"  name="subjectFirDiscDay" class="form-control"  >
                                        <div class="input-group-addon">天</div>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            
                            <c:forEach items="${arList }" var="ar">
                            <div class="form-group">
                                <label class="col-md-2 control-label">默认年化收益率：</label>
                                <div class="col-md-2">
                                    <div class="input-group">
                                        <input type="text" class="form-control" value="${ar.annualizedReturnBaserate }" data-tofixed onblur="rule.onlyNonNegative(this)" onkeyup="rule.onlyNonNegative(this)"   id ="baseRate" name="baseRate" required placeholder="基础年化收益率" >
                                        <div class="input-group-addon">%</div>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            
                            <div class="form-group">
                                <label class="col-md-2 control-label">加息率：</label>
                                <div class="col-md-2">
                                    <div class="input-group">
                                        <input type="text" class="form-control" value="${ar.annualizedReturnAddRate }" data-tofixed onblur="rule.onlyNonNegative(this)" onkeyup="rule.onlyNonNegative(this)"   id ="addRate" name="addRate"  placeholder="加息率" >
                                        <div class="input-group-addon">%</div>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            </c:forEach>

                            <input type="hidden" id="inserts">

                            <div class="form-group <c:if test='${subject.subjectNodeInterest==5 || subject.subjectNodeInterest==6}'>none</c:if>"  id="DRate">
                                <label class="col-md-2 control-label">贴息利率：</label>
                                <div class="col-md-3">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="subjectDiscountRate" value="1" id="" onclick="cancelzdy()"<c:if test="${subject.subjectDiscountRate==1 }">checked="checked"</c:if>>按照投资利率贴息
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                        <input type="radio" name="subjectDiscountRate" value="2" onclick="zdylv()" <c:if test="${subject.subjectDiscountRate==2 }">checked="checked"</c:if>>自定义贴息利率
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group <c:if test='${subject.subjectNodeInterest==1 || subject.subjectNodeInterest==2|| subject.subjectNodeInterest==3|| subject.subjectNodeInterest==4}'>none</c:if>" id="MRate">
                                	<label class="col-md-2 control-label">贴息利率：</label>
                                	<div class="col-md-8 inline-box well">
                                		<div class="inline-box-li clearfix">
	                                		<span id="Mtext1">
	                                			<c:if test="${subject.subjectNodeInterest==5 }">
		                                			M（含）个工作日内贴息利率：
	                                			</c:if>
	                                			<c:if test="${subject.subjectNodeInterest==6 }">
		                                			M（含）天内贴息利率：
	                                			</c:if>
											</span>
	                                		<div class="input-group col-md-4">
			                                	<input type="text" name="subjectFirDiscRate" data-tofixed value="${subject.subjectFirDiscRate }" id="subjectFirDiscRate" onblur="rule.onlyNonNegative(this)" onkeyup="rule.onlyNonNegative(this)" class="form-control" placeholder="">
			                                	<div class="input-group-addon">
			                                		%
			                                	</div>
		                                	</div>
		                                	<span id="Mtext2">
		                                		<c:if test="${subject.subjectNodeInterest==5 }">
		                                			M个工作日后贴息利率：
	                                			</c:if>
	                                			<c:if test="${subject.subjectNodeInterest==6 }">
		                                			M天后贴息利率：
	                                			</c:if>
		                                	</span>
		                                	<div class="input-group col-md-4">
			                                	<input type="text" id="discountRate" name="discountRate" data-tofixed value="${subject.subjectCustomDiscountRate*100 }" onblur="rule.onlyNonNegative(this)" onkeyup="rule.onlyNonNegative(this)" class="form-control"  placeholder="">
			                                	<div class="input-group-addon">
			                                		%
			                                	</div>
		                                	</div>
		                                	<br>
		                                	<span class="inline-label">贴息说明：</span>
		                                	<select class="form-control pull-left" name="subjectDiscountExplain" id="subjectDiscountExplain" style="width:100px;margin-right:15px">
		                                		<option value="0"<c:if test="${subject.subjectDiscountExplain == null || subject.subjectDiscountExplain == 0 }">selected</c:if>>无</option>
		                                		<option value="1"<c:if test="${subject.subjectDiscountExplain == 1 }">selected</c:if>>活期</option>
		                                		<option value="2"<c:if test="${subject.subjectDiscountExplain == 2 }">selected</c:if>>定期</option>
		                                	</select>
		                                	<span class="inline-label" id="subjectExplain">
		                                		<c:if test="${subject.subjectDiscountExplain == 1 }">按人民银行活期利率贴息</c:if>
		                                		<c:if test="${subject.subjectDiscountExplain == 2 }">按人民银行定期利率贴息</c:if>
		                                	</span>
	                                	</div>
                                	</div>
                               	</div>

                           	<input type="hidden" id="zdy1">
                           	<br>
                           	
                            <div class="form-group" id="DRate">
                                <label class="col-md-2 control-label">是否有优惠金额：</label>
                                <div class="col-md-3" >
                                    <input type="hidden" id="investDiscount" name="investDiscount" value="${subject.subjectIsInvestDiscount}">
                                    <input type="hidden" id="investDiscountNum" name="investDiscountNum" value="${subject.subjectInvestDiscountNum}">
                                    <div class="radio">
                                        <label>
                                        <input type="radio" name="subjectIsInvestDiscount" value="1" id="" onclick="discount()" <c:if test="${subject.subjectIsInvestDiscount == 1 }">checked="checked"</c:if>>是
                                        </label>
                                    </div>
                                    <div class="radio"> 
                                        <label>
                                        <input type="radio" name="subjectIsInvestDiscount" value="0" onclick="cancelDiscount()" <c:if test="${subject.subjectIsInvestDiscount == 0 }">checked="checked"</c:if>>否
                                        </label>
                                    </div>
                                </div>
                            </div>
                            
                            <input type="hidden" id="discountInfo">
                            <br/>

                           	<div class="form-group <c:if test='${subject.subjectType == 2 }'>none</c:if>" id="isNew">
                              <label class="col-md-2 control-label">只能首次购买：</label>
                              <div class="col-md-3">
                                  <div class="radio">
                                      <label>
                                      <input type="radio" name="subjectIsNew" value="1" <c:if test="${subject.subjectIsNew == 1 }">checked="checked"</c:if>>是
                                      </label>
                                  </div>
                                  <div class="radio">
                                      <label>
                                      <input type="radio" name="subjectIsNew" value="0" <c:if test="${subject.subjectIsNew == 0 }">checked="checked"</c:if>>否
                                      </label>
                                  </div>
                              </div>
                          </div>
                          <br/>
                           	
                           	<div class="form-group">
					        <label class="col-md-2 control-label">项目相关资料：</label>
					        <div class="col-md-8">
					        	<span class="p-inputfile ">
					        		
                                </span>
                            </div>
					      </div>
                          <br/>
                            
                            <div class="form-group">
						        <label class="col-md-2 control-label">标的相关资料：</label>
						        <div class="col-md-8">
						        	<div class="panel panel-default">
							        	<div class="panel-heading clearfix ">
							        		<button class="btn btn-default btn-success btn-sm addbtn" type="button"  onclick="file.addNode($('.inputfileli:last'))">添加</button>
							        	</div>
							        	<div class="panel-body">
							        		<div>原有文件:</div>
								        	 <c:forEach items="${protocolList }" var="protocol">
								        		<div class="fileli">
										        	<span class="inputfile">
					                                	<button class="btn btn-default btn-info" type="button" onclick="window.location.href='${basePath}cms/project/downloadFile.action?fileName=${protocol.protocolAddress}'">下载</button>
			                        					<span>${protocol.protocolName }</span>
					                                	<input type="file" name="pinstructions"	style="display:none"/>
				                                	</span>
					                                	<input type="hidden" name="proId" value="${protocol.protocolId }">
				                                	<button class="btn btn-default btn-danger btn-xs" type="button" id="firstnode" style="font-size:14px; margin-left:20px;" onclick="file.subNode($(this),true)">-</button>
			                                	</div>
		                                	</c:forEach>
		                                	<div>新增文件:</div>
							        		<div class="inputfileli">
									        	<span class="inputfile">
				                                	<button class="btn btn-default btn-primary" type="button"  onclick="file.init($(this))">上传产品说明书（pdf或word格式）</button>
				                                	<input type="file" name="pinstructions"	style="display:none"/>
			                                	</span>
			                                	<button class="btn btn-default btn-danger btn-xs" type="button" id="firstnode" style="font-size:14px; margin-left:20px;" onclick="file.subNode($(this))">-</button>
		                                	</div>
							        		
							        		
		                                	
							        	</div>
			
	                                </div>
	                            </div>
						      </div>
	                          <br/>

							<div class="form-group">
                                <label class="col-md-2 control-label">投资前，用户观看标的协议：</label>
                                <div class="col-md-8">
						        	<span class="inputfile">
	                                	<button class="btn btn-default btn-primary" type="button"  onclick="file.init($(this))">上传文件（pdf格式）</button>
	                                	<input type="file" name="pfile" id="pfile"	style="display:none"/>
	                                	<input type="hidden" name="purId" value="${purchaseAgree.purchaseAgreeId }">
	                                	<span class="stat" id="purchaseAgreeName">${purchaseAgree.purchaseAgreeName }</span>
                                	</span>
                                
                                
<!--                                 	<div class="panel panel-default"> -->
<!-- 	                                	<div class="panel-heading clearfix "> -->
<!-- 	                                		<label class="control-label pull-left">标的购买协议模板：</label> -->
<!-- 	                                		<select class="form-control pull-left" style="min-width:50px;margin-right:20px;width:auto;" id="protempChange"> -->
<!-- 	                                			<option value="0">未选择模板</option> -->
<%-- 	                                			<c:forEach items="${protemList }" var="protem"> --%>
<%-- 	                                				<option value="${protem.protemId }">${protem.protemName }</option> --%>
<%-- 	                                			</c:forEach> --%>
<!-- 	                                		</select>  -->
<!-- 	                                		<label class="control-label pull-left">标的购买协议名：</label> -->
<!-- 	                                		<input type="text" class="form-control  pull-left" placeholder="请输入协议名称" style="width:auto;margin-right:20px;" id="protempName"> -->
<!-- 	                                		<label  class="control-label pull-left">占位符：用户名<span style="color: red">【name】</span>身份证<span style="color: red">【card】</span>手机号<span style="color: red">【phone】</span></label> -->
<!--                                    			<a class="btn btn-info  pull-right dialog">保存</a> -->
<!-- 	                                	</div> -->
<!-- 	                                	<div class="panel-body"> -->
<!-- 	                                   		<script id="editor" type="text/plain" name="subjectProtemp" style="height:400px;"></script> -->
<!-- 	                                   	</div> -->
<!--                                 	</div> -->
                                </div>
                            </div>
							
							<div class="form-group">
                                <label class="col-md-2 control-label">投资后，用于生成协议的模板（含文本域）：</label>
                                <div class="col-md-8">
						        	<span class="inputfile">
	                                	<button class="btn btn-default btn-primary" type="button"  onclick="file.init($(this))">上传模板文件（pdf格式）</button>
	                                	<input type="file" name="tempaltefile" id="tempaltefile"	style="display:none"/>
	                                	<span class="stat" id="purchaseAgreeName">${purchaseAgree.purchaseAgreeTemplateName }</span>
                                	</span>
                           		</div>
                           	</div>

                           	<div class="form-group">
                                <label class="col-md-2 control-label">文本域：</label>
                                <div class="col-md-8">
                                    <p class="form-control-static">
                                                                                                                                        用户姓名：name,name1,name2；投资时间：time；身份证号：id；大写金额：bigmoney；小写金额：smallmoney；合同编号：num；
                                    </p>
                                </div>
                            </div>
                            
                 
                            <div class="form-group">
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-8">
                                    <div class="center-box">
                                        <button type="submit" class="btn btn-info btn-save" >保存标的信息</button>
                                        <button type="button" onclick="template()" class="btn btn-warning btn-save" >保存标的信息并设为模板</button>
                                        <input type="submit" id="Templatesubmit" style="display: none">
                                        <input type="hidden" name="subjectIsTemplate" id="subjectIsTemplate" value="0">
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


	<script type="text/javascript" charset="utf-8" src="js/cms/dist/js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/cms/dist/js/ueditor/ueditor.all.min.js"></script>
    <script>
    var ue = UE.getEditor('editor');
    
    ue.ready(function() {
    	var str='${subject.subjectProtemp}';
        ue.setContent(str);
    });
    $(document).ready(function() {
    	$('input[name="subjectNodeInterest"]').click(function(){
    		var interst = $('input[name="subjectNodeInterest"]:checked').val();
    		if(interst ==6 || interst == 5){
    			if(interst == 6){
    				$('#Mtext1').html("M（含）天内贴息利率：");
    				$('#Mtext2').html("M天后贴息利率：");
    			}else{
    				$('#Mtext1').html("M（含）个工作日内贴息利率：");
    				$('#Mtext2').html("M个工作日后贴息利率：");
    			}
    			$('#NDay').hide();
    			$('#MDay').show();
    			$('#subjectNumOfDays').val("");
    			$('#DRate').hide();
    			$('#MRate').show();
    			cancelzdy()
    			$('#discountRate').removeAttr("disabled");
    		}else{
    			$('#MDay').hide();
    			$('#NDay').show();
    			$('#subjectFirDiscDay').val("");
    			$('#DRate').show();
    			$('#MRate').hide();
    			$('#discountRate').attr("disabled",true);
    		}
    	})

        var investDiscount = $('#investDiscount').val();
        var investDiscountNum = $('#investDiscountNum').val();
        if (investDiscount == 1) {
           var html = "";
            html = html + '<div class="form-group" id="discountIn">'+
                            '<label class="col-md-2 control-label"></label>'+
                            '<div class="col-md-4 well">'+
                                '<div class="input-group col-md-4">'+
                                    '<input type="text" id="txlv" name="subjectInvestDiscountNum" onblur="rule.onlyNonNegative(this)" onkeyup="rule.onlyNonNegative(this)"  class="form-control" required placeholder="优惠金额" value="'+investDiscountNum+'">'+
                                    '<div class="input-group-addon">元</div>'+
                                '</div>'+
                            '</div>'+
                        '</div>';
            $('#discountInfo').after(html);
        };
        
    	titles();
    	//用户标还是普通标
    	var type = $('#typechange').val();
    	if(type != 0){
    		$("#collapseExample3").collapse('show');
    	}else{
    		$("#collapseExample3").collapse('hide');
    	}
    	//渠道是否定向
    	var ischannel = ${ischannel};
    	if(ischannel == 1){
    		$("#collapseExample1").collapse('show'); 
    	}
    	
    	
    	var ar = ${subject.subjectDiscountRate}
    	if(ar == 2){
    		zdylv();
    	}
    	
    	$("#collapseExample2").collapse('show');
    	
        $('#checkyes').click(function(){
        	$("#collapseExample1").show(); 
        })
        $('#checkno').click(function(){
        	$("#collapseExample1").hide();
        })
        $('#changetitle').change(function(){
        	var change =  $('#changetitle').val();
        	if(change!=0){
        		 $("#collapseExample2").collapse('show'); 
        	}else{
        		$("#collapseExample2").collapse('hide');
        	}
        })
        $('#typechange').change(function(){
        	var type = $('#typechange').val();
        	if(type != 0){
        		$("#collapseExample3").collapse('show'); 
        	}else{
        		$("#collapseExample3").collapse('hide'); 
        	}
        })
        //贴息说明
        $('#subjectDiscountExplain').change(function(){
        	var explain = $('#subjectDiscountExplain').val();
        	if(explain == 1){
        		$("#subjectExplain").html("按人民银行活期利率贴息");
        	}else if(explain == 2){
        		$("#subjectExplain").html("按人民银行定期利率贴息");
        	}else{
        		$("#subjectExplain").html("");
        	}
        	
        })
        $('#Temp').change(function(){
        	var id = $("#Temp").val();
        	if(id!=0){
        		window.location.href="${basePath}cms/subject/addTempJsp.action?subjectId="+id;
        	}else{
        		var originatorId = $('#originator').val();
        		var projectId = $('#changetitle').val();
        		window.location.href="${basePath}cms/subject/addJsp.action?oId="+originatorId+"&pId="+projectId;
        	}
        })
        $('#protempChange').change(function(){
        	var protempId = $('#protempChange').val();
        	var str = "protempId="+protempId;
        	$.ajax({
                type:"post",
                url:"cms/protemp/findById.action",
                dataType:"json",
                data:str,
                success:function(data){
                	ue.setContent(data.message);
               		$("#protempChange").val(data.id);
                }
            })
        })
    });
    $('.dialog').click(function(){
    	var protempName = $('#protempName').val();
    	var protemp = ue.getContent();
    	if(protempName=="" || protempName == null){
    		$.alert("请填写协议名称")
    	}else if(protemp == "" || protemp == null){
    		$.alert("请填写标的购买协议")
    	}else{
    		var str = "protempName="+protempName+"&protemp="+protemp;
    		$.ajax({
                type:"post",
                url:"cms/protemp/add.action",
                dataType:"json",
                data:str,
                success:function(data){
                	$.alert("保存成功")
                }
            })
    	}
	})

    function checkMoney(){
    	var money = parseInt($('#money').val());
    	var lastMoney = parseInt($('#lastMoney').val());
    	
    	if("" != money){
    		if(lastMoney < money){
    			$('#checkmoney').html("标的金额超出剩余额度");
    			$('#moneyparent').addClass("has-error");
    		}else{
    			$('#checkmoney').html("");
    			$('#moneyparent').removeClass("has-error");
    		}
    	}else{
    		$('#checkmoney').html("");
    		$('#moneyparent').removeClass("has-error");
    	}
    }
    function checkForm(){
        var subjectName = $('#subjectName').val();//标的名称
        var subjectStageShowName = $('#subjectStageShowName').val();//期名称
    	var money = parseInt($('#money').val());
    	var minmoney=Number($('#minmoney').val());
		var maxmoney=Number($('#maxmoney').val());
    	var lastMoney = parseInt($('#lastMoney').val());
    	var zj=Number($('#subjectAdditionalMultiple').val());

        var subjectIsInvestDiscount = $('[name=subjectIsInvestDiscount]').val();
        var subjectInvestDiscountNum = Number($('[name=subjectInvestDiscountNum]').val());

        if ("" == subjectName) {
                $.alert("请输入标的名称");
                return false;
            }else{
                var state=false;
                  $.ajax({
                    type:"post",
                    async:false,
                    url:"cms/subject/checkSubjectName.action",
                    dataType:"json",
                    data:{subjectName:subjectName,checktype:1},
                    success:function(data){
                        if(data.message != "success"){
                            
                        }else{
                            state = true;
                        }
                    }
                })
            }
        if (state == false) {
            $.alert("标的名称已经存在!");
            return false;
        };
        if("" == subjectStageShowName){
            $.alert("请输入期名称");
            return false;
        }
    	if($('#typechange').val()==1 && $("input:checkbox[name='types']:checked").length == 0){
			$.alert("请选择用户组专享标的所属用户组");
			return false;
		}
    	if((minmoney+zj)>maxmoney){
			$.alert("最大金额不能小于最小金额与递增金额的和");
			return false;
		}
//     	if("" ==$("#pfile").val()&& "" == $('#purchaseAgreeName').text()){
//     		$.alert("请上传标的认购协议")
//     		return false;
//     	}
    	if($("input[name=subjectPaymentMethod]:checked").val()==2 && null ==  $('[name=subjectPaymentDay]').val()){
        	$.alert("请输入还息日");
        	return false;
        }
    	if ("" == subjectNumOfDays && $('input[name="subjectNodeInterest"]:checked').val()!=5 && $('input[name="subjectNodeInterest"]:checked').val()!=6) {
            $.alert("请输入N的数值");
            return false;
        }

        if( $('input[name="subjectNodeInterest"]:checked').val()==5 || $('input[name="subjectNodeInterest"]:checked').val()==6){
        	if("" == $('#subjectFirDiscDay').val()){
        		 $.alert("请输入M的数值");
        		return false;
        	}
        }

        if ((subjectIsInvestDiscount == 1 && subjectInvestDiscountNum < 0) || (subjectIsInvestDiscount == 1 && subjectInvestDiscountNum == 0)) {
                $.alert("请正确填写优惠金额");
                return false;
            }
        if ((subjectIsInvestDiscount == 1 && subjectInvestDiscountNum > minmoney) || (subjectIsInvestDiscount == 1 && subjectInvestDiscountNum == minmoney)) {
                $.alert("优惠金额必须小于标的最小认购额度！");
                return false;
            };
    	if("" != money){
    		if(lastMoney < money){
    			$.alert("标的金额超出剩余额度");
    			$('#checkmoney').html("标的金额超出剩余额度");
    			$('#moneyparent').addClass("has-error");
    			return false;
    		}else{
    			$('#checkmoney').html("");
    			$('#moneyparent').removeClass("has-error");
    			$('[type="submit"]').attr('type','button').addClass('disabled')
    			return true;
    			
    		}
    	}else{
    		$.alert("请输入标的金额");
    		return false;
    	}
    }
    function template(){
    	$('#subjectIsTemplate').val(1);
    	$('#Templatesubmit').click();
    }
    function uploadFile() { 
    	$("#pinstructions").click(); 
    }; 
    
    function addFileNameToInput(){
    	$('#tempName').html($("#pinstructions").val());
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
                	if(data.projectType == 2){
                		$('#hxyf').hide();
                		$('#subjectType').val(data.projectType);
                		$('.guding').hide();
                	}else{
                		$('#subjectType').val(data.projectType);
                		$('#hxyf').show();
                	}
                	$('#xmze').text(data.getmoney);
                	$('#mjxx').text(data.getmoneylimit);
                	$('#syed').text(data.getsurplusmoney);
                	$('#lastMoney').val(data.projectNosplitSubjectMoney);
                	if(data.projectFinancingType==1){
                		$('#rzlx').text("长期融资");
                	}else if(data.projectFinancingType==2){
                		$('#rzlx').text("其他周期融资");
                	}else{
                		$('#rzlx').text("短期融资(天)");
                	}
                	//项目的产品说明书
                	$('.p-inputfile').empty();
                	$.each(data.protocolList, function(i, d) {
                        var html = "<input  type='checkbox' name='pPid' value='"+d.pProtocolId+"' checked='checked'><span>"+d.pProtocolName+"</span><br>";
                        $('.p-inputfile').append(html);
                    })	
                    //1/普通2/新手
                    if(data.projectType == 1){
                    	$('#rzqx').text(data.projectFinancingTerm+"个月");
                    }else{
                    	$('#rzqx').text(data.projectFinancingTerm+"天");
                    }
                	
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
                  $('#hxyf').show();
                  $('.guding').show();
                  $('#zhouqi').hide();
                 $('#subjectPaymentCycle').val(1);
                 $("select[name=incomeWay]").val(1);
                 $('select[name="incomeWay"]').find('option[value="0"],option[value="2"]').show();
              }else{
            	  if($('#subjectType').val() == 2){
					  $('#hxyf').hide();
				  }else{
					  $('#hxyf').show();
				  }
                  $('#showMsg').html("根据用户投资后，满标审核通过作为起始节点，按固定周期递推");
                  $('.guding').hide();
                  $('#zhouqi').show();
                  $('#subjectPaymentCycle').val("");
                  $("select[name=incomeWay]").val(1);
                  $('select[name="incomeWay"]').find('option[value="0"],option[value="2"]').hide();
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
        
        function checktemp(){
        	var Temp =$('#Temp option:selected') .val();
        	if(Temp!=0){
	        	window.location.href="${basePath}cms/subject/addTempJsp.action?subjectId="+Temp;
        	}
        }
        
        function addAnnualized(){
        	var html = "";
        	html = html + '<div class="form-group">'+
                                '<label class="col-md-2 control-label">默认年化收益率：</label>'+
                                '<div class="col-md-10">'+
                                    '<div class="form-inline">'+
                                        '<div class="form-group" style="margin:0">'+
                                            '<input type="text"  class="form-control"  name="SARmin" required placeholder="最小额度" >'+
                                        '</div>'+
                                        '<div class="form-group" style="margin:0">'+
                                            '<p class="form-control-static">-</p>'+
                                        '</div>'+
                                        '<div class="form-group" style="margin:0">'+
                                            '<input type="text"  class="form-control" name="SARmax" required placeholder="最大额度" >'+
                                        '</div>'+
                                        '<div class="input-group">'+
                                            '<input type="text" class="form-control" name="SARrate" required placeholder="年化收益率" >'+
                                            '<div class="input-group-addon">%</div>'+
                                        '</div>'+
                                    '</div>'+
                                '</div>'+
                            '</div>'+
                            '<br/>';
         $('#inserts').after(html);
        }
        function delprotocol(id){
        	var str = "protocolId="+id;
			 $.ajax({
	        		url:'cms/subject/deleteProtocol.action',
	        		type:'post',
	        		data:str,
	        		success:function(data){
	        			if("success"==data.message){
	        				$.alert("删除成功");
	        			}else{
	        				$.alert("删除失败");
	        			}
	        		}
	        	});
        }
        
		function zdylv(){
                $("#zdy").remove(); 
                var html = "";
                html = html + '<div class="form-group" id="zdy">'+
                                '<label class="col-md-2 control-label"></label>'+
                                '<div class="col-md-4 well">'+
                                    '<div class="input-group col-md-4">'+
                                        '<input type="text" id="txlv" data-tofixed name="discountRate" onblur="rule.onlyNonNegative(this)" onkeyup="rule.onlyNonNegative(this)"  value="${subject.subjectCustomDiscountRate*100}" class="form-control" required placeholder="贴息利率" >'+
                                        '<div class="input-group-addon">%</div>'+
                                    '</div>'+
                                '</div>'+
                            '</div>';
                $('#zdy1').after(html);
                $.each($('[data-tofixed]'),function(){
            		if($(this).prop("tagName")=='INPUT'){
            			$(this).val(Number($(this).val()).toFixed(2))
            		}
            	})

        }
		function cancelzdy(){
			$("#zdy").remove(); 
		}

        function discount(){
            var html = "";
            html = html + '<div class="form-group" id="discountIn">'+
                            '<label class="col-md-2 control-label"></label>'+
                            '<div class="col-md-4 well">'+
                                '<div class="input-group col-md-4">'+
                                    '<input type="text" id="txlv" name="subjectInvestDiscountNum" onblur="rule.onlyNonNegative(this)" onkeyup="rule.onlyNonNegative(this)"  class="form-control" required placeholder="优惠金额" >'+
                                    '<div class="input-group-addon">元</div>'+
                                '</div>'+
                            '</div>'+
                        '</div>';
            $('#discountInfo').after(html);
        }
        
        function cancelDiscount(){
            $("#discountIn").remove(); 
        }
    </script>
</body>
</html>