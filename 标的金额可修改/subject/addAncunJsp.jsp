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
                        <li class="active">标的管理</li>
                        <li class="active">安存凭证添加</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
            <form action="cms/subject/addAncun.action" class="form-horizontal" method="post" enctype="multipart/form-data">
                      <div class="form-group">
                        <label class="col-md-2 control-label">请输入渠道名称：</label>
                        <div class="col-md-3">
                          <input type="text" id="channelName" name="channelName" class="form-control " required placeholder="渠道名称" >
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">请输入展示的期名称：</label>
                        <div class="col-md-3">
                          <input type="text" id="subjectStageShowName" name="subjectStageShowName" class="form-control " required placeholder="展示的期名称" >
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">请输入年化收益（精确至小数点后一位）：</label>
                        <div class="col-md-3">
                          <input type="text" id="apr" name="apr" class="form-control " required placeholder="年化收益（精确至小数点后一位）" >
                        </div>
                        <span>%</span>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">请输入发标金额（精确至小数点后两位）：</label>
                        <div class="col-md-3">
                          <input type="text" id="account" name="account" class="form-control " required placeholder="发标金额（精确至小数点后两位）" >
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">请输入还款期限：</label>
                        <div class="col-md-3">
                          <input type="text" id="timelimit" name="timelimit" class="form-control " required placeholder="还款期限" >
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                          <label class="col-md-2 control-label">还款期限单位：</label>
                          <div class="col-md-3">
                              <div class="radio">
                                  <label>
                                  <input type="radio" name="timelimitType" value="1" checked="checked">个月
                                  </label>
                              </div>
                              <div class="radio">
                                  <label>
                                  <input type="radio" name="timelimitType" value="2">天
                                  </label>
                              </div>
                          </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">请输入收益方式：</label>
                        <div class="col-md-3">
                          <input type="text" id="repayStyle" name="repayStyle" class="form-control " required placeholder="收益方式" >
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">请输入投标金额（精确至小数点后两位）：</label>
                        <div class="col-md-3">
                          <input type="text" id="tendermoney" name="tendermoney" class="form-control " required placeholder="投标金额（精确至小数点后两位）" >
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                          <label class="col-md-2 control-label">请输入购买时间：</label>                
                          <div class="col-md-3">
                          <input type="text" class="form-control" name="buytime" placeholder="请输入购买时间" id="buytime" />
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">请输入付息方式：</label>
                        <div class="col-md-3">
                          <input type="text" id="remark" name="remark" class="form-control " required placeholder="付息方式" >
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">请输入投资用户真实姓名：</label>
                        <div class="col-md-3">
                          <input type="text" id="username" name="username" class="form-control " required placeholder="真实姓名" >
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">请输入投资用户身份证号码：</label>
                        <div class="col-md-3">
                          <input type="text" id="cardId" name="cardId" class="form-control " required placeholder="身份证号码" >
                        </div>
                      </div>
                      <br/>
                      
                      <div class="form-group">
                        <label class="col-md-2 control-label"></label>
                        <div class="col-md-8">
                            <div class="center-box">
                                <button type="button" class="btn btn-info" onclick="selectordernum()">确认添加</button>
                    			<button type="submit" style="display: none" id="tijiao" class="btn btn-info">提交</button>
                            </div>
                        </div>
                    </div>
                      
                      
                    
               </form>
            </div>
        </div>
    <script>
        $(document).ready(function() {
        var start = {
            elem: '#buytime',
            min: '1990-04-10 23:59:59', //设定最小日期为当前日期
            max: '2099-06-16 23:59:59', //最大日期
            istime: true,
            format: 'YYYY-MM-DD hh:mm:ss',
            istoday: false, //是否显示今天
        };
        laydate(start);
        
    });
    function selectordernum(){
      var channelName = $('#channelName').val();
      var subjectStageShowName = $('#subjectStageShowName').val();
      var apr = $('#apr').val();
      var account = $('#account').val();
      var timelimit = $('#timelimit').val();
      var repayStyle = $('#repayStyle').val();
      var tendermoney = $('#tendermoney').val();
      var buytime = $('#buytime').val();
      var remark = $('#remark').val();
      var username = $('#username').val();
      var cardId = $('#cardId').val();
      if(channelName == null || channelName==""){
        $.alert("渠道名称不能为空");
        return;
      }
      if(subjectStageShowName == null || subjectStageShowName==""){
        $.alert("展示的期名称不能为空");
        return;
      }
      if(apr == null || apr==""){
        $.alert("年化利率不能为空");
        return;
      }
      if(account == null || account==""){
        $.alert("发标金额不能为空");
        return;
      }
      if(timelimit == null || timelimit==""){
        $.alert("还款期限不能为空");
        return;
      }
      if($("input:radio[name='timelimitType']:checked").length == 0){
        $.alert("还款期限单位不能为空");
        return;
      }
      if(repayStyle == null || repayStyle==""){
        $.alert("收益方式不能为空");
        return;
      }
      if(tendermoney == null || tendermoney==""){
        $.alert("投标方式不能为空");
        return;
      }
      if(buytime == null || buytime==""){
        $.alert("购买时间不能为空");
        return;
      }
      if(remark == null || remark==""){
        $.alert("付息方式不能为空");
        return;
      }
      if(username == null || username==""){
        $.alert("真实姓名不能为空");
        return;
      }
       if(cardId == null || cardId==""){
        $.alert("身份证号码不能为空");
        return;
      }
      else{
        $('#tijiao').click();
      }  
    }
    </script>
</body>
</html>