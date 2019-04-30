<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common_util/path.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <base href="<%=basePath %>" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@ include file="../util/title.jsp" %>
    <link href="css/cms/dist/bootstrap.min.css" rel="stylesheet">
    <link href="css/cms/dist/fontface.css" rel="stylesheet">
    <link href="css/cms/dist/global.css" rel="stylesheet">
    <link rel="stylesheet" href="/js/cms/dist/js/dialog/dialog.css">
    <script src="/js/cms/dist/js/jquery.min.js"></script>
    <script src="/js/cms/dist/js/bootstrap.min.js"></script>
    <script src="/js/cms/dist/js/dialog/dialog-jquery.js"></script>
    
    <style>
        .dialog{position: fixed;top: 50%;left: 50%;transform:translate(-50%,-50%);background: #fff;border: 1px solid #9b9d9e;border-radius: 30px;z-index: 999;}
        .dialog .title{position: relative;width: 100%;height: 60px;line-height: 60px;text-indent: 20px;font-size: 18px;color: #000;font-weight: bold;margin: 0;border-bottom: 1px solid #9b9d9e;}
        .dialog .title .close-btn{position: absolute;width: 20px;height: 20px;cursor: pointer;font-size: 18px;text-align: center;line-height: 20px;right: 40px;top: 50%;transform:translate(0,-50%);color: #000;text-decoration: none;font-style: normal;}
        .dialog .dialog-table,.dialog .dialog-table td,.dialog .dialog-table th{border: 1px solid #9b9d9e;white-space: nowrap;}
        .dialog .dialog-table{margin: 20px 20px;}
        .dialog .dialog-table td,.dialog .dialog-table th{text-align: center;padding: 10px 15px;}
        .dialog .dialog-table .operation-btn{display: inline-block;padding: 0 10px;width: max-content;height: 20px;line-height: 20px;font-size: 15px;color: #fff;text-align: center;background: #5caaf8;border-radius: 10px;vertical-align: middle;cursor: pointer;}
        
        #modifyTitle {
            text-align: center;
            display: none;
        }
    </style>
</head>

<body>


    <div id="wrapper" class="edit-page">
        <!-- 头部和侧边栏 -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
            <%@ include file="../util/top.jsp" %>
            <%@ include file="../util/left.jsp" %>
        </nav>
        <!-- 主体部分 -->
        <div id="page-wrapper">
            <!-- 导航栏 -->
            <div class="row page-nav">
                <div class="col-md-12">
                    <ol class="breadcrumb">
                        <li class="active">标的管理</li>
                        <li class="active">修改标的金额</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row form-horizontal" >
                <div class="col-lg-12">
                    <h3 id="modifyTitle"></h3>  
                    <div class="form-group">
                                    <label class="col-md-2 control-label">标的名称：</label>
                                    <div class="col-md-3">
                                        <p class="form-control-static">
                                            <span class="">${subject.subjectName}</span>
                                        </p>
                                    </div>
                    </div>
        
                    <div class="form-group">
                                    <label class="col-md-2 control-label">标的金额：</label>
                                    <div class="col-md-3">
                                        <p class="form-control-static">
                                            <span class="">${subject.subjectMoney}</span>
                                        </p>
                                    </div>
                    </div>
        
                    <div class="form-group">
                                    <label class="col-md-2 control-label">已募金额：</label>
                                    <div class="col-md-3">
                                        <p class="form-control-static">
                                            <span class="">${subject.subjectAlreadyInvest}</span>
                                        </p>
                                    </div>
                    </div>
        
                    <div class="form-group">
                                    <label class="col-md-2 control-label">标的余额：</label>
                                    <div class="col-md-3">
                                        <p class="form-control-static">
                                            <span class="">${subject.subjectMoney - subject.subjectAlreadyInvest}</span>
                                        </p>
                                    </div>
                    </div>
        
                    <div class="form-group" id="selectMethod">
                                <label class="col-md-2 control-label">请选择修改方式：</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="modifyWay">
                                        <option value="0">请选择</option>
                                        <option value="1">从项目余额中取额度</option>
                                        <option value="2">从其他标的中取额度</option>
                                        <option value="3">减少标的金额</option>
                                    </select>
                                </div>
                    </div>
        
                    <div class="form-group" >
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-8">
                                    <div class="center-box">
                                        <button type="button" class="btn btn-info btn-save" id="nextBtn">下一步</button>
                                        <button type="button" class="btn btn-warning" id="returnToList">返回</button>
                                    </div>
                                </div>
                    </div>
        
                    <div class="formProject" style="display:none;">
                                <!-- <h1>从项目余额中取额度</h1> -->
                                <!-- <div class="form-group" >
                                    <label class="col-md-2 control-label">从项目余额中取额度：</label>
                                    <div class="col-md-8">
                                        <div class="center-box">
                                        </div>
                                    </div>
                                </div> -->
        
                                <div class="form-group">
                                    <label class="col-md-2 control-label">项目余额：</label>
                                    <div class="col-md-3">
                                        <p class="form-control-static">
                                            <span class="">${project.projectNosplitSubjectMoney}</span>
                                        </p>
                                    </div>
                                </div>
        
                                <div class="form-group "  >
                                    <label class="col-md-2 control-label">新增标的金额：</label>
                                    <div class="col-md-2">
                                        <div class="input-group">
                                            <input type="number"  class="form-control changeAmount"  required placeholder="请输入金额" value=""/>
                                            <div class="input-group-addon">元</div>
                                        </div>
                                    </div>
                                </div>
        
                                <div class="form-group" >
                                    <label class="col-md-2 control-label">确认新增金额：</label>
                                    <div class="col-md-2">
                                        <div class="input-group">
                                            <input type="number"  class="form-control ConfirmChangeAmount"  required placeholder="请输入金额" value=""/>
                                            <div class="input-group-addon">元</div>
                                        </div>
                                    </div>
                                </div>
        
                                <div class="form-group" >
                                    <label class="col-md-2 control-label"></label>
                                    <div class="col-md-8">
                                        <div class="center-box">
                                            <button type="button" class="btn btn-info btn-save comfirmModify" >确认修改</button>
                                            <button type="button" class="btn btn-warning cancel">取消</button>
                                        </div>
                                    </div>
                                </div>
                    </div>
        
                    <div class="reduceAmount" style="display:none;">
                                <!-- <h1>减少标的金额</h1> -->
                                <!-- <div class="form-group" >
                                    <label class="col-md-2 control-label">减少标的金额：</label>
                                    <div class="col-md-8">
                                        <div class="center-box">
                                        </div>
                                    </div>
                                </div>  -->
        
                                <div class="form-group" >
                                    <label class="col-md-2 control-label">减少标的金额：</label>
                                    <div class="col-md-2">
                                        <div class="input-group">
                                            <input type="number"  class="form-control changeAmount"  required placeholder="请输入金额" value=""/>
                                            <div class="input-group-addon">元</div>
                                        </div>
                                    </div>
                                </div>
        
                                <div class="form-group" >
                                    <label class="col-md-2 control-label">确认减少金额：</label>
                                    <div class="col-md-2">
                                        <div class="input-group">
                                            <input type="number"  class="form-control ConfirmChangeAmount"  required placeholder="请输入金额" value=""/>
                                            <div class="input-group-addon">元</div>
                                        </div>
                                    </div>
                                </div>
        
                                <div class="form-group" >
                                    <label class="col-md-2 control-label"></label>
                                    <div class="col-md-8">
                                        <div class="center-box">
                                            <button type="button" class="btn btn-info btn-save comfirmModify" >确认修改</button>
                                            <button type="button" class="btn btn-warning cancel">取消</button>
                                        </div>
                                    </div>
                                </div>
                    </div>
        
                    <div class="formOtherSubject" style="display:none;">
                                <!-- <h1>从其他标的中取额度</h1> -->
                                <!-- <div class="form-group" >
                                    <label class="col-md-2 control-label">从其他标的中取额度：</label>
                                    <div class="col-md-3">
                                            <p class="form-control-static">
                                                <span class="">被取用金额标的</span>
                                            </p>
                                    </div>
                                </div> -->
        
        
                                <div id="otherSubject">
                                </div>
        
                                <div class="form-group" >
                                    <label class="col-md-2 control-label">取用金额：</label>
                                    <div class="col-md-2">
                                        <div class="input-group">
                                            <input type="number"  class="form-control changeAmount"  required placeholder="请输入金额" value=""/>
                                            <div class="input-group-addon">元</div>
                                        </div>
                                    </div>
                                </div>
            
                                <div class="form-group" >
                                    <label class="col-md-2 control-label">确认取用金额：</label>
                                    <div class="col-md-2">
                                        <div class="input-group">
                                            <input type="number"  class="form-control ConfirmChangeAmount"  required placeholder="请输入金额" value=""/>
                                            <div class="input-group-addon">元</div>
                                        </div>
                                    </div>
                                </div>                       
        
                                <div class="form-group" >
                                    <label class="col-md-2 control-label"></label>
                                    <div class="col-md-8">
                                        <div class="center-box">
                                            <button type="button" class="btn btn-info btn-save comfirmModify" >确认修改</button>
                                            <button type="button" class="btn btn-warning cancel">取消</button>
                                        </div>
                                    </div>
                                </div>
        
                    </div>
        
                          <!-- /.row -->
                    <div class="dialog" id="dialog-box" style="display:none">
                                <h3 class="title">请选择标的<i class="close-btn" onclick="dialogClose()">X</i></h3>
                                <table class="dialog-table" id="dialog-tableItem">
                                
                                </table>
                    </div>
                </div>
            </div>
    
        </div>
    </div>    

    <script>
        // 标的id
        var initSubjectId  = '${subject.subjectId}'
        var initSubjectAlreadyInvest  = '${subject.subjectAlreadyInvest}'
        var initSubjectMoney  = '${subject.subjectMoney}'
        var initProjectNosplitSubjectMoney  = '${project.projectNosplitSubjectMoney}'
            
        // 返回到审核通过标的页面
        $('#returnToList').click(function(){
            window.location.href="${basePath}/cms/subject/list.action?state=1"
        })

        // 下一步按钮的点击事件
        $('#nextBtn').click(function(e) {
            var modifyWay = $("#modifyWay").val();
            // 没有选择修改方式
            if(modifyWay == 0) {
                $.alert("请选择修改方式")
                return false
            }
    
            // 修改方式不一样，显示不一样的div
            if(modifyWay == 1) {  // 从项目余额中取额度
                //如果项目余额为0 
                if(parseInt(initProjectNosplitSubjectMoney) <= 0) {
                    $.alert('该标的项目余额为0，请选择其他方式')
                } else {
                    // 隐藏选择修改方式以及下一步返回按钮
                    $('#selectMethod').hide()
                    $('#nextBtn').parent().parent().parent().hide()
                    $('#modifyTitle').show().html('从项目余额中取额度')
                    $('.formProject').show()
                    $('.formOtherSubject').hide()
                    $('.reduceAmount').hide()
                }
            } else if(modifyWay == 2) {
                // 从其他标的中取额度
                // 获取数据
    
                $.ajax({
                            type: "get",
                            url: "cms/subject/getAllSubjectById.action",
                            // url: "cms/subject/getAllSubjectById.action",
                            data: {
                                subjectId: initSubjectId
                            },
                            success: function(data) {
                                if (data.message == "success") {
                                    // 如果所有的数据中的余额均为0，也不展示弹出框
                                    var isNoUsefulSubject = false
                                    for(var i = 0; i< data.data.subjectList.length; i++) {
                                        if((data.data.subjectList[i].subjectMoney - data.data.subjectList[i].subjectAlreadyInvest)!=0) {
                                            isNoUsefulSubject = true
                                        }
                                    }
                                    //数据请求成功
                                    if (data.data.subjectList  && data.data.subjectList.length > 0 && isNoUsefulSubject) {
                                        // 有数据
                                        window.allOtherSubject = data.data.subjectList
                                        var fragElement = document.createDocumentFragment();
                                        var thItem = document.createElement('tr');
                                        thItem.innerHTML = '<tr><th>标的ID</th><th>标的名称</th><th>标的金额（元）</th><th>标的余额（元）</th><th>操作</th></tr>'
                                        fragElement.appendChild(thItem)
                                        for (var i = 0; i < window.allOtherSubject.length; i++) {
                                            // 如果余额为0则不展示
                                            if((window.allOtherSubject[i].subjectMoney-window.allOtherSubject[i].subjectAlreadyInvest) != 0) {
                                                var item = document.createElement('tr');
                                                item.setAttribute("class", "content-tr");
                                                item.innerHTML = '<td>' + window.allOtherSubject[i].subjectId + '</td><td>' + window.allOtherSubject[i]
                                                    .subjectName + '</td><td>' + window.allOtherSubject[i].subjectMoney  + '</td><td>' + (window.allOtherSubject[i].subjectMoney-window.allOtherSubject[i]
                                                    .subjectAlreadyInvest) + '</td><td><div class="operation-btn" onclick="checkSubject(' + window.allOtherSubject[i].subjectId +
                                                    ')">选择</div></td>';
                                                fragElement.appendChild(item);
                                            }
                                        }
                                        $('#dialog-tableItem').html(fragElement);
                                        // 显示遮罩层
                                        $('#dialog-box').slideDown(500);
                                    } else {
                                        // 没有数据
                                        $.alert('没有符合条件的标的列表！');
                                    }
                                } else {
                                    $.alert(data.msg);
                                }
                            }
                        })
            } else{  // 减少标的金额
                // 如果标的余额为0,则不可减少
                if((initSubjectMoney-initSubjectAlreadyInvest)<=0) {
                    $.alert('该标的余额已经为0')
                }else {
                // 隐藏选择修改方式以及下一步返回按钮
                $('#selectMethod').hide()
                $('#nextBtn').parent().parent().parent().hide()
                $('.formProject').hide()
                $('.formOtherSubject').hide()
                $('.reduceAmount').show()
                $('#modifyTitle').show().html('减少标的金额')
                }
            }
            
        })


        // 点击确认修改后请求的ajax
        function comfirmModifyAjax(data){
            $.ajax({
                type: "post",
                url: "cms/subject/subjectTransferBalance.action",
                dataType: "json",
                data: data,
                success: function (data) {
                    if (data.message == "success") {
                        window.location.href="${basePath}/cms/subject/list.action?state=1"
                    }else {
                        $.alert(data.msg);
                    }
                }
            })
        }
        // 如果没有输入金额，或者输入的金额两次不一致，则弹出警告
        function EnsureConsistentAmounts(amount,confirmamount) {
            var isMoneyCorrect = true
            if(!amount) {
                $.alert('请输入金额')
                isMoneyCorrect = false
                return isMoneyCorrect;
            } 
            if(!confirmamount) {
                $.alert('请输入确认金额')
                isMoneyCorrect = false
                return isMoneyCorrect;
            }
            if(amount !== confirmamount ) {
                $.alert('两次输入的金额不一致，请确认')
                isMoneyCorrect = false
                return isMoneyCorrect;
            }
            return isMoneyCorrect;
        }

        $('.formProject .comfirmModify').click(function(){
            var amount = $('.formProject .changeAmount').val()
            var confirmamount = $('.formProject .ConfirmChangeAmount').val()
            // 如果没有输入金额，或者输入的金额两次不一致，则return false
            if(!EnsureConsistentAmounts(amount,confirmamount)){
                return false
            }
            // 如果输入的金额大于项目余额
            if(parseInt(initProjectNosplitSubjectMoney) < parseInt(amount)) {
                $.alert('新增标的金额应小于或等于项目余额')
                return false
            }
            var data = {
                subjectId: initSubjectId,
                amount: amount
            }
            console.log(data)
            comfirmModifyAjax(data)
            
        })
    
        $('.formOtherSubject .comfirmModify').click(function(){
            var amount = $('.formOtherSubject .changeAmount').val()
            var confirmamount = $('.formOtherSubject .ConfirmChangeAmount').val()
            // 如果没有输入金额，或者输入的金额两次不一致，则return false
            if(!EnsureConsistentAmounts(amount,confirmamount)){
                return false
            }
            // 如果输入的金额大于其他标的的余额
            if(parseInt(amount) > parseInt($('#leftAmount').text())) {
                $.alert('取用金额应小于或等于被取金额标的余额')
                return false
            }

            // 如果已募金额为0，则不可转成全部金额
            // console.log($('#alreadyInv').text())
            if(parseInt($('#alreadyInv').text()) == 0) {
                $.alert('被取金额标的已募金额为0，不可全部转出')
                return false
            }
    
            var data = {
                subjectId: initSubjectId,
                fromSubejectId: $('#selectedSubjectId').val(),
                amount: amount
            }
            console.log(data)
            comfirmModifyAjax(data)
            
        })
    
        $('.reduceAmount .comfirmModify').click(function(){
            // 减少时需要传递负值过去 
            var amount = -parseInt($('.reduceAmount .changeAmount').val())
            var confirmamount =parseInt( $('.reduceAmount .ConfirmChangeAmount').val())
            // 如果没有输入金额，或者输入的金额两次不一致，则return false
            if(!EnsureConsistentAmounts(-amount,confirmamount)){
                return false
            }
            // 如果输入的金额大于本标的的余额
            if(parseInt(initSubjectMoney - initSubjectAlreadyInvest) < parseInt(-amount)) {
                $.alert('输入的金额小于或等于本标的的余额')
                return false
            }
            // 如果已募金额为0，则不可转成全部金额
            if(parseInt(initSubjectAlreadyInvest)==0 && parseInt(-amount) == parseInt(initSubjectMoney)) {
                $.alert('已募金额为0，不可转成标的全部金额')
                return false;
            }
            var data = {
                subjectId: initSubjectId,
                amount: amount
            }
            console.log(data)
            comfirmModifyAjax(data)           
               
    
        })
    
    
        // 取消按钮
        $('.cancel').click(function() {
            // 清空所有之前输入的值
           $('.formProject .changeAmount').val('')
           $('.formProject .ConfirmChangeAmount').val('')
           $('.formOtherSubject .changeAmount').val('')
           $('.formOtherSubject .ConfirmChangeAmount').val('')
           $('.reduceAmount .changeAmount').val('')
           $('.reduceAmount .ConfirmChangeAmount').val('')
           // 隐藏全部修改金额方式的div
           $('.formProject').hide()
            $('.formOtherSubject').hide()
            $('.reduceAmount').hide()
            // 显示选择修改方式以及下一步和返回按钮
            $('#selectMethod').show()
            $('#nextBtn').parent().parent().parent().show()
            // 重置选择修改方式
            $("#modifyWay").val(0)
            // 隐藏标题
            $('#modifyTitle').hide().html('')  
        })
    
        // 模态框中的选择按钮
        function checkSubject(id) {
            // 隐藏选择修改方式以及下一步返回按钮
            $('#selectMethod').hide()
            $('#nextBtn').parent().parent().parent().hide()            
            // 关闭遮罩层
            dialogClose()
    
            // 找到选择的那一列数据
            var lineData = findDataById(window.allOtherSubject,id)
            // 
            // 动态生成页面
            var otherSubjectHtml = ''
            otherSubjectHtml += '<input type="hidden" name="pageIndex" id="selectedSubjectId"  value="'+id+'">'  // 用于传递被取金额的项目的id
            otherSubjectHtml += '<div class="form-group"><label class="col-md-2 control-label">被取金额标的名称：</label><div class="col-md-3"><p class="form-control-static"><span class="">'+ lineData.subjectName +'</span></p></div></div>'
            otherSubjectHtml += '<div class="form-group"><label class="col-md-2 control-label">标的金额：</label><div class="col-md-3"><p class="form-control-static"><span class="">'+ lineData.subjectMoney +'</span></p></div></div>'
            otherSubjectHtml += '<div class="form-group"><label class="col-md-2 control-label">已募金额：</label><div class="col-md-3"><p class="form-control-static"><span class=""  id="alreadyInv">'+ lineData.subjectAlreadyInvest +'</span></p></div></div>'
            otherSubjectHtml += '<div class="form-group"><label class="col-md-2 control-label ">标的余额：</label><div class="col-md-3"><p class="form-control-static"><span  id="leftAmount" class="" >'+  (lineData.subjectMoney-lineData.subjectAlreadyInvest) +'</span></p></div></div>'
            $('#otherSubject').html(otherSubjectHtml)
            // 显示当前方式，隐藏其他方式的div
            $('.formProject').hide()
            $('#modifyTitle').show().html('从其他标的中取额度')  //新增
            $('.formOtherSubject').show()
            $('.reduceAmount').hide()
        }

        // 从数组array中找到其中一项，这一项的subjectId与传入的id一致
        function findDataById(array,id) {
            var data
            $.each(array,function(index,value){
                if(value.subjectId == id) {
                    data = value
                    return
                }
            })
            return data
        }
        // 项目余额
        // 关闭弹出层
        function dialogClose() {
            $('#dialog-box').slideUp(500);
        }
    
        </script>

</body>

</html>