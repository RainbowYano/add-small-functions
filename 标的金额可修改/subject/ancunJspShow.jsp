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
                        <label class="col-md-2 control-label">渠道名称：</label>
                        <div class="col-md-3">
                          <input type="text" id="channelName" name="channelName" class="form-control " readonly="readonly" value="${channelName}">
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">展示的期名称：</label>
                        <div class="col-md-3">
                          <input type="text" id="subjectStageShowName" name="subjectStageShowName" readonly="readonly" class="form-control " value="${subjectStageShowName}" >
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">年化收益：</label>
                        <div class="col-md-3">
                          <input type="text" id="apr" name="apr" class="form-control " readonly="readonly" value="${apr}" >
                        </div>
                        <span>%</span>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">发标金额：</label>
                        <div class="col-md-3">
                          <input type="text" id="account" name="account" class="form-control " readonly="readonly" value="${account}" >
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">还款期限：</label>
                        <div class="col-md-3">
                          <input type="text" id="timelimit" name="timelimit" class="form-control " readonly="readonly" value="${timelimit}">
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">收益方式：</label>
                        <div class="col-md-3">
                          <input type="text" id="repayStyle" name="repayStyle" class="form-control " readonly="readonly" value="${repayStyle}" >
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">投标金额：</label>
                        <div class="col-md-3">
                          <input type="text" id="tendermoney" name="tendermoney" class="form-control " readonly="readonly" value="${tendermoney}" >
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                          <label class="col-md-2 control-label">购买时间：</label>                
                          <div class="col-md-3">
                          <input type="text" class="form-control" name="buytime" id="buytime" readonly="readonly" value="<fmt:formatDate value='${buytime}' pattern='yyyy-MM-dd HH:mm:ss'/>"/>
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">付息方式：</label>
                        <div class="col-md-3">
                          <input type="text" id="remark" name="remark" class="form-control " readonly="readonly" value="${remark}">
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">投资用户真实姓名：</label>
                        <div class="col-md-3">
                          <input type="text" id="username" name="username" class="form-control " readonly="readonly" value="${username}" >
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="col-md-2 control-label">投资用户身份证号码：</label>
                        <div class="col-md-3">
                          <input type="text" id="cardId" name="cardId" class="form-control " readonly="readonly" value="${cardId}">
                        </div>
                      </div>
                      <br/>
                       <div class="form-group">
                        <label class="col-md-2 control-label">安存保全号：</label>
                        <div class="col-md-3">
                          <input type="text" id="recordNo" name="recordNo" class="form-control " readonly="readonly" value="${recordNo}">
                        </div>
                      </div>
                      <br/>
               </form>
            </div>
        </div>
    <script>
    </script>
</body>
</html>