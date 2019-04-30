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
<body >

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
	                    <li class="active">项目管理</li>
	                    <li class="active">修改</li>
	                </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                    <form action="cms/project/add.action" method="post" enctype="multipart/form-data" class="form-horizontal confirmForm">
                    <div style="text-align:center;">
		                 <div class="center-box btn-group">
		                      <button type="button" class="btn btn-default btn-primary" id="first">步骤一、配置项目基础信息</button><button id="second" type="button" class="btn btn-default">步骤二、配置项目融资规模</button>
		                 </div>
	                 </div>

                <div class="col-lg-12" id="firstDiv">
                		<div class="form-group">
					        <label class="col-md-2 control-label">项目模板：</label>
					        <div class="col-md-3">
                                <select  class="form-control"  onchange="javascript:changeTemplate();" id="templateSelect" name="tempId">
                                <option value="0">不使用模板</option>
                                <c:forEach items="${projectTemplateList}" var="project">
                                		<option value="${project.projectId}"<c:if test="${pid == project.projectId }">selected</c:if>>${project.projectName}</option>
                       			</c:forEach>
                                </select>
                             </div>
					    </div>
					    <br/>
                		<div class="form-group">
					        <label class="col-md-2 control-label">项目名称：</label>
					        <div class="col-md-3">
                                <input type="text" id="pname" name="projectName" class="form-control" required placeholder="项目名称" value="${project.projectName }" >
                            </div>
					    </div>
					    <br/>
					    <div class="form-group">
					        <label class="col-md-2 control-label">发起人：</label>
					        <div class="col-md-3">
                                <select  class="form-control" name="projectSponsorId"  onchange="javascript:selectBank();" id='projectSponsorId'>
                                <c:forEach items="${originatorList}" var="originator">
                                		<option value="${originator.originatorId}" <c:if test="${project.projectSponsorId ==  originator.originatorId}">selected</c:if> >${originator.originatorName}</option>
                       			</c:forEach>
                                </select>
                             </div>
					    </div>
					    <br/>
					    <div class="form-group">
                              <label class="col-md-2 control-label">项目类型：</label>
                              <div class="col-md-3">
                                  <div class="radio">
                                      <label>
                                      <input type="radio" name="projectType" value="1" <c:if test="${project.projectType == 1 }">checked="checked"</c:if>>普通项目
                                      </label>
                                  </div>
                                  <div class="radio">
                                      <label>
                                      <input type="radio" name="projectType" value="2" <c:if test="${project.projectType == 2}">checked="checked"</c:if>>新手项目
                                      </label>
                                  </div>
                              </div>
                        </div>
                         <br/>
                         
                         
						<div class="form-group">
                              <label class="col-md-2 control-label">转账类型：</label>
                              <div class="col-md-3">
                                <select  class="form-control" name="projectTransferType" id="projectTransferType" onchange="javascript:selectBank();">
                                <option value="-1"<c:if test="${project.projectTransferType==-1 }">selected</c:if>>请选择</option>
                                <option value="1"<c:if test="${project.projectTransferType==1 }">selected</c:if>>手动转账</option>
                                <option value="2"<c:if test="${project.projectTransferType==2 }">selected</c:if>>自动转账账户</option>
                                <option value="3"<c:if test="${project.projectTransferType==3 }">selected</c:if>>自动转账子商户</option>
                                </select>
                              </div>
                          </div>
                          <br/>
                          

					    <div class="form-group">
					        <label class="col-md-2 control-label">项目担保描述：</label>
					        <div class="col-md-3">
                                <input type="text" name="projectGuaranteeDescription" value="${project.projectGuaranteeDescription}" class="form-control" required placeholder="项目担保描述" id="projectGuaranteeDescription" maxlength="40">
                            </div>
                            <div class="col-md-7 text-danger form-control-static">（项目担保描述最多为40个字）</div>
					    </div>
					    <br/>
					    
					    <div class="form-group">
					        <label class="col-md-2 control-label">项目简介：</label>
					        <div class="col-md-8">
                                <textarea class="form-control" name="projectBrief" rows="5" required placeholder="不超过2000个汉字 " id="templateBorrowDescribe">${project.projectBrief }</textarea>
                            </div>
					    </div>
					    <br/>
					     <div class="form-group newproject"> 
	                         <div class="form-group">
					        <label class="col-md-2 control-label">增信措施：</label>
					        <div class="col-md-8">
	                               <textarea class="form-control" name="projectCreditEnhancement" rows="5" required  placeholder="不超过2000个汉字 " id="projectCreditEnhancement">${project.projectCreditEnhancement }</textarea>
	                           </div>
					      	</div>
                         	<br/>

					    <div class="form-group">
					        <label class="col-md-2 control-label">发行人基本情况：</label>
					        <div class="col-md-8">
                                <textarea class="form-control" name="projectPublisherSituation" required rows="5" placeholder="不超过2000个汉字 " id="publisherSituation">${project.projectPublisherSituation }</textarea>
                            </div>
					    </div>
					    <br/>
					    <div class="form-group">
					        <label class="col-md-2 control-label">募集资金用途：</label>
					        <div class="col-md-8">
                                <textarea class="form-control" name="projectIpoUse" rows="5" required placeholder="不超过2000个汉字 " id="ipoUse">${project.projectIpoUse }</textarea>
                            </div>
					    </div>
					    <br/>
					   <%--  <div class="form-group">
					        <label class="col-md-2 control-label">偿债保障机制：</label>
					        <div class="col-md-8">
                                <textarea class="form-control"  rows="5" name="projectDebtGuarantee"  required placeholder="不超过2000个汉字 " id="debtGuarantee">${project.projectDebtGuarantee }</textarea>
                            </div>
					    </div>
					    <br/> --%>
					    <div class="form-group">
					        <label class="col-md-2 control-label">项目备注：</label>
					        <div class="col-md-8">
                                <textarea class="form-control"  rows="5" name="projectRemark"  placeholder="不超过2000个汉字 （非必填）" id="remark">${project.projectRemark }</textarea>
                            </div>
					    </div>
					    <br/>
					    
					                              <div class="form-group">
                              <label class="col-md-2 control-label">项目测评等级：</label>
                              <div class="col-md-3">
                                <select  class="form-control" name="projectEvaluatingScore" id="projectEvaluatingScore" >
                                <option value="1" <c:if test="${project.projectEvaluatingScore ==0 }">selected</c:if>>R0级产品</option>
                                <option value="1" <c:if test="${project.projectEvaluatingScore ==1 }">selected</c:if>>R1级产品</option>
                                <option value="2" <c:if test="${project.projectEvaluatingScore ==2 }">selected</c:if>>R2级产品</option>
                                <option value="3" <c:if test="${project.projectEvaluatingScore ==3 }">selected</c:if>>R3级产品</option>
                                <option value="4" <c:if test="${project.projectEvaluatingScore ==4 }">selected</c:if>>R4级产品</option>
                                <option value="5" <c:if test="${project.projectEvaluatingScore ==5 }">selected</c:if>>R5级产品</option>
                                </select>
                              </div>
                          </div>
                          <br/>
                          
                          <div class="form-group">
                            <label class="col-md-2 control-label">个人金融资产承诺书：</label>
                            <div class="col-md-6">
                                <div class="media">
                                  <a class="media-left">
                                   	<img class="media-object" src="${project.projectPromiseAddress }">
                                  	<div class="mask"><i class="fa fa-edit"></i></div>
                                  </a>
                                  <div class="media-body alert alert-warning"><p>图片大小：不超过5Ｍ</p><p>图片尺寸：800*530(px)</p><p>图片格式：jpg,png,jpeg</p></div>
                                  <input type="file" class="hide" id="mediaimg" name="promisefile">
                                </div>
                            </div>
                        </div>
					    
					    
                          <div class="form-group">
					        <label class="col-md-2 control-label">项目相关资料：</label>
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
					                                	<button class="btn btn-default btn-info" type="button" onclick="window.location.href='${basePath}cms/project/downloadFile.action?fileName=${protocol.pProtocolAddress}'">下载文件</button>
		                        						<span>${protocol.pProtocolName }</span>
				                                	</span>
										        	<input type="hidden" id="pPId" name="pPId" value="${protocol.pProtocolId }">
				                                	<button class="btn btn-default btn-danger btn-xs" type="button" id="firstnode" style="font-size:14px; margin-left:20px;" onclick="file.subNode($(this),true)">-</button>
			                                	</div>
							        	  </c:forEach>
							        	  <div>新增文件:</div>
						        		<div class="inputfileli">
								        	<span class="inputfile">
			                                	<button class="btn btn-default btn-primary" type="button"  onclick="file.init($(this))">上传文件（pdf或word格式）</button>
			                                	<input type="file" name="pinstructions"	style="display:none" id="pinstructions"/>
		                                	</span>
		                                	<button class="btn btn-default btn-danger btn-xs" type="button" id="firstnode" style="font-size:14px; margin-left:20px;" onclick="file.subNode($(this))">-</button>
	                                	</div>
	                                	
						        	</div>
		
                                </div>
                            </div>
					      </div>
                          <br/>
                          <br/>
                           </div>
					    <div class="form-group">
					        <label class="col-md-2 control-label"></label>
					        <div class="col-md-8">
                                <div class="center-box">
		                            <button type="button" class="btn btn-info" onclick="nextDiv()">保存项目信息，下一步</button>
		                        </div>
                            </div>
					    </div>
					    <br/>
					    
                        
                </div>
                <div class="col-lg-12" style="display: none;" id="nextDiv">
	               		 <div class="form-group">
					        <label class="col-md-2 control-label">募集金额：</label>
					        <div class="col-md-3">
					        	<div class="input-group">
	                                <input type="text"  class="form-control" data-tofixed name="projectIpoMoney"  onkeyup="onlyNonNegative(this)" required placeholder="募集金额" value="${project.projectIpoMoney }" data-money-ToUpper/>
	                                <div class="input-group-addon">元</div>
	                               </div>
	                           </div>
					      </div>
<!-- 					      <div class="form-group"> -->
<!-- 						      <label class="col-md-2 control-label">渠道名称：</label> -->
<!-- 						      <div class="col-md-3"> -->
<!-- 	                              <input type="text" class="form-control"  name="channelName" placeholder="请输入渠道名称" id="channelName"> -->
<!-- 	                          </div> -->
<!-- 						  </div> -->
<!-- 						  <br/> -->
						  <div class="form-group">
					        <label class="col-md-2 control-label">募集下限：</label>
					        <div class="col-md-3">
					        	<div class="input-group">
	                                <input type="text"  class="form-control" data-tofixed name="projectIpoLowerLimit" onkeyup="onlyNonNegative(this)"  required placeholder="募集下限" value="${project.projectIpoLowerLimit }" data-money-ToUpper>
	                                <div class="input-group-addon">元</div>
	                               </div>
	                           </div>
					      </div>
                          <br/>
                          <div class="form-group">
                              <label class="col-md-2 control-label">是否是可转让项目：</label>
                              <div class="col-md-3">
                                  <div class="radio">
                                      <label>
                                      <input type="radio" name="projectIsAssignment" value="0" onclick="yesAss(0)" <c:if test="${project.projectIsAssignment ==0}">checked="checked"</c:if> >不是
                                      </label>
                                  </div>
                                  <div class="radio">
                                      <label>
                                      <input type="radio" name="projectIsAssignment" value="1" onclick="yesAss(1)" <c:if test="${project.projectIsAssignment ==1}">checked="checked"</c:if>>是
                                      </label>
                                  </div>
                              </div>
                          </div>
                          <br/>
                          
                          <div class="form-group">
                              <label class="col-md-2 control-label">线上/线下：</label>
                              <div class="col-md-3">
                                  <div class="radio">
                                      <label>
                                      <input type="radio" name="projectIsOnline" value="0" <c:if test="${project.projectIsOnline ==0}">checked="checked"</c:if>>线上
                                      </label>
                                  </div>
                                  <div class="radio">
                                      <label>
                                      <input type="radio" name="projectIsOnline" value="1" <c:if test="${project.projectIsOnline ==1}">checked="checked"</c:if>>线下
                                      </label>
                                  </div>
                              </div>
                          </div>
						  <br/>
						  
						  <div class="form-group">
							<label class="col-md-2 control-label">是否需要做线上风险评估：</label>
							<div class="col-md-3">
								<div class="radio">
									<label>
									<input type="radio" name="needScore" value="1">是
									</label>
								</div>
								<div class="radio">
									<label>
									<input type="radio" name="needScore" value="0">否
									</label>
								</div>
							</div>
						</div>
						<br/>
                          
                          <div class="form-group none" id="yesAssCon">
                              <label class="col-md-2 control-label">转让存续期：</label>
                              <div class="col-md-1">
                              <c:if test="${project.projectStorageTime == -1}">
                                  <input type="text" class="form-control" id="projectStorageTime" name="projectStorageTime" value=""/>
                              </c:if>
                              <c:if test="${project.projectStorageTime != -1}">
                                  <input type="text" class="form-control" id="projectStorageTime" name="projectStorageTime" value="${project.projectStorageTime }"/>
                              </c:if>
                              </div>
                              <div class="col-md-2">
                                <select  class="form-control" name="projectStorageTimeType" >
                                <option value="1"<c:if test="${project.projectStorageTimeType ==1}">selected</c:if>>个月</option>
                                <option value="2"<c:if test="${project.projectStorageTimeType ==2}">selected</c:if>>天</option>
                                </select>
                              </div>
                          </div>
                          <br/>
                          <div class="form-group">
					        <label class="col-md-2 control-label">融资类型：</label>
					        <div class="col-md-8 commenprojectFinancingType">
					        	<div class="radio">
	        						<label>
	                                <input type="radio" name="projectFinancingType" value="1" <c:if test="${project.projectFinancingType == 1 }">checked="checked"</c:if>>长期（1个月起）
	                                </label>
                                </div>
                                <div class="radio">
	        						<label>
	                                <input type="radio" name="projectFinancingType" value="2" <c:if test="${project.projectFinancingType == 2 }">checked="checked"</c:if>>其他周期（1个月起）
	                                </label>
                                </div>
                             </div>
                           <div class="col-md-8 newprojectFinancingType">
	                          <div class="radio">
	                                <label>
	                                    <input type="radio" name="projectFinancingType" value="3" <c:if test="${project.projectFinancingType == 3 }">checked="checked"</c:if>>短期（1天起）
	                                </label>
	                          </div>
                  			</div>
					      </div>
					      <br/>
					      <div class="form-group">
						      <label class="col-md-2 control-label">融资期限：</label>
                              <div class="col-md-3" id="longMonth">
                                <select class="form-control" name="proMonth" onchange="monthChange(this)">
                                	<option value="6" <c:if test="${project.projectFinancingTerm==6}">selected</c:if>>6个月</option>
                                	<option value="12" <c:if test="${project.projectFinancingTerm==12 }">selected</c:if>>12个月（1年期）</option>
                                	<option value="18" <c:if test="${project.projectFinancingTerm==18 }">selected</c:if>>18个月</option>
                                	<option value="24" <c:if test="${project.projectFinancingTerm==24 }">selected</c:if>>24个月（2年期）</option>
                                	<option value="30" <c:if test="${project.projectFinancingTerm==30 }">selected</c:if>>30个月</option>
                                	<option value="36" <c:if test="${project.projectFinancingTerm==36 }">selected</c:if>>36个月（3年期）</option>
                                	<option value="42" <c:if test="${project.projectFinancingTerm==42 }">selected</c:if>>42个月</option>
                                	<option value="48" <c:if test="${project.projectFinancingTerm==48 }">selected</c:if>>48个月（4年期）</option>
                                	<option value="54" <c:if test="${project.projectFinancingTerm==54 }">selected</c:if>>54个月</option>
                                	<option value="60" <c:if test="${project.projectFinancingTerm==60 }">selected</c:if>>60个月（5年期）</option>
                                </select>
                              </div>
                              <div class="col-md-3 month" style="display: none;">
                            	<div class="input-group">
	                                <input type="text" class="form-control"  onkeyup="this.value=this.value.replace(/[^\d]/g,'')" name="projectFinancingTerm" id="projectFinancingTerm" value="${project.projectFinancingTerm }">
	                                <span class="input-group-addon">月</span>
                                </div>
                            </div>
                            <div class="col-md-2 day" style="display: none;">
                              <div class="input-group">
                                  <input type="text" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" class="form-control" name="projectFinancingTermDay" id="projectFinancingTermDay" value="${project.projectFinancingTerm }">
                                  <span class="input-group-addon" >天</span>
                                </div>
                            </div>
						  </div>
						  <br/>
						  
						  <div class="form-group">
					        <label class="col-md-2 control-label">年化天数：</label>
					        <div class="col-md-2">
					        	<div class="input-group">
	                                <input type="text"  class="form-control" name="projectYearNum" value="${project.projectYearNum }" onkeyup="onlyNonNegative(this)"  required placeholder="年化天数" >
	                                <div class="input-group-addon">天</div>
                                </div>
                            </div>
					      </div>
                          <br/>
						  
						  <c:if test="${project.projectIsAssignment == 1}">
						      <div  id="yesAssData">
                          <div class="form-group">
                                <label class="col-md-2 control-label">转让前，用户观看转让协议：</label>
                                <div class="col-md-8">

						        	<span class="inputfile">
	                                	<button class="btn btn-default btn-primary" type="button"  onclick="file.init($(this))">上传文件（pdf格式）</button>
	                                	<input type="file" name="pfile" id="pfile"	style="display:none"/>
	                                	<span class="stat" id="assignProtocalName">${assignProtocal.assignProtocalName }</span>
                                	</span>
                                </div>
                           </div>
                          
                          <div class="form-group">
                                <label class="col-md-2 control-label">转让后，用于生成协议的模板（含文本域）：</label>
                                <div class="col-md-8">
						        	<span class="inputfile">
	                                	<button class="btn btn-default btn-primary" type="button"  onclick="file.init($(this))">上传模板文件（pdf格式）</button>
	                                	<input type="file" name="tempaltefile" id="tempaltefile"	style="display:none"/>
	                                	<span class="stat" id="assignProtocalTempName">${assignProtocal.assignProtocalTempName }</span>
                                	</span>
                           		</div>
                          </div>
						  </div>
						  </c:if>
						  <c:if test="${project.projectIsAssignment == 0}">
						      <div class="none"  id="yesAssData">
                          <div class="form-group">
                                <label class="col-md-2 control-label">转让前，用户观看转让协议：</label>
                                <div class="col-md-8">

						        	<span class="inputfile">
	                                	<button class="btn btn-default btn-primary" type="button"  onclick="file.init($(this))">上传文件（pdf格式）</button>
	                                	<input type="file" name="pfile" id="pfile"	style="display:none"/>
	                                	<span class="stat" id="assignProtocalName">${assignProtocal.assignProtocalName }</span>
                                	</span>
                                </div>
                           </div>
                          
                          <div class="form-group">
                                <label class="col-md-2 control-label">转让后，用于生成协议的模板（含文本域）：</label>
                                <div class="col-md-8">
						        	<span class="inputfile">
	                                	<button class="btn btn-default btn-primary" type="button"  onclick="file.init($(this))">上传模板文件（pdf格式）</button>
	                                	<input type="file" name="tempaltefile" id="tempaltefile"	style="display:none"/>
	                                	<span class="stat" id="assignProtocalTempName">${assignProtocal.assignProtocalTempName }</span>
                                	</span>
                           		</div>
                          </div>
						  </div>
						  </c:if>
<!--                           <br/> -->
<!--                           <div class="row tables-btn-box"> -->
<!--                         	<div class="col-md-1"> -->
<!--                         	</div> -->
<!--                             <div class="col-md-1"> -->
<!--                                 <span class="" >付息方式：</span> -->
<!--                             </div> -->
<!--                              <div class="col-md-2"> -->
<!--                                 <input type="radio" name="projectPaymentMethod" value="1" checked="checked">固定日期还息方式 -->
<!--                             </div> -->
<!--                             <div class="col-md-2"> -->
<!--                                 <input type="radio" name="projectPaymentMethod" value="2">按周期递推还息方式 -->
<!--                             </div> -->
<!--                             <div class="col-md-4"> -->
<!--                             	<span style="color: red" id="showMsg">项目启动前约定还息日期</span> -->
<!--                             </div> -->
<!--                          </div> -->
<!--                          <br/> -->
<!--                           <div class="row tables-btn-box guding"> -->
<!--                         	<div class="col-md-1"> -->
<!--                         	</div> -->
<!--                             <div class="col-md-1"> -->
<!--                                 <span class="" >还息月份：</span> -->
<!--                             </div> -->
<!--                              <div class="col-md-3" > -->
<!--                                 <select class="form-control" onchange="huanxi(this)"> -->
<!--                                 	<option value="1">按月还息</option> -->
<!--                                 	<option value="0">按季度还息</option> -->
<!--                                 	<option value="3">按3个月为周期还息</option> -->
<!--                                 	<option value="6">按6个月为周期还息</option> -->
<!--                                 	<option value="-1">其他周期</option> -->
<!--                                 </select> -->
<!--                                 <input type="hidden" id="projectPaymentMethodType" name="projectPaymentMethodType" value="0"/> -->
<!--                             </div> -->
<!--                          </div> -->
<!--                          <br/> -->
<!--                           <div class="row tables-btn-box guding"> -->
<!--                         	<div class="col-md-1"> -->	
<!--                         	</div> -->
<!--                             <div class="col-md-1"> -->
<!--                                 <span class="" >还息日：</span> -->
<!--                             </div> -->
<!--                              <div class="col-md-3" > -->
<!--                                 <input type="number"  class="form-control" name="projectPaymentDay"  placeholder="还息日" > -->
<!--                             </div> -->
<!--                              <div class="" > -->
<!--                                 <span style="line-height: 34px" >日</span> -->
<!--                             </div> -->
<!--                             </div> -->
<!--                           <div class="row tables-btn-box" id="zhouqi" style="display: none;"> -->
<!--                         	<div class="col-md-1"> -->
<!--                         	</div> -->
<!--                             <div class="col-md-1"> -->
<!--                                 <span class="" >周期：</span> -->
<!--                             </div> -->
<!--                              <div class="col-md-3" > -->
<!--                                 <input type="number"  class="form-control"  placeholder="周期" id="projectPaymentCycle" name="projectPaymentCycle" value="1" > -->
<!--                             </div> -->
<!--                           </div> -->
							<input type="hidden" name="projectIsTemplet" id="projectIsTemplet" value="0">
						  <div class="form-group">
						      <label class="col-md-2 control-label"></label>
						      <div class="col-md-8">
	                                <div class="center-box">
			                            <button type="button" class="btn btn-info" onclick="checkForm()">提交</button>
			                            <button type="button" class="btn btn-warning" onclick="temp()">保存并设置当前项目信息为模板</button>
					        			<button type="submit" style="display: none" id="tijiao" class="btn btn-info">提交</button>
			                        </div>
	                          </div>
						  </div>
						  <br/>
                        
                </div>
               </form>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->



    <script>
    $(document).ready(function() {
    	if($('#projectTransferType').val()==2){
    		$('#projectshow').show();
    	}
        if($("input[name=projectFinancingType]:checked").val()==1){
			 $('#longMonth').show();
			 $('.month').hide();
			 $('.day').hide();
        }else if($("input[name=projectFinancingType]:checked").val()==2){
			 $('#longMonth').hide();
			 $('.month').show();
			 $('.day').hide();
        }else{
			$('#longMonth').hide();
			 $('.month').hide();
			 $('.day').show();
        }
        var isshow=${project.projectIsAssignment};
        if(isshow == 1){
        	$('#yesAssCon').show();
        }
        $(document).on("click",".media-left",function(){//弹框里显示本地图片
            $('#mediaimg').unbind('change').change(function(e){
                    if(e.target.files.length==0){return}
                    var file=e.target.files[0];
                    if(!/image\/\w+/.test(file.type)){ 
                        alert("请确保文件为图像类型"); 
                        return false; 
                    }
                    var reader=new FileReader();
                    reader.readAsDataURL(file);
                    reader.onload=function(e){
                        $('.media-object').attr('src',this.result)
                    };
                    once=false;

            }).trigger('click');  
        })
    });
    $("input[name=projectType]").click(function(){
        if(this.value == 1){
          $('.newproject').show();
          $('#projectCreditEnhancement').removeAttr('disabled');
          $('#publisherSituation').removeAttr('disabled');
          $('#ipoUse').removeAttr('disabled');
          $('#remark').removeAttr('disabled');
          $('#pinstructions').removeAttr('disabled');
          $('#isNew').show();
        }else{
          $('.newproject').hide();
          $('#projectCreditEnhancement').attr('disabled','disabled');
          $('#publisherSituation').attr('disabled','disabled');
          $('#ipoUse').attr('disabled','disabled');
          $('#remark').attr('disabled','disabled');
          $('#pinstructions').attr('disabled','disabled');
          $('#isNew').hide();
        }
      });
    $("input[name=projectType]:checked").trigger('click');
        function uploadFile() { 
        	$("#pinstructions").click(); 
        }; 
        
        function addFileNameToInput(){
        	var str = $("#pinstructions").val();
        	$('#filename').html(str.substring(str.lastIndexOf("\\")+1));
        }
        function yesAss(type){
    		if(type == 1){
    			$('#yesAssCon').show();
    			$('#yesAssData').show();
    		    $("#yesAssData input").attr('required','true');    		    
    		}else{
    			$("#yesAssData input").removeAttr('required');
    			$('#yesAssCon').hide();
    			$('#yesAssData').hide();
    		}
    	}
      //切换模板
        function changeTemplate(){
        	var id = $("#templateSelect").val();
        	if(id!=0){
        		window.location.href="${basePath}cms/project/addTempJsp.action?pid="+id;
        	}else{
        		window.location.href="${basePath}cms/project/addJsp.action";
        	}
        }
        //保存模板
        function saveTemplate(obj){
        	var publisherSituation = $('#publisherSituation').val();
        	var ipoUse = $('#ipoUse').val();
        	var debtGuarantee = $('#debtGuarantee').val();
        	var remark = $('#remark').val();
        	var name = $('#pname').val();
        	var describe=$('#templateBorrowDescribe').val();
        	var ptCreditEnhancement=$('#projectCreditEnhancement').val();
        	var clickfn=obj.attr('onclick');
        	$.ajax({
        		url:'cms/projectTemplate/addProjectTemplate.action',
        		type:'post',
        		beforeSend: function () {obj.removeAttr('onclick').addClass('disabled');},
        		data:{"ptCreditEnhancement":ptCreditEnhancement,"publisherSituation":publisherSituation,"ipoUse":ipoUse,"debtGuarantee":debtGuarantee,"remark":remark,"name":name,"describe":describe},
        		success:function(data){
        			if("yes"==data){
        				$.alert("保存模板成功");
        				$('#firstDiv').hide();
        	        	$('#nextDiv').show();
        	        	$('#first').removeClass('btn-primary');
        	        	$('#second').addClass('btn-primary');
        	        	projectType();
        			}else{
        				$.alert("保存模板失败");
        			}
        			obj.attr('onclick',clickfn).removeClass('disabled');
        		}
        	});
        }
        function checkForm(){
			   if(""==$('#pname').val()){
					$.alert("项目名称不能为空");
				}else if(""==$('#projectGuaranteeDescription').val()){
					$.alert("项目担保描述不能为空");
				}else if($('[name=projectType]:checked').val()==1 && ""==$('#projectCreditEnhancement').val()){
        			$.alert("增信措施不能为空");
	        	}else if(""==$('#templateBorrowDescribe').val()){
	        		$.alert("项目简介不能为空");
	        	}else if($('[name=projectType]:checked').val()==1 && ""==$('#publisherSituation').val()){
	        		$.alert("发行人基本情况不能为空");
	        	}else if($('[name=projectType]:checked').val()==1 && ""==$('#ipoUse').val()){
	        		$.alert("募集资金用途不能为空");
	        	}else if($("input[name=projectFinancingType]:checked").val()==2 && ""==$("#projectFinancingTerm").val()){
	        		$.alert("融资期限不能为空");
	        		return ;
	        	}else if($("input[name=projectFinancingType]:checked").val()==3 && ""==$("#projectFinancingTermDay").val()){
	        		$.alert("融资期限不能为空");
	        		return ;
	        	}else if($('[name=projectType]:checked').val()==1 && ""==$('#debtGuarantee').val()){
	        		$.alert("偿债保障机制不能为空");
	        	}else{
				   $('#tijiao').click();
	        	}
	        		
		   }
		 function huanxi(obj){
			 if(obj.value == 0){
				 $('#projectPaymentMethodType').val(1);
			 }else if(obj.value == -1){
				 $('#projectPaymentMethodType').val(2);
			 }else{
				 $('#projectPaymentCycle').val(obj.value);
				 $('#projectPaymentMethodType').val(0);
			 }
		 }
		 function delprotocol(id){
			 var str = "pPid="+id;
			 $.ajax({
	        		url:'cms/pProtocol/delete.action',
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
	     function projectType(){
	      if($('input[name="projectType"]:checked').val()==1){
	        $('.newprojectFinancingType').hide();
	        $('.commenprojectFinancingType').show();
	        if($('input[name=projectFinancingType]:checked')[0].value==3){
	          $('input[name=projectFinancingType][value=1]').prop('checked',true).trigger('click');
	        }
	        
	      }else{
	        $('.newprojectFinancingType').show();
	        $('.commenprojectFinancingType').hide();
	        $('input[name=projectFinancingType][value=3]').prop('checked',true).trigger('click');
	      }
     	} 
	         var bankHtml='<div id="projectshow">'+
                          '<div class="form-group">'+
                            '<label class="col-md-2 control-label">发起方收款银行账号：</label>'+
                            '<div class="col-md-3">'+
                                '<input type="text" class="form-control"  name="projectCardCardnum"  value="${project.projectCardCardnum}" id="projectCardCardnum">'+
                            '</div>'+
                        '</div>'+
                        '<br/>'+
                        '<div class="form-group">'+
                            '<label class="col-md-2 control-label">发起方收款银行名称：</label>'+
                            '<div class="col-md-3">'+
                            '<input type="text" name="projectCardBank" id="projectCardBank" class="form-control" required placeholder="开户银行" value="${project.projectCardBank}">'+
                            '</div>'+
                        '</div>'+
                        '<br/>'+
                        '<div class="form-group">'+
                            '<label class="col-md-2 control-label">发起方收款银行支行：</label>'+
                             '<div class="col-md-3">'+
                             '<input type="text" class="form-control"  name="projectCardSubbranch"  value="${project.projectCardSubbranch}" id="projectCardSubbranch">'+
                            '</div>'+
                        '</div>'+
                        '<br/>'+
                        '<div class="form-group">'+
                            '<label class="col-md-2 control-label">开户行省名：</label>'+
                             '<div class="col-md-3">'+
                                '<input type="text" class="form-control"  name="projectCardProname"  value="${project.projectCardProname}" id="projectCardProname">'+
                            '</div>'+
                        '</div>'+
                        '<br/>'+
                        '<div class="form-group">'+
                            '<label class="col-md-2 control-label">开户行市名：</label>'+
                             '<div class="col-md-3">'+
                                '<input type="text" class="form-control"  name="projectCardCityname"  value="${project.projectCardCityname}" id="projectCardCityname">'+
                            '</div>'+
                        '</div>'+
                        '<br/>'+
                        '<div class="form-group">'+
                            '<label class="col-md-2 control-label">发起方收款人姓名：</label>'+
                             '<div class="col-md-3">'+
                                '<input type="text" class="form-control"  name="projectCardPeoplename"  value="${project.projectCardPeoplename}" id="projectCardPeoplename">'+
                            '</div>'+
                        '</div>'+
                        '<br/>'+
					'</div>';
		   
	      //查询发起方信息
        function selectBank(){
            var originatorId =$('#projectSponsorId').val() ;
            var transfertype =$('#projectTransferType').val() ;
            $('#projectshow').remove();
            if(-1!=originatorId && 2==transfertype){
            	$('#projectTransferType').parents('.form-group').next().after(bankHtml)
                $.ajax({
                    url:'cms/project/selectBank.action',
                    type:'post',
                    data:{'originatorId':originatorId},
                    success:function(data){
                        if(data.message=='success'){
                           $('#projectCardCardnum').val(data.originatorCardCardnum);
                           $('#projectCardBank').val(data.originatorCardBank);
                           
                           $('#projectCardSubbranch').val(data.originatorCardSubbranch);
                           $('#projectCardPeoplename').val(data.originatorCardPeoplename);
                           $('#projectCardProname').val(data.originatorCardProname);
                           $('#projectCardCityname').val(data.originatorCardCityname);
                        }else{
                            alert('发起方未找到');
                        }
                                                                                             
                    }
                });
            }else{
                 
                 $('#projectCardCardnum').val("");
                 $('#projectCardBank').val("");
                 $('#projectCardSubbranch').val("");
                 $('#projectCardPeoplename').val("");
                 $('#projectCardProname').val("");
                 $('#projectCardCityname').val("");
            }
            
        }
        if(${project.projectTransferType==2 }){$('#projectTransferType').parents('.form-group').next().after(bankHtml)}
	      //1.去掉多余的小数点  
	      //2.保证只能输入小数点或数字  
	      function onlyNonNegative(obj) {  
	       var inputChar = event.keyCode;  
	       //$.alert(event.keyCode);  
	         
	       //1.判断是否有多于一个小数点  
	       if(inputChar==190 ) {//输入的是否为.  
	        var index1 = obj.value.indexOf(".") + 1;//取第一次出现.的后一个位置  
	        var index2 = obj.value.indexOf(".",index1);  
	        while(index2!=-1) {  
	         $.alert("有多个.");  
	         obj.value = obj.value.substring(0,index2);  
	         index2 = obj.value.indexOf(".",index1);  
	        }  
	       }  
	       //2.如果输入的不是.或者不是数字，替换 g:全局替换  
	       obj.value = obj.value.replace(/[^(\d|.)]/g,"");  
	      } 
	      
	       //点击显示下一步输入框
        function nextDiv(){
        	if($('#pname').val()==null || $('#pname').val()==""){
        		$.alert("项目名称不能为空");
        	}else if($('#projectSponsorId').val()<0){
        		$.alert("发起方不能为空");
        	}else if($('#projectTransferType').val()<0){
            $.alert("转账类型不能为空");
          }else{
				 $('#firstDiv').hide();
		        	$('#nextDiv').show();
		        	$('#first').removeClass('btn-primary');
		        	$('#second').addClass('btn-primary');
		        	projectType();
			 }
        }
        
        $('#second').click(function(){
        	$('#firstDiv').hide();
        	$('#nextDiv').show();
        	$('#first').removeClass('btn-primary');
        	$('#second').addClass('btn-primary');
        	projectType();
        })
        
        $('#first').click(function(){
        	$('#nextDiv').hide();
        	$('#firstDiv').show();
        	$('#second').removeClass('btn-primary');
        	$('#first').addClass('btn-primary');
        })
		
		function monthChange(obj){
			$('#projectFinancingTerm').val(obj.value);
		}
		
		 $("input[name=projectFinancingType]").click(function(){
			  if(this.value == 1){
			 	 $('#projectFinancingTerm').val(6);
			 	 $("select[name=proMonth]").val(6);
				  $('#longMonth').show();
				  $('.month').hide();
				  $('.day').hide();
			  }else if(this.value == 2){
				  $('#projectFinancingTerm').val("");
				  $('#longMonth').hide();
				  $('.month').show();
				  $('.day').hide();
			  }else{
				  $('#longMonth').hide();
				  $('.month').hide();
				  $('.day').show();
			  }
		  });
		 
		 $("input[name=projectPaymentMethod]").click(function(){
			  if(this.value == 1){
			 	  $('#showMsg').html("项目启动前约定还息日期");
			 	  $('.guding').show();
			 	  $('#zhouqi').hide();
			 	 $('#projectPaymentCycle').val(1);
			  }else{
				  $('#showMsg').html("根据用户投资后，满标审核通过作为起始节点，按固定周期递推");
				  $('.guding').hide();
				  $('#zhouqi').show();
				  $('#projectPaymentCycle').val("");
			  }
		  });
		  
		    //表单验证
	     function ajaxAdd(){
    	     if(""==$('#pname').val()){
    					$.alert("模板名称不能为空");
    					return;
    				}
	        	if(""==$('#templateBorrowDescribe').val()){
	        		$.alert("项目简介不能为空");
	        		return;
	        	}
			    if(""==$('#projectGuaranteeDescription').val()){
			    	$.alert("项目担保描述不能为空");
			    	return;
			    }
			    if($('[name=projectType]:checked').val()==1 && ""==$('#projectCreditEnhancement').val()){
			    	$.alert("增信措施不能为空");
			    	return;
			    }
	        	if($('[name=projectType]:checked').val()==1 && ""==$('#publisherSituation').val()){
	        		$.alert("发行人基本情况不能为空");
	        		return;
	        	}
	        	if($('[name=projectType]:checked').val()==1 && ""==$('#ipoUse').val()){
	        		$.alert("募集资金用途不能为空");
	        		return;
	        	}
	        	if("-1"==$('#projectTransferType').val()){
              		   $.alert("转账类型不能为空");
              		   return;
           		   }
 	        	if(""==$('#projectCardCardnum').val()){
                     $.alert("发起方收款银行账号不能为空");
                     return;
                 }
				if(""==$('#projectCardBank').val()){
                     $.alert("发起方收款银行名称不能为空");
                     return;
                 }
                 if(""==$('#projectCardSubbranch').val()){
                     $.alert("发起方收款银行支行不能为空");
                     return;
                }
                if(""==$('#projectCardPeoplename').val()){
                     $.alert("发起方收款人姓名不能为空");
                     return;
                 }
                if(""==$('#projectCardProname').val()){
                    $.alert("开户行省名不能为空");
                    return;
               }
               if(""==$('#projectCardCityname').val()){
                    $.alert("开户行市名不能为空");
                    return;
                }
	        	saveTemplate($(this));
	        }
		   function checkForm(){
			   if(""==$('#pname').val()){
					$.alert("项目名称不能为空");
				}else if(""==$('#projectGuaranteeDescription').val()){
					$.alert("项目担保描述不能为空");
				}else if($('[name=projectType]:checked').val()==1 && $('[name=projectType]:checked').val()==1 && ""==$('#projectCreditEnhancement').val()){
	        		$.alert("增信措施不能为空");
	        	}else if(""==$('#templateBorrowDescribe').val()){
	        		$.alert("项目简介不能为空");
	        	}else if($('[name=projectType]:checked').val()==1 && $('[name=projectType]:checked').val()==1 && ""==$('#publisherSituation').val()){
	        		$.alert("发行人基本情况不能为空");
	        	}else if($('[name=projectType]:checked').val()==1 && ""==$('#ipoUse').val()){
	        		$.alert("募集资金用途不能为空");
	        	}else if($('[name=projectType]:checked').val()==1 && ""==$('#debtGuarantee').val()){
	        		$.alert("偿债保障机制不能为空");
	        	}else if("-1"==$('#projectSponsorId').val()){
	        		$.alert("项目发起人不能为空");
	        		return;
	        	}else if($("input[name=projectFinancingType]:checked").val()==2 && ""==$("#projectFinancingTerm").val()){
	        		$.alert("融资期限不能为空");
	        		return ;
	        	}else if($("input[name=projectFinancingType]:checked").val()==3 && ""==$("#projectFinancingTermDay").val()){
	        		$.alert("融资期限不能为空");
	        		return ;
	        	}else if("-1"==$('#projectTransferType').val()){
             	 $.alert("转账类型不能为空");
              	return;
            	}else if(""==$('#projectCardCardnum').val()){
                     $.alert("发起方收款银行账号不能为空");
                    return;
                 }else if(""==$('#projectCardBank').val()){
                     $.alert("发起方收款银行名称不能为空");
                     return;
                 }else if(""==$('#projectCardSubbranch').val()){
                    $.alert("发起方收款银行支行不能为空");
                     return;
                 }
                 else if(""==$('#projectCardPeoplename').val()){
                     $.alert("发起方收款人姓名不能为空");
                     return;
                 }else if(""==$('#projectCardProname').val()){
                     $.alert("开户行省名不能为空");
                      return;
                  }
                  else if(""==$('#projectCardCityname').val()){
                      $.alert("开户行市名不能为空");
                      return;
                  }else if($("input[name=projectIsAssignment]:checked").val()==1 && "" ==$("#pfile").val()  && $("#assignProtocalName").html()==""){
              		$.alert("请上传转让协议")
              		return;
              	}else if($("input[name=projectIsAssignment]:checked").val()==1 &&  "" ==$("#tempaltefile").val() && $("#assignProtocalTempName").html()==""){
              		$.alert("请上传转让协议模板")
              		return;
                  }else if($("input[name=projectIsAssignment]:checked").val()==1 &&  "" ==$("#projectStorageTime").val() || $("#projectStorageTime").val()<0){
                		$.alert("转让存续期不能为空或负数")
                  		return;
                      } else if($('input[name="needScore"]:checked').length<=0) {
						$.alert("必须选择是否需要做线上风险评估")
          				return;
					  }
                else{
				   $('#tijiao').click();
	        	}
	        		
		   }
		   
		   function temp(){
			   $('#projectIsTemplet').val(1);
			   checkForm();
		   }
    </script>
</body>
</html>