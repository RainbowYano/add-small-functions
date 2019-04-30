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
	            <div class=" col-md-12">
	                <ol class="breadcrumb">
	                    <li class="active">项目管理</li>
	                    <li class="active">新增</li>
	                </ol>
	            </div>
            </div>
            <!-- /.row -->
            <div class="row">
            <form action="cms/project/add.action" class="form-horizontal confirmForm" method="post" enctype="multipart/form-data">
                 <div style="text-align:center;">
	                 <div class="center-box btn-group">
	                      <button type="button" class="btn btn-default btn-primary" id="first">步骤一、配置项目基础信息</button><button id="second" type="button" class="btn btn-default">步骤二、配置项目融资规模</button>
	                 </div>
                 </div>
                <div class="col-lg-12" id="firstDiv">
                		 <div class="form-group">
					        <label class="col-md-2 control-label">项目模板：</label>
					        <div class="col-md-3">
                                <select  class="form-control"  onchange="javascript:changeTemplate();" id="templateSelect">
                                <option value="0">不使用模板</option>
                                <c:forEach items="${projectTemplateList}" var="project">
                                		<option value="${project.projectId}">${project.projectName}</option>
                       			</c:forEach>
                                </select>
                          	</div>
					      </div>
                          <br/>
					      <div class="form-group">
					        <label class="col-md-2 control-label">项目名称：</label>
					        <div class="col-md-3">
					          <input type="text" id="pname" name="projectName" class="form-control " required placeholder="项目名称" >
					        </div>
					      </div>
                          <br/>
                          
                          <div class="form-group">
					                 <label class="col-md-2 control-label">发起方：</label>
					                 <div class="col-md-3">
                                <select  class="form-control" name="projectSponsorId" id="projectSponsorId"  onchange="javascript:selectBank();">
                                <option value="-1">请选择</option>
                                <c:forEach items="${originatorList}" var="originator">
                                		<option value="${originator.originatorId}">${originator.originatorName}</option>
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
                                      <input type="radio" name="projectType" value="1" checked="checked">普通项目
                                      </label>
                                  </div>
                                  <div class="radio">
                                      <label>
                                      <input type="radio" name="projectType" value="2">新手项目
                                      </label>
                                  </div>
                              </div>
                          </div>
                          <br/>
                          
                          <div class="form-group">
                              <label class="col-md-2 control-label">转账类型：</label>
                              <div class="col-md-3">
                                <select  class="form-control" name="projectTransferType" id="projectTransferType" onchange="javascript:selectBank();">
                                <option value="-1">请选择</option>
                                <option value="1">手动转账</option>
                                <option value="2">自动转账账户</option>
                                <option value="3">自动转账子商户</option>
                                </select>
                              </div>
                          </div>
                          <br/>
                        
						  <div class="form-group">
					        <label class="col-md-2 control-label">项目担保描述：</label>
					        <div class="col-md-3">
                                <input type="text" name="projectGuaranteeDescription" id="projectGuaranteeDescription" class="form-control" required placeholder="项目担保描述" maxlength="40">
                            </div>
                            <div class="col-md-7 text-danger form-control-static">（项目担保描述最多为40个字）</div>
					      </div>
                          <br/>
                          
                          

                          
						  <div class="form-group">
					        <label class="col-md-2 control-label">项目简介：</label>
					        <div class="col-md-8">
                                <textarea class="form-control" name="projectBrief" rows="5" required  placeholder="不超过2000个汉字 " id="templateBorrowDescribe"></textarea>
                            </div>
					      </div>
                          <br/>
              <div class="form-group newproject">    
                          <div class="form-group">
					        <label class="col-md-2 control-label">增信措施：</label>
					        <div class="col-md-8">
                                <textarea class="form-control" name="projectCreditEnhancement" rows="5"  placeholder="不超过2000个汉字 " id="projectCreditEnhancement"></textarea>
                            </div>
					      </div>
                          <br/>
                          
                          <div class="form-group">
					        <label class="col-md-2 control-label">发行人基本情况：</label>
					        <div class="col-md-8">
                                <textarea class="form-control" name="projectPublisherSituation" rows="5" placeholder="不超过2000个汉字 " id="publisherSituation"></textarea>
                            </div>
					      </div>
                          <br/>
                          
                          <div class="form-group">
					        <label class="col-md-2 control-label">募集资金用途：</label>
					        <div class="col-md-8">
                                <textarea class="form-control" name="projectIpoUse" rows="5" placeholder="不超过2000个汉字 " id="ipoUse"></textarea>
                            </div>
					      </div>
                          <br/>
                          
                        <!--   <div class="form-group">
					        <label class="col-md-2 control-label">偿债保障机制：</label>
					        <div class="col-md-8">
                                <textarea class="form-control"  rows="5" name="projectDebtGuarantee" required placeholder="不超过2000个汉字 " id="debtGuarantee"></textarea>
                            </div>
					      </div>
                          <br/> -->
                          
                          <div class="form-group">
					        <label class="col-md-2 control-label">项目备注：</label>
					        <div class="col-md-8">
                                <textarea class="form-control"  rows="5" name="projectRemark"  placeholder="不超过2000个汉字 （非必填）" id="remark"></textarea>
                            </div>
					      </div>
                          <br/>
                          
                          <div class="form-group">
                              <label class="col-md-2 control-label">项目测评等级：</label>
                              <div class="col-md-3">
                                <select  class="form-control" name="projectEvaluatingScore" id="projectEvaluatingScore" >
                                <option value="0">R0级产品</option>
                                <option value="1">R1级产品</option>
                                <option value="2">R2级产品</option>
                                <option value="3">R3级产品</option>
                                <option value="4">R4级产品</option>
                                <option value="5">R5级产品</option>
                                </select>
                              </div>
                          </div>
                          <br/>
                          
                          <div class="form-group">
                            <label class="col-md-2 control-label">个人金融资产承诺书：</label>
                            <div class="col-md-6">
                                <div class="media">
                                  <a class="media-left">
                                   	<img class="media-object" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAIAAAD91JpzAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NzIxOTE3OUQ4NDRGMTFFNjlEQzBFNkQ5NjE2RkU2MTEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NzIxOTE3OUU4NDRGMTFFNjlEQzBFNkQ5NjE2RkU2MTEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3MjE5MTc5Qjg0NEYxMUU2OURDMEU2RDk2MTZGRTYxMSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo3MjE5MTc5Qzg0NEYxMUU2OURDMEU2RDk2MTZGRTYxMSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PihAO6IAAAAVSURBVHjaYnz//j0DAwMTAxgABBgAIcYC0bjVO0YAAAAASUVORK5CYII=">
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
					        <div class="col-md-2">
					        	<div class="input-group">
	                                <input type="text"   class="form-control" name="projectIpoMoney" onkeyup="onlyNonNegative(this)" required placeholder="募集金额" data-money-ToUpper/>
	                                <div class="input-group-addon">元</div>
                                </div>
                            </div>
					      </div>
                          <br/>
                          
                          <div class="form-group">
					        <label class="col-md-2 control-label">募集下限：</label>
					        <div class="col-md-2">
					        	<div class="input-group">
	                                <input type="text"  class="form-control" name="projectIpoLowerLimit" onkeyup="onlyNonNegative(this)"  required placeholder="募集下限" data-money-ToUpper>
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
                                      <input type="radio" name="projectIsAssignment" value="0" onclick="yesAss(0)" checked="checked">不是
                                      </label>
                                  </div>
                                  <div class="radio">
                                      <label>
                                      <input type="radio" name="projectIsAssignment" value="1" onclick="yesAss(1)">是
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
                                      <input type="radio" name="projectIsOnline" value="0" checked="checked">线上
                                      </label>
                                  </div>
                                  <div class="radio">
                                      <label>
                                      <input type="radio" name="projectIsOnline" value="1">线下
                                      </label>
                                  </div>
                              </div>
                          </div>
                          <br/>
                          
                          <div class="form-group none" id="yesAssCon">
                              <label class="col-md-2 control-label">转让存续期：</label>
                              <div class="col-md-1">
                                  <input type="text" class="form-control" id="projectStorageTime" name="projectStorageTime"/>
                              </div>
                              <div class="col-md-1">
                                <select  class="form-control" name="projectStorageTimeType" >
                                <option value="1">个月</option>
                                <option value="2">天</option>
                                </select>
                              </div>
                          </div>
                          <br/>
                          
                          
                          
                          <div class="form-group">
                              <label class="col-md-2 control-label">是否发送预告短信：</label>
                              <div class="col-md-3">
                                  <div class="radio">
                                      <label>
                                      <input type="radio" name="projectIsPrepareMessage" value="0" onclick="sendMsg(0)" checked="checked">否
                                      </label>
                                  </div>
                                  <div class="radio">
                                      <label>
                                      <input type="radio" name="projectIsPrepareMessage" value="1" onclick="sendMsg(1)">是
                                      </label>
                                  </div>
                              </div>
                          </div>
                          <br/>
                          
                          
                          <div class="form-group none" id="messageDay">
                              <label class="col-md-2 control-label">提前发送天数：</label>
                              <div class="col-md-1">
                                  <input type="text" class="form-control" id="projectIsPrepareMessageDay" name="projectIsPrepareMessageDay"/>
                              </div>
                          </div>
                          <br/>
                          
                          
                          <div class="form-group">
					        <label class="col-md-2 control-label">融资类型：</label>
					        <div class="col-md-8 commenprojectFinancingType">
					        	<div class="radio">
	        						<label>
	                                <input type="radio" name="projectFinancingType" value="1" checked="checked">长期（1个月起）
	                                </label>
                                </div>
                                <div class="radio">
	        						<label>
	                                <input type="radio" name="projectFinancingType" value="2">其他周期（1个月起）
	                                </label>
                                </div>
                             </div>
                      <div class="col-md-8 newprojectFinancingType">
                          <div class="radio">
                                <label>
                                    <input type="radio" name="projectFinancingType" value="3" checked="checked">短期（1天起）
                                </label>
                          </div>
                      </div>
					      </div>
                          <br/>
                          
                          <div class="form-group">
					        <label class="col-md-2 control-label">融资期限：</label>
					        <div class="col-md-2" id="longMonth">
                                <select class="form-control" name="proMonth" onchange="monthChange(this)">
                                	<option value="6">6个月</option>
                                	<option value="12">12个月（1年期）</option>
                                	<option value="18">18个月</option>
                                	<option value="24">24个月（2年期）</option>
                                	<option value="30">30个月</option>
                                	<option value="36">36个月（3年期）</option>
                                	<option value="42">42个月</option>
                                	<option value="48">48个月（4年期）</option>
                                	<option value="54">54个月</option>
                                	<option value="60">60个月（5年期）</option>
                                </select>
                            </div>
                            <div class="col-md-2 month" style="display: none;">
                            	<div class="input-group">
	                                <input type="text" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" class="form-control" name="projectFinancingTerm" id="projectFinancingTerm" value="6">
	                                <span class="input-group-addon" >月</span>
                                </div>
                            </div>
                            <div class="col-md-2 day" style="display: none;">
                              <div class="input-group">
                                  <input type="text" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" class="form-control" name="projectFinancingTermDay" id="projectFinancingTermDay">
                                  <span class="input-group-addon" >天</span>
                                </div>
                            </div>
					      </div>

                          <br/>
                          
                          <div class="form-group">
					        <label class="col-md-2 control-label">年化天数：</label>
					        <div class="col-md-2">
					        	<select class="form-control" name="projectYearNum" >
                                	<option value="365">365</option>
                                	<option value="360">360</option>
                                </select>
                            </div>
					      </div>
                          <br/>
                          
                          <div class="none" id="yesAssData">
                          <div class="form-group">
                                <label class="col-md-2 control-label">转让前，用户观看转让协议：</label>
                                <div class="col-md-8">

						        	<span class="inputfile">
	                                	<button class="btn btn-default btn-primary" type="button"  onclick="file.init($(this))">上传文件（pdf格式）</button>
	                                	<input type="file" name="pfile" id="pfile"	style="display:none"/>
                                	</span>
                                </div>
                           </div>
                          
                          <div class="form-group">
                                <label class="col-md-2 control-label">转让后，用于生成协议的模板（含文本域）：</label>
                                <div class="col-md-8">
						        	<span class="inputfile">
	                                	<button class="btn btn-default btn-primary" type="button"  onclick="file.init($(this))">上传模板文件（pdf格式）</button>
	                                	<input type="file" name="tempaltefile" id="tempaltefile"	style="display:none"/>
                                	</span>
                           		</div>
                          </div>
						  </div>
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
        
        

    <!-- /#wrapper -->


    <script>
    $(document).ready(function() {
        var url = window.location;
        var element = $('ul.nav a').filter(function() {
            return this.href == url || url.href.indexOf(this.href) == 0;
        }).addClass('active').parent().parent().addClass('in').parent();
        if (element.is('li')) {
            element.addClass('active');
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
    	function sendMsg(type){
    		if(type == 1){
    			$('#messageDay').show();
    		}else{
    			$('#messageDay').hide();
    		}
    	}
        function uploadFile() { 
        	$("#pinstructions").click(); 
        }; 
        
        function addFileNameToInput(){
        	var str = $("#pinstructions").val();
        	$('#filename').html(str.substring(str.lastIndexOf("\\")+1));
        }
        
        var bankHtml='<div id="projectshow">'+
                          '<div class="form-group">'+
                            '<label class="col-md-2 control-label">发起方收款银行账号：</label>'+
                            '<div class="col-md-3">'+
                                '<input type="text" class="form-control"  name="projectCardCardnum"  value="" id="projectCardCardnum">'+
                            '</div>'+
                        '</div>'+
                        '<br/>'+
                        '<div class="form-group">'+
                            '<label class="col-md-2 control-label">发起方收款银行名称：</label>'+
                            '<div class="col-md-3">'+
                                '<input type="text" name="projectCardBank" id="projectCardBank" class="form-control" required placeholder="开户银行" >'+
                            '</div>'+
                        '</div>'+
                        '<br/>'+
                        '<div class="form-group">'+
                            '<label class="col-md-2 control-label">发起方收款银行支行：</label>'+
                             '<div class="col-md-3">'+
                                '<input type="text" class="form-control"  name="projectCardSubbranch"  value="" id="projectCardSubbranch">'+
                            '</div>'+
                        '</div>'+
                        '<br/>'+
                        '<div class="form-group">'+
                            '<label class="col-md-2 control-label">开户行省名：</label>'+
                             '<div class="col-md-3">'+
                                '<input type="text" class="form-control"  name="projectCardProname"  value="" id="projectCardProname">'+
                            '</div>'+
                        '</div>'+
                        '<br/>'+
                        '<div class="form-group">'+
                            '<label class="col-md-2 control-label">开户行市名：</label>'+
                             '<div class="col-md-3">'+
                                '<input type="text" class="form-control"  name="projectCardCityname"  value="" id="projectCardCityname">'+
                            '</div>'+
                        '</div>'+
                        '<br/>'+
                        '<div class="form-group">'+
                            '<label class="col-md-2 control-label">发起方收款人姓名：</label>'+
                             '<div class="col-md-3">'+
                                '<input type="text" class="form-control"  name="projectCardPeoplename"  value="" id="projectCardPeoplename">'+
                            '</div>'+
                        '</div>'+
                        '<br/>'+
                        '</div>'+
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
        //切换模板
        function changeTemplate(){
        	var id = $("#templateSelect").val();
        	if(id!=0){
        		window.location.href="${basePath}cms/project/addTempJsp.action?pid="+id;
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
        
        //点击显示下一步输入框
        function nextDiv(){
//           if($('[name=projectType]:checked').val()==1 && ($('[name=pinstructions]').val()==null || $('[name=pinstructions]').val()=="")){
// 				    $.alert("项目相关资料不能为空");
// 			    }else 
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
          projectType()
        	$('#firstDiv').hide();
        	$('#nextDiv').show();
        	$('#first').removeClass('btn-primary');
        	$('#second').addClass('btn-primary');

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
          $('#projectFinancingTermDay').val("");
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

     $("input[name=projectType]").click(function(){
        if(this.value == 1){
          $('.newproject').show();
          $('#projectCreditEnhancement').removeAttr('disabled');
          $('#publisherSituation').removeAttr('disabled');
          $('#ipoUse').removeAttr('disabled');
          $('#remark').removeAttr('disabled');
          $('#pinstructions').removeAttr('disabled');
          $('#projectFinancingTermDay').attr('disabled','disabled');
          $('#isNew').show();
        }else{
          $('.newproject').hide();
          $('#projectCreditEnhancement').attr('disabled','disabled');
          $('#publisherSituation').attr('disabled','disabled');
          $('#ipoUse').attr('disabled','disabled');
          $('#remark').attr('disabled','disabled');
          $('#pinstructions').attr('disabled','disabled');
          $('#projectFinancingTermDay').removeAttr('disabled');
          $('#isNew').hide();
        }
      });
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
// 	        	 if("" == $('#mediaimg').val() && $('#projectEvaluatingScore').val()!=0 ){
// 	       		  $.alert("请选择个人金融资产承诺书");
// 	       		  return;
// 	       	  }
	        	saveTemplate($(this));
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
	        	}else if($('[name=projectType]:checked').val()==1 && ""==$('#debtGuarantee').val()){
	        		$.alert("偿债保障机制不能为空");
	        	}
// 	        	else if($('[name=projectType]:checked').val()==1 && ($('[name=pinstructions]').val()==null || $('[name=pinstructions]').val()=="")){
// 	        		$.alert("项目相关资料不能为空");
	        
// 	            }
	        	else if("-1"==$('#projectSponsorId').val()){
	        		$.alert("项目发起人不能为空");
	        		return;
	        	}else if($("input[name=projectFinancingType]:checked").val()==2 && ""==$("#projectFinancingTerm").val()){
	        		$.alert("融资期限不能为空");
	        		return ;
	        	}else if($("input[name=projectFinancingType]:checked").val()==3 && ""==$("#projectFinancingTermDay").val()){
              $.alert("融资期限不能为空");
              return ;
            }
// 	        	else if("" == $('#mediaimg').val() && $('#projectEvaluatingScore').val()!=0 ){
//             	 $.alert("请选择个人金融资产承诺书");
// 	       		  return;
//             	}
            	else if("-1"==$('#projectTransferType').val()){
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
            }else if(""==$('#projectCardPeoplename').val()){
              $.alert("发起方收款人姓名不能为空");
              return;
            }else if(""==$('#projectCardProname').val()){
              $.alert("开户行省名不能为空");
              return;
            }else if(""==$('#projectCardCityname').val()){
              $.alert("开户行市名不能为空");
              return;
            }else if($("input[name=projectIsAssignment]:checked").val()==1 && "" ==$("#pfile").val()){
        		$.alert("请上传转让协议")
        		return;
        	}else if($("input[name=projectIsAssignment]:checked").val()==1 &&  "" ==$("#tempaltefile").val()){
        		$.alert("请上传转让协议模板")
        		return;
        	}else if($("input[name=projectIsAssignment]:checked").val()==1 &&  "" ==$("#projectStorageTime").val() || $("#projectStorageTime").val()<0){
        		$.alert("转让存续期不能为空或负数")
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
    </script>
</body>
</html>