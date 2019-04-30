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
                            	<form action="cms/return/repayList.action" method="post" id='searchForm'>
                                <input type="hidden" name="pageIndex" id="pageIndexForm">
                                <div class="col-md-2">
                                    <span class="" >标的ID</span>
                                    <input type="number" class="form-control"  placeholder="请输入标的ID" value="${subjectId}" name="subjectId" >
                                </div>
                                <!-- <div class="col-md-2">
                                    <span class="" >最迟偿付日期</span>
                                    <input type="text" class="form-control" name="repaydate"  placeholder="最迟偿付日期" value="<fmt:formatDate value="${repaydate }" pattern="yyyy-MM-dd"/>"  id="createdate"/>
                                </div> -->
                                  <div class="col-md-2">
                                    <span class="" >标的名称</span>
                                    <input type="text" class="form-control"  placeholder="请输入标的名称" value="${subjectName}" name="subjectName" >
                               	  </div>
                                  <div class="col-md-2">
                                    <span class="" >修改人</span>
                                    <input type="text" class="form-control"  placeholder="请输入修改人" value="${subjectName}" name="subjectName" >
                               	  </div>
                                <div class="col-md-2">
                                      <span class="" >每页数量</span>
                                     <select  name="pageSize"  class="form-control">
                               			<option value="10"  <c:if test="${pageSize == 10 }">selected</c:if>>10条</option>
                               			<option value="20"  <c:if test="${pageSize == 20 }">selected</c:if>>20条</option>
                               			<option value="30"  <c:if test="${pageSize == 30 }">selected</c:if>>30条</option>
                               			<option value="50"  <c:if test="${pageSize == 50 }">selected</c:if>>50条</option>
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
                                        <th>列表ID</th>
                                        <th>项目名</th>
                                        <th class="width30">标的ID列表</th>
                                        <th>还款金额</th>
                                        <th>类型</th>
										<th>最迟偿付日期</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:set var="i" value="1"></c:set>
                                	<c:forEach items="${list}" var="RepayList">
                                    <tr class="odd gradeX" id="${RepayList.repayIds }" data-submoney="${RepayList.strRepayMoney }" data-subjectids="${RepayList.subIds}">
                                   		<td style="text-align:center;">
                                            <input type="checkbox" name="choserepay" value="${RepayList.subIds}">
                                        </td>
                                    	<td><c:if test="${1==RepayList.isRed }"><font color=red /></c:if>${i}</td>
                                        <td>${RepayList.projectName }</td>
                                        <td data-customtitle><c:if test="${1==RepayList.isRed }"><font color=red /></c:if>${RepayList.subIds}</td>
                                        <td><c:if test="${1==RepayList.isRed }"><font color=red /></c:if>${RepayList.strRepayMoney} </td>
                                        <td>
                                        <c:if test="${1==RepayList.type}">还息 </c:if>
                                         <c:if test="${2==RepayList.type}">还息+还本 </c:if>
                                          <c:if test="${3==RepayList.type}">还息 ，还息+还本</c:if>
                                        </td>
                                        <td><c:if test="${1==RepayList.isRed }"><font color=red /></c:if><fmt:formatDate value="${RepayList.repayTime}" pattern="yyyy-MM-dd"/> </td>
                                        <td class="center">
	                                        <shiro:hasPermission name="returnReview">
	                                        <!-- 审核人 -->
	                                        <button class="btn btn-success dialog" data-id="${RepayList.repayIds}" type="button" data-subrmoney="${RepayList.strRepayMoney}" data-subid="${RepayList.subIds}">审核通过</button>
	                                        <button class="btn btn-danger dialog2" data-id="${RepayList.repayIds}" type="button" data-subid="${RepayList.subIds}" name='<fmt:formatDate value="${RepayList.repayTime}" pattern="yyyy-MM-dd"/>'>审核不通过</button>
	                                        </shiro:hasPermission>
	                                        
	                                         <button class="btn btn-info" type="button" onclick="detail('${RepayList.subIds}','<fmt:formatDate value="${RepayList.repayTime}" pattern="yyyy-MM-dd"/>','${RepayList.adminId }')">还款明细</button>
                                        </td>
                                      
                                    </tr>
                                    <c:set var="i" value="${i+1}"></c:set>
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
    
    // var selected={
   	// 		accAdd:function(arg1, arg2){
   	// 			var r1, r2, m;
    //             try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
    //             try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }

    //             m = Math.pow(10, Math.max(r1, r2))
    //             return ((arg1 * m + arg2 * m) / m).toFixed(2)
   	// 		},
   	// 		arr:[],
   	// 		subIds:[],
   	// 		description:'',
    //         cash:0,
   	// 		watch:function(status){
    //             selected.each();
    //             if(this.cash==0){
    //                 $.alert('请选择数据');
    //                 return;
    //             }
    //             var mess = "";
    //             var str= '';
    //             if(2== status){
    //    				str= '合计还款金额：<span class="text-info">'+selected.cash+'</span><br/>';
    //             };
    //             if(3== status){
    //             	str='合计还款金额：<span class="text-info">'+selected.cash+'</span><div class="confirm-title2">请填写理由:<textarea id="textarea9574" style="margin-top:10px;resize:none;" class="form-control"></textarea></div>'	
    //             }
   	// 			$.confirm(str,[{yes:"确定"},{no:'取消'}],function(type,e){
   	// 				if(type=='yes'){
   	// 					$.isLoading.show("数据较大请稍后,正在计算数据中。。。。<span id='pushNum'></span>",true);
   	// 					selected.description=e.find('textarea').val();
   	// 		        	selected.post(status);
   	// 		        }
   	// 		        this.hide();
   	// 		    });	
   	// 		},
   	// 		each:function(){
   	// 			this.arr.splice(0,this.arr.length);
   	// 			this.subIds.splice(0,this.subIds.length);
    //             this.cash=0;
   	// 			$.each($('[name="choserepay"]:checked'),function(i){
   	// 				var parentTr=$(this).parent().parent();
   	// 				selected.arr.push(parentTr[0].id);
   	// 				selected.cash=Number(String(parentTr.data('submoney')).replace(/,/g,'')).add(Number(selected.cash));
   	// 				selected.subIds.push(parentTr.data('subjectids'));
   	// 			});
   	// 		},
   	// 		allselect:function(){
   	// 			$.each($('[name="choserepay"]'),function(){
   	// 				$(this).prop("checked",'true');
   	// 			});
   	// 		},
   	// 		invertselect:function(){
   	// 			$.each($('[name="choserepay"]'),function(){
   	// 				if($(this).prop("checked")){
   	// 					$(this).prop("checked",false)
   	// 				}else{
   	// 					$(this).prop("checked",true)
   	// 				}
   	// 			});
   	// 		},
   	// 		post:function(status){
                
    //             var str =  ""+selected.arr;    
    //             var ids = ""+selected.subIds;
    //             if(status == 2){
	// 				$.ajax({
	// 		    		url:'cms/return/returnMoney.action',
	// 		    		type:'post',
	// 		    		data:{"ids":str,"sids":ids},
	// 		    		success:function(data){
	// 	    				$.isLoading.hide();
	// 		    			if(undefined==data.message){
	// 		    				$.alert('出错了',null,function(){
	// 		    					location.reload();
	// 		    				});
	// 		    			}else{
	// 		    				$.alert(data.message,null,function(){
	// 		    					location.reload();
	// 		    				});
	// 		    			}
	// 		    		}
	// 		    	});
    //             }else if(status == 3){
    //             	reason=e.find('textarea').val();
	// 				$.ajax({
	// 		    		url:'cms/return/reviewFail.action',
	// 		    		type:'post',
	// 		    		data:{"sids":ids,"repayTime":repaytime,"reason":reason},
	// 		    		success:function(data){
	// 	    				$.alert('提交成功','','',1500);
	// 	    				setTimeout(function(){
	// 	    					location.reload();
	// 	    				},1500)
	// 		    		}
	// 		    	});
    //             }
   	// 		}
   	// }
   	// Number.prototype.add = function (arg) {
    //     return selected.accAdd(arg, this);
    // }
    
    
    $(document).ready(function() {
    	$('.dialog').click(function(){
    		var ids=$(this).data('id');
    		var sids=$(this).data('subid');
    		var subRMoney = $(this).data('subrmoney');
    		var str='';
//    			$.ajax({
//         		url:'cms/return/subjectDetail.action',
//         		async: false,
//         		type:'post',
//         		data:{"ids":ids},
//         		success:function(data){
//         			str+='<br/>'+data.message;
//         		}
//         	});
    		$.confirm('<b>确定还款吗?</b><div style="height:40px;">还款金额:'+subRMoney+'元<br/></div>',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
					$.isLoading.show("数据较大请稍后,正在计算数据中。。。。<span id='pushNum'></span>",true);
					$.ajax({
			    		url:'cms/return/returnMoney.action',
			    		type:'post',
			    		data:{"ids":ids,"sids":sids},
			    		success:function(data){
		    				$.isLoading.hide();
			    			if(undefined==data.message){
			    				$.alert('出错了',null,function(){
			    					location.reload();
			    				});
			    			}else{
			    				$.alert(data.message,null,function(){
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
    		var sids=$(this).data('subid');
    		var repaytime=$(this).attr('name');
    		var reason ='';
    		$.confirm('<div class="confirm-title2">请填写不通过理由:<textarea id="textarea9574" style="margin-top:10px;resize:none;" class="form-control"></textarea></div>',[{yes:'确定'},{no:'取消'}],function(type,e){
    			if(type=='yes'){
    				reason=e.find('textarea').val();
					$.ajax({
			    		url:'cms/return/reviewFail.action',
			    		type:'post',
			    		data:{"sids":sids,"repayTime":repaytime,"reason":reason},
			    		success:function(data){
		    				$.alert('提交成功','','',1500);
		    				setTimeout(function(){
		    					location.reload();
		    				},1500)
			    		}
			    	});
		        }
		       	this.hide();	 
		    });	
    	})
    	$('.dialog3').click(function(){
    		var ids=$(this).data('id');
    		var sids=$(this).data('subid');
    		var repaytime=$(this).attr('name');
    		var pid = $(this).data('proid');
    		var subRMoney = $(this).data('subrmoney');
    		var str='';
    		$.confirm('<b>提交审核吗？</b><div style="height:40px;">还款金额:'+subRMoney+'元<br/></div>',[{yes:'确定'},{no:'取消'}],function(type,e){
				if(type=='yes'){
					$.ajax({
			    		url:'cms/return/submit.action',
			    		type:'post',
			    		data:{"pId":pid,"repayTime":repaytime,"ids":ids,"sids":sids},
			    		success:function(data){
		    				$.alert(data.message,'','',1500);
		    				setTimeout(function(){
		    					location.reload();
		    				},1500)
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
    //还款明细
    // function detail(subjectIds,repaymentExpectedRepayTime,adminId){
    // 	window.location.href="${basePath}cms/return/returnDetailList.action?subjectIds="+subjectIds+"&repaymentExpectedRepayTime="+repaymentExpectedRepayTime+"&adminId="+adminId;
    // }


    </script>

</body>

</html>
