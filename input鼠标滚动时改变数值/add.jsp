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
  <style>
    .oldImgContainer img {
      vertical-align: top;
      cursor: pointer;
      width: 100%;
    }

    .oldImgContainer {
      display: flex;
    }

    .oldImgContainer .img {
      /* position: relative; */
      display: flex;
      vertical-align: middle;
      align-items: middle;
      margin-right: 10px;
      width: 250px;
      height: 200px;
      overflow: hidden;
    }

    .oldImgContainer .img button {
      position: absolute;
      background-color: #00B7EE;
      border: none;
      width: 48px;
      color: #fff;
      border-radius: 3px;
    }

    .oldImgContainer .img button:hover {
      cursor: pointer;
      background-color: #00A2D4;
    }

    .useOldBtn {
      background-color: #00B7EE;
      color: #fff;
      border: none;
      border-radius: 5px;
      margin: 8px 0;
    }

    .useOldBtn:hover {
      cursor: pointer;
      background-color: #00A2D4;
    }

    .notice {
      color: red;
      font-size: 12px;
    }
  </style>
</head>

<body>

  <!-- 点击预览图片的遮罩层 -->
  <div id="outerdiv"
    style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:999999999999999;width:100%;height:100%;display:none;">
    <div id="innerdiv" style="position:absolute;">
      <img id="bigimg" style="border:5px solid #fff;" src="" />
    </div>
  </div>

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
            <li class="active">用户预备投资管理</li>
            <li class="active">新增</li>
          </ol>
        </div>
      </div>
      <!-- /.row -->
      <div class="row">
        <form action="" class="form-horizontal mainform" method="post" enctype="multipart/form-data">
          <!-- 图片回显时传参的input -->
          <input type="hidden" value="" name="reuseFileIds" id="reuseFileIds">

          <div style="text-align:center;">
            <div class="center-box btn-group">
              <button type="button" class="btn btn-default btn-primary" id="first">投资项目信息</button><button id="second"
                type="button" class="btn btn-default">用户基本信息</button>
            </div>
          </div>
          <div class="col-lg-12" id="firstDiv">
            <div class="form-group">
              <label class="col-md-2 control-label">当前渠道：</label>
              <div class="col-md-2">
                <select name="channelId" class="form-control" onchange="changeChannelId()" id="selectChannelId">
                  <c:forEach items="${channelList }" var="channel">
                    <option value="${channel.channelId }" <c:if test="${channel.channelId == channelId }">selected
                      </c:if>>${channel.channelName }</option>
                  </c:forEach>
                </select>
              </div>
            </div>
            <br />

            <div class="form-group">
              <label class="col-md-2 control-label">请选择项目：</label>
              <div class="col-md-3">
                <div class="form-control-btn" onclick="selectProjectList(1)">请选择项目</div>
              </div>
            </div>
            <br />

            <!--<input type="hidden" id="channelId" value="${channelId}"> -->

            <div id="subjectInfo" style="display:none">
              <div class="form-group">
                <label class="col-md-2 control-label">标的名称：</label>
                <div class="col-md-8">
                  <p class="form-control-static"><span id="subjectName"></span></p>
                </div>
              </div>
              <br />

              <div class="form-group">
                <label class="col-md-2 control-label">标的金额：</label>
                <div class="col-md-8">
                  <p class="form-control-static"><span id="strMoney"></span>元</p>
                </div>
              </div>
              <br />

              <div class="form-group">
                <label class="col-md-2 control-label">已募集金额：</label>
                <div class="col-md-8">
                  <p class="form-control-static"><span id="alreadyInvest"></span>元</p>
                </div>
              </div>
              <br />

              <div class="form-group">
                <label class="col-md-2 control-label">投资百分比：</label>
                <div class="col-md-8">
                  <p class="form-control-static"><span id="rate"></span>%</p>
                </div>
              </div>
              <br />

              <div class="form-group">
                <label class="col-md-2 control-label">认购上下限：</label>
                <div class="col-md-8">
                  <p class="form-control-static"><span id="moneyLimit"></span>元</p>
                </div>
              </div>
              <br />

              <div class="form-group">
                <label class="col-md-2 control-label">递增金额：</label>
                <div class="col-md-8">
                  <p class="form-control-static"><span id="additionalMultiple" data-tofixed></span>元</p>
                </div>
              </div>
              <br />

              <div class="form-group">
                <label class="col-md-2 control-label">年化收益：</label>
                <div class="col-md-8">
                  <p class="form-control-static"><span id="apr"></span>%</p>
                </div>
              </div>
              <br />

              <div class="form-group">
                <label class="col-md-2 control-label"></label>
                <div class="col-md-8">
                  <div class="center-box">
                    <button type="button" class="btn btn-info" onclick="nextDiv()">下一步</button>
                  </div>
                </div>
              </div>
              <br />

              <input type="hidden" id="subjectId" name="subjectId" value="">

            </div>

          </div>
          <div class="col-lg-12" style="display: none;" id="nextDiv">
            <div class="form-group">
              <label class="col-md-2 control-label">用户手机号码：</label>
              <div class="col-md-3">
                <input type="number" class="form-control" id="uPhone" placeholder="请输入用户手机号码" required="required"
                  name="userPhone" onblur="selectUserInfo()">
              </div>
            </div>
            <br />

            <div id="userInfo" style="display:none">
              <div class="form-group">
                <label class="col-md-2 control-label">用户真实姓名：</label>
                <div class="col-md-8">
                  <p class="form-control-static"><span id="userName"></span></p>
                </div>
              </div>
              <br />

              <input type="hidden" id="userId" name="userId" value="">

              <div class="form-group">
                <label class="col-md-2 control-label">用户身份证号码：</label>
                <div class="col-md-8">
                  <p class="form-control-static"><span id="userPersonCard"></span></p>
                </div>
              </div>
              <br />

              <!-- 以前上传的身份证照片 -->
              <div class="form-group">
                <label class="col-md-2 control-label">上传身份证复印件：</label>
                <div class="col-md-9">
                  <button class="useOldBtn" id="idImgBtn" type="button">不使用已上传的照片</button>
                  <div class=" oldImgContainer" id="idImgContainer">
                  </div>
                </div>

              </div>
              <!-- 重新上传 -->
              <div class="form-group">
                <label class="col-md-2 control-label"></label>
                <div class="col-md-9">
                  <div id="userPersonCardImg"></div>
                </div>
              </div>

              <div id="changeUserCardInfoContainer">
                <div class="form-group hasBankInfo">
                    <label class="col-md-2 control-label">用户银行卡卡号：</label>
                    <div class="col-md-3">
                        <select class="form-control"  id="investTransferCardCardnumSelect"></select>
                    </div>
                  <p class="form-control-static text-warning2" onclick="changeUserCardInfo(0)">
                    <i class="fa fa-info-circle fa-fw"></i><span >录入其它银行卡</span>
                  </p>
                </div>
                <div class="form-group none noBankInfo">
                  <label class="col-md-2 control-label">用户银行卡卡号：</label>
                  <div class="col-md-3">
                      <input type="number" class="form-control"
                         onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" onpaste="return false"
                         oncopy="return false"  placeholder="请输入用户银行卡卡号" required="required"
                         name="investTransferCardCardnum" id="investTransferCardCardnum"/>
                  </div>
                  <p id="changeButton1" class="form-control-static text-warning2" onclick="changeUserCardInfo(1)">
                      <i class="fa fa-info-circle fa-fw"></i><span >使用历史银行卡</span>
                  </p>
                </div>

                <div class="form-group none noBankInfo">
                  <label class="col-md-2 control-label">再次输入银行卡卡号：</label>
                  <div class="col-md-3">
                      <input type="number" class="form-control"
                         onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" onpaste="return false"
                         oncopy="return false" id="reinvestTransferCardCardnum" placeholder="请再次输入银行卡卡号"
                         required="required" name="reinvestTransferCardCardnum"/>
                  </div>
                </div>
                <div class="form-group none noBankInfo">
                  <label class="col-md-2 control-label">用户银行卡名称：</label>
                  <div class="col-md-3">
                      <select class="form-control" id="investTransferCardBankSelect"
                              onchange="changeBank()">
                      </select>
                  </div>
                </div>
                <div class="form-group hasBankInfo" id="bankName">
                  <label class="col-md-2 control-label">银行卡名称：</label>
                  <div class="col-md-3">
                      <input type="text" class="form-control" id="investTransferCardBank" placeholder="请输入用户银行卡名称" required="required"
                             name="investTransferCardBank">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-md-2 control-label">用户开户支行：</label>
                  <div class="col-md-3">
                    <input type="text" class="form-control" id="investTransferCardSubbranch" placeholder="请输入用户开户支行"
                      required="required" name="investTransferCardSubbranch">
                  </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">开户行行号：</label>
                    <div class="col-md-3">
                      <input type="number" class="form-control" id="investTransferLineNum" placeholder="请输入开户行行号"
                        required="required" name="investTransferLineNum">
                    </div>
                </div>
              </div>
              <!-- 以前上传的银行卡照片 -->
              <div class="form-group">
                <label class="col-md-2 control-label">上传银行卡复印件：</label>
                <div class="col-md-9">
                  <button class="useOldBtn" id="bankImgBtn" type="button">不使用已上传的照片</button>
                  <div class="oldImgContainer" id="bankImgContainer"></div>
                </div>
              </div>
              <!-- 重新上传 -->
              <div class="form-group">
                <label class="col-md-2 control-label"></label>
                <div class="col-md-9">
                  <div id="userCardImg"></div>
                </div>
              </div>

              <div class="form-group">
                <label class="col-md-2 control-label">用户风险评测等级：</label>
                <div class="col-md-8">
                  <p class="form-control-static"><span id="userRiskTypeName"></span></p>
                </div>
              </div>
              <br />
              <!-- 以前上传的风险评估照片 -->
              <div class="form-group">
                <label class="col-md-2 control-label">上传风险测评材料：</label>
                <div class="col-md-9">
                  <button class="useOldBtn" id="riskImgBtn" type="button">不使用已上传的照片</button>
                  <span class="notice">温馨提示：风险测评材料上传时间超过一年的，需重新上传</span>
                  <div class="oldImgContainer" id="riskImgContainer"></div>
                </div>

              </div>
              <!-- 重新上传 -->
              <div class="form-group">
                <label class="col-md-2 control-label"></label>
                <div class="col-md-9">
                  <div id="userRiskTypeImg"></div>
                </div>
              </div>

              <div class="form-group">
                <label class="col-md-2 control-label">标的余额：</label>
                <div class="col-md-8">
                  <p class="form-control-static"><span id="subjectBalance"></span>元</p>
                </div>
              </div>
              <br />
              <input type="hidden" id="subjectBalanceParse" name="subjectBalanceParse">
              <div class="form-group">
                <label class="col-md-2 control-label">用户投资金额：</label>
                <div class="col-md-3">
                  <div class="input-group">
                    <input type="number" class="form-control" id="iMoney" onpaste="return false" oncopy="return false"
                      onblur="checkIMoney()" placeholder="请输入用户投资金额" required="required"
                      name="investTransferInvestMoney" data-money-ToUpper>
                    <div class="input-group-addon">元</div>
                  </div>
                </div>
              </div>
              <br />

              <div class="form-group">
                <label class="col-md-2 control-label">再次输入用户投资金额：</label>
                <div class="col-md-3">
                  <div class="input-group">
                    <input type="number" class="form-control" id="reIMoney" onpaste="return false" oncopy="return false"
                      onblur="checkReIMoney()" placeholder="请再次输入用户投资金额" required="required"
                      name="reInvestTransferInvestMoney" data-money-ToUpper>
                    <div class="input-group-addon">元</div>
                  </div>
                </div>
              </div>
              <br />


              <div class="form-group">
                <label class="col-md-2 control-label">上传用户转账凭证：</label>
                <div class="col-md-9">
                  <div id="transferImg"></div>
                </div>
              </div>

              <div class="form-group">
                <label class="col-md-2 control-label">用户投资时间：</label>
                <div class="col-md-2">
                  <input class="form-control" type="text" name="investTransferInvestTime" required
                    pattern="yyyy-MM-dd HH:mm:ss" id="datetime" />
                </div>
              </div>
              <br />

              <div class="form-group">
                <label class="col-md-2 control-label"></label>
                <div class="col-md-8">
                  <div class="center-box">
                    <button type="button" class="btn btn-warning" onclick="lastDiv()">上一步</button>
                    <button type="button" class="btn btn-info btn-save" onclick="addSubmit()">保存</button>
                    <button type="button" class="btn btn-danger" onclick="history.go(-1)">取消</button>
                  </div>
                </div>
              </div>
              <br />
            </div>
            <br />
          </div>
        </form>
        <!-- /.col-lg-12 -->
      </div>
        <!-- /.row -->
      <div class="dialog" id="dialog-box-project" style="display:none">
        <h3 class="title">项目选择<i class="close-btn" onclick="dialogClose('dialog-box-project')">X</i></h3>
        <table class="dialog-table" id="dialog-tableItem-project">
            <tr>
                <th>项目ID</th>
                <th>项目名称</th>
                <th>项目金额</th>
                <th>项目余额</th>
                <th>操作</th>
            </tr>
        </table>
        <div class="pagination" id="dialog-pagination-project">
        </div>
      </div>
      <!-- /.row -->
      <div class="dialog" id="dialog-box" style="display:none;left:55%">
        <h3 class="title">标的选择<i class="close-btn" onclick="dialogClose()">X</i></h3>
        <table class="dialog-table" id="dialog-tableItem">
          <tr>
            <th>标的ID</th>
            <th>名称</th>
            <th>金额（元）</th>
            <th>已募集金额（元）</th>
            <th>投资百分比</th>
            <th>认购上下限(元)</th>
            <th>递增金额（元）</th>
            <th>年化收益率</th>
            <th>操作</th>
        </tr>
        </table>
        <div class="pagination" id="dialog-pagination">
        </div>
      </div>
    </div>
    <!-- /#page-wrapper -->
    <link rel="stylesheet" href="assets/global/plugins/html5up/control/css/zyUpload.css" type="text/css">
    <script type="text/javascript" charset="utf-8" src="assets/global/plugins/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="assets/global/plugins/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="assets/global/plugins/ueditor/uploadUE.js"></script>
    <script type="text/javascript" src="assets/global/plugins/html5up/core/zyFile.js"></script>
    <script type="text/javascript" src="assets/global/plugins/html5up/control/js/zyUpload.js"></script>
    <script type="text/javascript" src="assets/global/scripts/bootstrap-table.js"></script>
    <link type="text/css" rel="stylesheet" href="js/cms/dist/js/timepicker/laydate.css">
    <script type="text/javascript" src="js/cms/dist/js/timepicker/laydate.js"></script>
    <style>
      .upload_btn {
        display: none;
      }

      /*.fixed-table-toolbar .bars{display:none!important;}*/
    </style>

    <!-- /#wrapper -->


    <script type="text/javascript">

      // 解决input(type=numeber)鼠标滚动时改变数值大小
      $("#wrapper").on("mousewheel", "input[type='number']", function () {
            // console.log(11)
        return false;
      });

      
      var userPersonCardImgFile = '';
      var userCardImgFile = '';
      var userRiskTypeImgFile = '';
      var transferImgFile = '';
      //回显连带信息缓存
      var cardInfos = {};

      // 最终传回后台的数据
      // var usefulIdImg = [];
      // var usefulBankImg = [];
      // var usefulRiskImg = [];
      // var usefulPayImg = [];

      // // 控制显示与隐藏
      // var idImgFlag = false;
      // var bankImgFlag = false;
      // var riskImgFlag = false;
      // var transferImgFlag = false;

      // 点击预览功能
      $('.oldImgContainer').on('click', '.pimg', function () {
        var _this = $(this); //将当前的pimg元素作为_this传入函数  
        imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
      })
      // 点击预览中显示图片
      function imgShow(outerdiv, innerdiv, bigimg, _this) {
        var src = _this.attr("src"); //获取当前点击的pimg元素中的src属性  
        $(bigimg).attr("src", src); //设置#bigimg元素的src属性  

        /*获取当前点击图片的真实大小，并显示弹出层及大图*/
        $("<img/>").attr("src", src).load(function () {
          var windowW = $(window).width(); //获取当前窗口宽度  
          var windowH = $(window).height(); //获取当前窗口高度  
          var realWidth = this.width; //获取图片真实宽度  
          var realHeight = this.height; //获取图片真实高度  
          var imgWidth, imgHeight;
          var scale = 0.8; //缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放  

          if (realHeight > windowH * scale) { //判断图片高度  
            imgHeight = windowH * scale; //如大于窗口高度，图片高度进行缩放  
            imgWidth = imgHeight / realHeight * realWidth; //等比例缩放宽度  
            if (imgWidth > windowW * scale) { //如宽度扔大于窗口宽度  
              imgWidth = windowW * scale; //再对宽度进行缩放  
            }
          } else if (realWidth > windowW * scale) { //如图片高度合适，判断图片宽度  
            imgWidth = windowW * scale; //如大于窗口宽度，图片宽度进行缩放  
            imgHeight = imgWidth / realWidth * realHeight; //等比例缩放高度  
          } else { //如果图片真实高度和宽度都符合要求，高宽不变  
            imgWidth = realWidth;
            imgHeight = realHeight;
          }
          $(bigimg).css("width", imgWidth); //以最终的宽度对图片缩放  

          var w = (windowW - imgWidth) / 2; //计算图片与窗口左边距  
          var h = (windowH - imgHeight) / 2; //计算图片与窗口上边距  
          $(innerdiv).css({
            "top": h,
            "left": w
          }); //设置#innerdiv的top和left属性  
          $(outerdiv).fadeIn("fast"); //淡入显示#outerdiv及.pimg  
        });

        $(outerdiv).click(function () { //再次点击淡出消失弹出层  
          $(this).fadeOut("fast");
        });
      }


      $(document).ready(function () {
        // 初始化插件
        $("#userPersonCardImg").zyUpload({
          width: "650px", // 宽度
          height: "auto", // 宽度
          itemWidth: "120px", // 文件项的宽度
          itemHeight: "100px", // 文件项的高度
          url: "/upload/UploadAction", // 上传文件的路径
          multiple: true, // 是否可以多个文件上传
          dragDrop: true, // 是否可以拖动上传文件
          del: true, // 是否可以删除文件
          finishDel: false, // 是否在上传文件完成后删除预览
          /* 外部获得的回调接口 */
          onSelect: function (files, allFiles) { // 选择文件的回调方法
            /* console.info("当前选择了以下文件：");
            console.info(files);
            console.info("之前没上传的文件：");
            console.info(allFiles); */
            userPersonCardImgFile = allFiles;
          },
          onDelete: function (file, files) { // 删除一个文件的回调方法
            /* console.info("当前删除了此文件：");
            console.info(file);
            console.info("当前剩余的文件：");
            console.info(surplusFiles); */
            userPersonCardImgFile = files;

          },
          onSuccess: function (file) { // 文件上传成功的回调方法
            /* console.info("此文件上传成功：");
            console.info(file); */
          },
          onFailure: function (file) { // 文件上传失败的回调方法
            /* console.info("此文件上传失败：");
            console.info(file); */
          },
          onComplete: function (responseInfo) { // 上传完成的回调方法
            /* console.info("文件上传完成");
            console.info(responseInfo); */
          }
        });

        $("#userCardImg").zyUpload({
          width: "650px", // 宽度
          height: "auto", // 宽度
          itemWidth: "120px", // 文件项的宽度
          itemHeight: "100px", // 文件项的高度
          url: "/upload/UploadAction", // 上传文件的路径
          multiple: true, // 是否可以多个文件上传
          dragDrop: true, // 是否可以拖动上传文件
          del: true, // 是否可以删除文件
          finishDel: false, // 是否在上传文件完成后删除预览
          /* 外部获得的回调接口 */
          onSelect: function (files, allFiles) { // 选择文件的回调方法
            /* console.info("当前选择了以下文件：");
            console.info(files);
            console.info("之前没上传的文件：");
            console.info(allFiles); */
            userCardImgFile = allFiles;
          },
          onDelete: function (file, files) { // 删除一个文件的回调方法
            /* console.info("当前删除了此文件：");
            console.info(file);
            console.info("当前剩余的文件：");
            console.info(surplusFiles); */
            userCardImgFile = files;

          },
          onSuccess: function (file) { // 文件上传成功的回调方法
            /* console.info("此文件上传成功：");
            console.info(file); */
          },
          onFailure: function (file) { // 文件上传失败的回调方法
            /* console.info("此文件上传失败：");
            console.info(file); */
          },
          onComplete: function (responseInfo) { // 上传完成的回调方法
            /* console.info("文件上传完成");
            console.info(responseInfo); */
          }
        });

        $("#userRiskTypeImg").zyUpload({
          width: "650px", // 宽度
          height: "auto", // 宽度
          itemWidth: "120px", // 文件项的宽度
          itemHeight: "100px", // 文件项的高度
          url: "/upload/UploadAction", // 上传文件的路径
          multiple: true, // 是否可以多个文件上传
          dragDrop: true, // 是否可以拖动上传文件
          del: true, // 是否可以删除文件
          finishDel: false, // 是否在上传文件完成后删除预览
          /* 外部获得的回调接口 */
          onSelect: function (files, allFiles) { // 选择文件的回调方法
            /* console.info("当前选择了以下文件：");
            console.info(files);
            console.info("之前没上传的文件：");
            console.info(allFiles); */
            userRiskTypeImgFile = allFiles;
          },
          onDelete: function (file, files) { // 删除一个文件的回调方法
            /* console.info("当前删除了此文件：");
            console.info(file);
            console.info("当前剩余的文件：");
            console.info(surplusFiles); */
            userRiskTypeImgFile = files;

          },
          onSuccess: function (file) { // 文件上传成功的回调方法
            /* console.info("此文件上传成功：");
            console.info(file); */
          },
          onFailure: function (file) { // 文件上传失败的回调方法
            /* console.info("此文件上传失败：");
            console.info(file); */
          },
          onComplete: function (responseInfo) { // 上传完成的回调方法
            /* console.info("文件上传完成");
            console.info(responseInfo); */
          }
        });

        $("#transferImg").zyUpload({
          width: "650px", // 宽度
          height: "auto", // 宽度
          itemWidth: "120px", // 文件项的宽度
          itemHeight: "100px", // 文件项的高度
          url: "/upload/UploadAction", // 上传文件的路径
          multiple: true, // 是否可以多个文件上传
          dragDrop: true, // 是否可以拖动上传文件
          del: true, // 是否可以删除文件
          finishDel: false, // 是否在上传文件完成后删除预览
          /* 外部获得的回调接口 */
          onSelect: function (files, allFiles) { // 选择文件的回调方法
            /* console.info("当前选择了以下文件：");
            console.info(files);
            console.info("之前没上传的文件：");
            console.info(allFiles); */
            transferImgFile = allFiles;
          },
          onDelete: function (file, files) { // 删除一个文件的回调方法
            /* console.info("当前删除了此文件：");
            console.info(file);
            console.info("当前剩余的文件：");
            console.info(surplusFiles); */
            transferImgFile = files;

          },
          onSuccess: function (file) { // 文件上传成功的回调方法
            /* console.info("此文件上传成功：");
            console.info(file); */
          },
          onFailure: function (file) { // 文件上传失败的回调方法
            /* console.info("此文件上传失败：");
            console.info(file); */
          },
          onComplete: function (responseInfo) { // 上传完成的回调方法
            /* console.info("文件上传完成");
            console.info(responseInfo); */
          }
        });

      });

      $(function () {
        var datetime = {
          elem: '#datetime',
          min: '1990-04-10', //设定最小日期为当前日期
          max: '2099-06-16', //最大日期
          istime: true,
          format: 'YYYY-MM-DD hh:mm:ss',
          istoday: true, //是否显示今天
          choose: function (datas) {
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
          }
        };
        laydate(datetime);

        $("#investTransferCardCardnumSelect").on("change",function(){
            var bankNum = $(this).val();
            var cacheData = cardInfos[bankNum];
            //没有数据的时候
            if(!cacheData){
                return false;
            }
            $("#investTransferCardCardnum").val(cacheData.cardNum||"");
            $("#investTransferCardSubbranch").val(cacheData.cardSubb||"");
            $("#investTransferLineNum").val(cacheData.cardLineNum||"");
            $("#investTransferCardBank").val(cacheData.cardBank||"");
            //先查找缓存中是否已经查询过了
            if(cacheData.fileCache){
                reshowImg(cacheData.fileCache, $("#bankImgContainer"));
            }else if(cacheData.investTransferId){//判断是否又ID
                $.ajax({
                    url: "report/investTransfer/changeUseCard.action",
                    type: "post",
                    dataType: "json",
                    data: {investTransferId:cacheData.investTransferId},
                    success: function(data){
                        cacheData.fileCache = data;
                        reshowImg(data, $("#bankImgContainer"));
                    }
                });
            }else{//没有ID的数据取之用户注册表
                reshowImg([], $("#bankImgContainer"));
            }

        });
        $("#investTransferCardBankSelect").on("change",function(){
          var bank = $(this).val();
          if (bank == -1) {
              $("#investTransferCardBank").val("");
              $('#bankName').show();
          } else {
              $("#investTransferCardBank").val(bank);
              $('#bankName').hide();
          }
        })
      });

      $('#second').click(function () {
        var subjectId = $('#subjectId').val();
        if (subjectId == null || subjectId == '' || subjectId == -1) {
          $.alert('请先选择标的信息！');
          return false;
        };
        $('#firstDiv').hide();
        $('#nextDiv').show();
        $('#first').removeClass('btn-primary');
        $('#second').addClass('btn-primary');
      })

      $('#first').click(function () {
        $('#nextDiv').hide();
        $('#firstDiv').show();
        $('#second').removeClass('btn-primary');
        $('#first').addClass('btn-primary');
      })

      function changeChannelId() {
        var selectChannelId = $('#selectChannelId').val();
        if (selectChannelId == null || selectChannelId == '' || selectChannelId == -1) {
          $.alert('选择的当前渠道异常，请联系管理员！');
          return false;
        }
        window.location.href = "report/investTransfer/changeChannelId.action?channelId=" + selectChannelId;
      }
      function selectProjectList(pageIndex) {
          $('#dialog-tableItem-project tbody tr').remove('.content-tr');
          $('#dialog-pagination-project i').remove('i');
          var channelId = $('#selectChannelId').val();
          if (channelId == null || channelId == '' || channelId == -1) {
              $.alert('渠道选择异常，请联系管理员！');
              return false;
          }
          $.ajax({
              type: "post",
              url: "report/investTransfer/selectProjectList.action",
              dataType: "json",
              data: {
                  channelId: channelId,
                  pageIndex: pageIndex
              },
              success: function (data) {
                  if (data.message == "success") {
                      //数据请求成功
                      var fragElement = document.createDocumentFragment();
                      var paginationElemnt = document.createDocumentFragment();
                      if (data.projectList != null && data.projectList.length > 0) {
                          for (var i = 0; i < data.projectList.length; i++) {
                              var item = document.createElement('tr');
                              item.setAttribute("class", "content-tr");
                              item.innerHTML = '<td>' + data.projectList[i].projectId + '</td><td>' + data.projectList[i]
                                      .projectName + '</td><td>' + data.projectList[i].projectIpoMoney + '</td><td>' + data.projectList[i]
                                      .projectNosplitSubjectMoney + '</td><td><div class="operation-btn" onclick="checkProject(' + data.projectList[i].projectId +
                                  ')">选择</div></td>';
                              fragElement.appendChild(item);
                          }
                          ;
                          for (var i = 0; i < data.totalPage; i++) {
                              var iElement = document.createElement('i');
                              iElement.innerHTML = i + 1;
                              iElement.addEventListener('click', function (e) {
                                  selectPubjectList(e.target.innerText);
                              });
                              console.log(iElement)
                              paginationElemnt.appendChild(iElement);
                          }
                          $('#dialog-pagination-project').append(iElement);
                          $('#dialog-tableItem-project').append(fragElement);
                          $('#dialog-box-project').slideDown(500);
                      } else {
                          $.alert('没有符合条件的项目列表！');
                      }
                  } else {
                      $.alert(data.msg);
                  }
              }
          })
      }

      function checkProject(projectId){
          selectSubjectList(1,projectId);
          dialogClose("dialog-box-project");
      }

      function selectSubjectList(pageIndex,projectId) {
        if(projectId){
            $('#dialog-box').data("projectId",projectId);
        }  else{
            projectId = $('#dialog-box').data("projectId");
        }
        $('#dialog-tableItem tbody tr').remove('.content-tr');
        $('#dialog-pagination i').remove('i');
        var channelId = $('#selectChannelId').val();
        if (channelId == null || channelId == '' || channelId == -1) {
          $.alert('渠道选择异常，请联系管理员！');
          return false;
        }
        $.ajax({
          type: "post",
          url: "report/investTransfer/selectSubjectList.action",
          dataType: "json",
          data: {
            channelId: channelId,
            pageIndex: pageIndex,
            projectId: projectId
          },
          success: function (data) {
            if (data.message == "success") {
              //数据请求成功
              var fragElement = document.createDocumentFragment();
              var paginationElemnt = document.createDocumentFragment();
              if (data.subjectList != null && data.subjectList.length > 0) {
                for (var i = 0; i < data.subjectList.length; i++) {
                  var item = document.createElement('tr');
                  item.setAttribute("class", "content-tr");
                  item.innerHTML = '<td>' + data.subjectList[i].subjectId + '</td><td>' + data.subjectList[i]
                    .subjectName + '</td><td>' + data.subjectList[i].strMoney + '</td><td>' + data.subjectList[i]
                    .alreadyInvest + '</td><td>' + (Number(data.subjectList[i].rate) * 100).toFixed(2) + '%' +
                    '</td><td>' + data.subjectList[i].minmoney + '-' + data.subjectList[i].maxmoney +
                    '</td><td>' + data.subjectList[i].subjectAdditionalMultiple + '</td><td>' + (Number(data
                      .subjectList[i].arnum) * 100).toFixed(2) + '%' +
                    '</td><td><div class="operation-btn" onclick="checkSubject(' + data.subjectList[i].subjectId +
                    ')">选择</div></td>';
                  fragElement.appendChild(item);
                };
                for (var i = 0; i < data.totalPage; i++) {
                  var iElement = document.createElement('i');
                  iElement.innerHTML = i + 1;
                  iElement.addEventListener('click', function (e) {
                    selectSubjectList(e.target.innerText);
                  });
                  console.log(iElement)
                  paginationElemnt.appendChild(iElement);
                }
                $('#dialog-pagination').append(iElement);
                $('#dialog-tableItem').append(fragElement);
                $('#dialog-box').slideDown(500);
              } else {
                $.alert('没有符合条件的标的列表！');
              }
            } else {
              $.alert(data.msg);
            }
          }
        })
        $("body").on('click','.upload_image',function(){
            imgShow("#outerdiv", "#innerdiv", "#bigimg", $(this));
        })
      }

      function checkSubject(id) {
        selectSujectInfo(id);
        dialogClose();
      }

      function dialogClose(dialogId) {
          if(!dialogId){
              $('#dialog-box').slideUp(500);
          }else{
              $("#" + dialogId).slideUp(500);
          }

      }

      function selectSujectInfo(id) {
        if (id == null || id == '' || id == -1) {
          $.alert('标的信息异常，请联系管理员！');
          return false;
        }
        $.ajax({
          type: "post",
          url: "report/investTransfer/selectSujectInfo.action",
          dataType: "json",
          data: {
            subjectId: id
          },
          success: function (data) {
            if (data.message == "success") {
              //数据请求成功
              $('#subjectId').val(id);
              $('#subjectInfo').show();
              $('#subjectName').html(data.subject.subjectName);
              $('#strMoney').html(data.subject.strMoney);
              $('#alreadyInvest').html(data.subject.alreadyInvest);
              $('#rate').html(Math.round(Number(data.subject.rate) * 100));
              $('#moneyLimit').html(data.subject.minmoney + '-' + data.subject.maxmoney);
              $('#additionalMultiple').html(data.subject.subjectAdditionalMultiple);
              $('#apr').html((Number(data.subject.arnum) * 100).toFixed(2));
              $('#subjectBalance').html(data.subject.strResidualMoney);
              $('#subjectBalanceParse').val(data.subject.residualMoney);
              // $('#strResidualMoney').html(data.subject.strResidualMoney);

            } else {
              $.alert(data.msg);
            }
          }
        })
      }

      function selectUserInfo() {
        var phone = $('#uPhone').val();
        var channelId = $('#selectChannelId').val();
        var subjectId = $('#subjectId').val();
        if (phone == null || phone == '') {
          $.alert('请输入用户手机号码！');
          $('#userInfo').hide();
            $('#userId').val('');
            $('#userName').html('');
            $('#userPersonCard').html('');
            $('#userRiskTypeName').html('');
          return false;
        }
        if (channelId == null || channelId == '' || channelId == -1) {
          $.alert('渠道选择异常，请联系管理员！');
          return false;
        }
        $.ajax({
          type: "post",
          url: "report/investTransfer/selectUserInfo.action",
          dataType: "json",
          data: {
            phone: phone,
            channelId: channelId,
            subjectId: subjectId
          },
          success: function (data) {
            if(data.message == "success") {

                // 给回显数据赋值
                var idCardFile = data.idCardFile || []
                var riskTypeFile = data.riskTypeFile || []
                //回显身份证照片和风险评测照片
                reshowImg(idCardFile, $("#idImgContainer"));
                reshowImg(riskTypeFile, $("#riskImgContainer"));
                //数据请求成功
                $('#userInfo').show();
                $('#userId').val(data.user.userId);
                $('#userName').html(data.user.userName);
                $('#userPersonCard').html(data.user.userPersonCard);

                //回显银行卡连带信息缓存
                cardInfos = {};
                //默认最近一次数据
                var rentlyBankInfo = {};
                if(data.userCard){
                    var temp = {
                        cardNum: data.userCard.userCardCardnum,
                        cardBank: data.userCard.userCardBank,
                        cardSubb: data.userCard.userCardSubbranch
                    }
                    cardInfos[data.userCard.userCardCardnum] = temp;
                    //默认先取用户注册时绑定的银行卡信息
                    rentlyBankInfo = temp;
                }
                //若这里有用户注册时银行卡号则覆盖用户卡号信息
                $.each(data.historyBankInfo,function(i,n){
                    var temp = {
                        investTransferId: n.investTransferId,
                        cardNum: n.investTransferCardCardnum,
                        cardBank: n.investTransferCardBank,
                        cardSubb: n.investTransferCardSubbranch,
                        cardLineNum: n.investTransferLineNum
                    };
                    cardInfos[n.investTransferCardCardnum] = temp;
                });
                //若历史记录中存在则使用最近的历史记录
                if(data.historyBankInfo.length > 0){
                    rentlyBankInfo = cardInfos[data.historyBankInfo[0].investTransferCardCardnum];
                }
                //清空之前数据
                $("#investTransferCardCardnumSelect").empty();
                $("#changeUserCardInfoContainer input[name]").val("");
                //当最近数据存在时
                if(!$.isEmptyObject(rentlyBankInfo)){
                    $("#changeButton1").show();
                    //使用原始顺序
                    $.each(data.historyBankInfo,function(i,n){
                        $("#investTransferCardCardnumSelect").append('<option value="' + n.investTransferCardCardnum + '" >' +
                            n.investTransferCardCardnum + '</option>');
                    });
                    //当没有用户的数据事才会添加到待选记录中
                    if(data.userCard && !$("#investTransferCardCardnumSelect").is(":has(option[value='"+data.userCard.userCardCardnum+"'])")){
                        $("#investTransferCardCardnumSelect").append('<option value="' + data.userCard.userCardCardnum + '" >' +
                            data.userCard.userCardCardnum + '</option>');
                    }
                    $("#investTransferCardCardnumSelect").val(rentlyBankInfo.cardNum);
                }else{
                    $("#changeButton1").hide();
                }
                $('#investTransferCardBankSelect').empty();
                $('#investTransferCardBankSelect').append('<option value="">请选择开户银行</option>');
                $('#investTransferCardBankSelect').append('<option value="-1">其他</option>');
                $.each(data.bankPaymentLimitList, function (i, item) {
                    $('#investTransferCardBankSelect').append('<option value="' + this.bankPaymentLimitName + '" >' +
                        this.bankPaymentLimitName + '</option>');
                })
                //默认输入
                changeUserCardInfo(0);

                //风险测评数据
                var riskTypeName = '';
                if (data.user.userRiskType == null || data.user.userRiskType == '') {
                    riskTypeName = '未完成风险测评'
                } else if (data.user.userRiskType == 1) {
                    riskTypeName = '保守型';
                } else if (data.user.userRiskType == 2) {
                    riskTypeName = '谨慎型';
                } else if (data.user.userRiskType == 3) {
                    riskTypeName = '稳健型';
                } else if (data.user.userRiskType == 4) {
                    riskTypeName = '积极型';
                } else if (data.user.userRiskType == 5) {
                    riskTypeName = '激进型';
                }
                $('#userRiskTypeName').html(riskTypeName);
            } else {
                $('#userInfo').hide();
                $.alert(data.msg);
            }

          }
        })
      }

      function changeUserCardInfo(type) {
        var phone = $('#uPhone').val();
        var channelId = $('#selectChannelId').val();
        if (phone == null || phone == '') {
          $.alert('请输入用户手机号码！');
          return false;
        }
        if (channelId == null || channelId == '' || channelId == -1) {
          $.alert('渠道选择异常，请联系管理员！');
          return false;
        }
          $("#changeUserCardInfoContainer input[name]").val("");
        if (type == 0) {
            $("#changeUserCardInfoContainer .hasBankInfo").hide();
            $("#changeUserCardInfoContainer .noBankInfo").show();
            $('#investTransferCardBankSelect').val("");
            //只要是手动输入的都不回显银行卡图片
            reshowImg([], $("#bankImgContainer"));
        }else if(type == 1){
            $("#investTransferCardCardnumSelect").change();
            $("#changeUserCardInfoContainer .hasBankInfo").show();
            $("#changeUserCardInfoContainer .noBankInfo").hide();
        }
      }

      var checkCardnum = 0;
      $('#reinvestTransferCardCardnum').blur(function () {
        var investTransferCardCardnum = parseInt($('#investTransferCardCardnum').val());
        var reinvestTransferCardCardnum = parseInt($('#reinvestTransferCardCardnum').val());
        if (investTransferCardCardnum == null || investTransferCardCardnum == '' || investTransferCardCardnum ==
          0) {
          $.alert('请输入用户银行卡号！');
          checkCardnum = 0;
          return false;
        }
        if (reinvestTransferCardCardnum == null || reinvestTransferCardCardnum == '' ||
          reinvestTransferCardCardnum == 0) {
          $.alert('请再次输入用户银行卡号！');
          checkCardnum = 0;
          return false;
        }
        if (investTransferCardCardnum != reinvestTransferCardCardnum) {
          $.alert('两次输入的用户银行卡号不一致！');
          checkCardnum = 0;
          return false;
        }
        checkCardnum = 1;
      })

      var iMoney = 0;

      function checkIMoney() {
        var investMoney = $('#iMoney').val();
        var subjectBalanceParse = parseInt($('#subjectBalanceParse').val());
        if (investMoney == null || investMoney == '') {
          $.alert("请输入用户投资金额！");
          return false;
        }
        if (subjectBalanceParse == null || subjectBalanceParse == '') {
          $.alert("标的余额异常，请联系管理员！");
          return false;
        }
        investMoney = parseInt(investMoney);
        if (investMoney > subjectBalanceParse) {
          $.alert("用户投资金额不能大于标的余额！");
          return false;
        }
        var str = "subjectId=" + $('#subjectId').val() + "&investmentMoney=" + investMoney +
          "&investmentActualInvestment=" + investMoney;
        $.ajax({
          type: "post",
          url: "report/investTransfer/checkInvestMoney.action",
          dataType: "json",
          data: str,
          success: function (data) {
            if (data.message != "success") {
              $.alert(data.msg);
              iMoney = 0;
            } else {
              iMoney = 1;
            }
          }
        })
      }

      var reIMoney = 0;

      function checkReIMoney() {
        var investMoney = $('#iMoney').val();
        var reInvestMoney = $('#reIMoney').val();
        var subjectBalanceParse = parseInt($('#subjectBalanceParse').val());
        if (investMoney == null || investMoney == '' || investMoney == 0) {
          $.alert('请输入用户投资金额！');
          reIMoney = 0;
          return false;
        }
        if (reInvestMoney == null || reInvestMoney == '' || reInvestMoney == 0) {
          $.alert('请再次输入用户投资金额！');
          reIMoney = 0;
          return false;
        }
        investMoney = parseInt(investMoney);
        reInvestMoney = parseInt(reInvestMoney);
        if (investMoney != reInvestMoney) {
          $.alert('两次输入的用户投资金额不一致！');
          reIMoney = 0;
          return false;
        }
        if (subjectBalanceParse == null || subjectBalanceParse == '') {
          $.alert("标的余额异常，请联系管理员！");
          return false;
        }
        if (reInvestMoney > subjectBalanceParse) {
          $.alert("用户投资金额不能大于标的余额！");
          return false;
        }
        reIMoney = 1;
      }

      //点击显示下一步输入框
      function nextDiv() {
        var subjectId = $('#subjectId').val();
        if (subjectId == null || subjectId == '' || subjectId == -1) {
          $.alert('请先选择标的信息！');
          return false;
        };
        $('#firstDiv').hide();
        $('#nextDiv').show();
        $('#first').removeClass('btn-primary');
        $('#second').addClass('btn-primary');
      }

      //点击显示上一步输入框
      function lastDiv() {
        $('#nextDiv').hide();
        $('#firstDiv').show();
        $('#second').removeClass('btn-primary');
        $('#first').addClass('btn-primary');
      }




      /**
       * 显示数据库已经存在的照片
       * @Parma imgList 后台返回的图片列表
       * @Parma oldImgContainer 显示旧照片的div对象,query对象，如$(#idImgContainer)
       */
       function reshowImg(IdImgList, oldImgContainer) {
        var useOldBtn =oldImgContainer.parent().find('.useOldBtn')


          // 判断是否有旧照片
          if (IdImgList && IdImgList.length > 0) {
            //如果数据库中有图片
            oldImgContainer.show();
            useOldBtn.show();

            var imgHtml = "";
            for (var i = 0; i < IdImgList.length; i++) {
              var src = IdImgList[i].src;
              var itemId = IdImgList[i].id;
              // 生成html
              imgHtml +=
                '<div class="img " data_id="' +
                itemId +
                '"> <button class="delButton" type="button">删除</button> <img src="' +
                src +
                '" alt="" class="pimg"> </div>';
            }
            oldImgContainer.html(imgHtml);
            var delClick = function(e) {
                $(e.target.parentNode).hide();
                // 当删除了最后一张图片时
                if (oldImgContainer.find(".img:visible").length == 0) {
                    oldImgContainer.hide();
                    useOldBtn.text("使用已上传的照片");
                }
            };
            // 删除图片按钮的点击事件
            oldImgContainer.off("click", ".delButton").on("click", ".delButton", delClick);
            // 控制旧照片的显示与隐藏
            useOldBtn.text("不使用已上传的照片");
            var useClick = function() {
              if (oldImgContainer.is(":hidden")) {
                  oldImgContainer.show();
                  useOldBtn.text("不使用已上传的照片");
                  oldImgContainer.html(imgHtml);
              } else {
                  oldImgContainer.hide().find('.img').hide()
                  useOldBtn.text("使用已上传的照片");
              }
            }
            useOldBtn.off("click").on("click", useClick);
          } else {
            // 没有图片
            useOldBtn.hide();
            oldImgContainer.empty();
          }
        }



      var addSubmitFlag = false //提交按钮的节流阀，true:可以点击 false:不可以点击
      //提交
      function addSubmit() {
        // 将照片id赋值到input的value上
        var reuseImgId = []
          // $.each($("div .img:has('.img:visible')"),function(i,n){
          //     reuseImgId.push($(n).attr("data_id"));
          // })
        var allImgs = $('.oldImgContainer .img:visible')
        for(var i = 0; i< allImgs.length; i++) {
            reuseImgId.push($(allImgs[i]).attr('data_id'))
        }
        var usefulIdImg = $('#idImgContainer .img:visible')
        var usefulBankImg = $('#bankImgContainer .img:visible')
        var usefulRiskImg = $('#riskImgContainer .img:visible')
        $('#reuseFileIds').val(reuseImgId.join(','))

        var channelId = $('#selectChannelId').val();
        if (channelId == null || channelId == '' || channelId == -1) {
          $.alert('渠道选择异常，请联系管理员！');
          return false;
        }
        var subjectId = $('#subjectId').val();
        if (subjectId == null || subjectId == '' || subjectId == -1) {
          $.alert('标的信息异常，请联系管理员！');
          return false;
        }
        var userId = $('#userId').val();
        if (userId == null || userId == '' || userId == -1) {
          $.alert('用户信息异常，请联系管理员！');
          return false;
        }
        var uploadFormData = new FormData($('.mainform')[0]); //序列化表单，
        //身份证复印件
        if ('' != userPersonCardImgFile && userPersonCardImgFile.length > 0 || usefulIdImg && usefulIdImg.length > 0) {
          for (var i = 0; i < userPersonCardImgFile.length; i++) {
            uploadFormData.append('userPersonCardImg', userPersonCardImgFile[i]);
          }
        } else {
          $.alert('请至少选择一张图片作为身份证复印件上传！');
          return false;
        }
        if ($(".hasBankInfo").is(":hidden")) {
          //录入其它银行卡
          var investTransferCardBank = $('#investTransferCardBank').val();
          var investTransferCardCardnum = $('#investTransferCardCardnum').val();
          var reinvestTransferCardCardnum = $('#reinvestTransferCardCardnum').val();
          var investTransferCardSubbranch = $('#investTransferCardSubbranch').val();
          if (investTransferCardCardnum == null || investTransferCardCardnum == '') {
            $.alert('请输入用户银行卡卡号！');
            return false;
          };
          if (reinvestTransferCardCardnum == null || reinvestTransferCardCardnum == '') {
            $.alert('请再次输入用户银行卡卡号！');
            return false;
          };
          if (investTransferCardCardnum != reinvestTransferCardCardnum) {
            $.alert('两次输入的用户银行卡卡号不一致！');
            return false;
          }
          if (investTransferCardSubbranch == null || investTransferCardSubbranch == '') {
            $.alert('请输入用户开户支行！');
            return false;
          }
        } else  {
            //使用绑定的卡
            var investTransferCardSubbranch = $('#investTransferCardSubbranch').val();
            if (investTransferCardSubbranch == null || investTransferCardSubbranch == '') {
              $.alert('请输入用户开户支行！');
              return false;
            }
        }
        //银行卡复印件
        if ('' != userCardImgFile && userCardImgFile.length > 0 || usefulBankImg && usefulBankImg.length > 0) {
          for (var i = 0; i < userCardImgFile.length; i++) {
            uploadFormData.append('userCardImg', userCardImgFile[i]);
          }
        } else {
          $.alert('请至少选择一张图片作为银行卡复印件上传！');
          return false;
        }
        //风险测评材料
        if ('' != userRiskTypeImgFile && userRiskTypeImgFile.length > 0 || usefulRiskImg && usefulRiskImg.length > 0) {
          for (var i = 0; i < userRiskTypeImgFile.length; i++) {
            uploadFormData.append('userRiskTypeImg', userRiskTypeImgFile[i]);
          }
        } else {
          $.alert('请至少选择一张图片作为风险测评材料上传！');
          return false;
        }

        var investMoney = $('#iMoney').val();
        var reInvestMoney = $('#reIMoney').val();
        if (investMoney == null || investMoney == '' || investMoney == 0) {
          $.alert('请输入用户投资金额！');
          return false;
        }
        if (reInvestMoney == null || reInvestMoney == '' || reInvestMoney == 0) {
          $.alert('请再次输入用户投资金额！');
          return false;
        }
        investMoney = parseInt(investMoney);
        reInvestMoney = parseInt(reInvestMoney);
        if (investMoney != reInvestMoney) {
          $.alert('两次输入的用户投资金额不一致！');
          return false;
        }
        var subjectBalanceParse = parseInt($('#subjectBalanceParse').val());
        if (investMoney > subjectBalanceParse || reInvestMoney > subjectBalanceParse) {
          $.alert("用户投资金额不能大于标的余额！");
          return false;
        }
        //转账凭证
        if ('' != transferImgFile && transferImgFile.length > 0 ) {
          for (var i = 0; i < transferImgFile.length; i++) {
            uploadFormData.append('transferImg', transferImgFile[i]);
          }
        } else {
          $.alert('请至少选择一张图片作为转账凭证上传！');
          return false;
        }

        var datetime = $('#datetime').val();
        if (datetime == null || datetime == '') {
          $.alert('请选择用户投资时间！');
          return false;
        }
        var investTransferLineNum = $('#investTransferLineNum').val();
        if (investTransferLineNum.length != 12) {
          $.alert('开户行行号位数有误!');
          return false;
        }
        if (addSubmitFlag) {
          $.alert('已经提交过了，请勿多次提交');
          return false
        }
        addSubmitFlag = true

        var phone = $('#uPhone').val();
        var investTransferCardBank = $('#investTransferCardBank').val();
        var investTransferCardCardnum = $('#investTransferCardCardnum').val();
        var investTransferCardSubbranch = $('#investTransferCardSubbranch').val();
        var str = '<b>确定新增预备投资吗?</b><form class="form-horizontal">' +
          '<div style="height:40px;" class="form-group" >' +
          '<label class="col-md-6 control-label">手机号码：</label>' +
          '<div class="col-md-5"><p class="form-control-static">' + phone + '</p></div></div>' +
          '<div style="height:40px;" class="form-group" >' +
          '<label class="col-md-6 control-label">用户银行卡名称：</label>' +
          '<div class="col-md-5"><p class="form-control-static">' + investTransferCardBank + '</p></div></div>' +
          '<div style="height:40px;" class="form-group" >' +
          '<label class="col-md-6 control-label">用户银行卡卡号：</label>' +
          '<div class="col-md-5"><p class="form-control-static">' + investTransferCardCardnum + '</p></div></div>' +
          '<div style="height:40px;" class="form-group" >' +
          '<label class="col-md-6 control-label">用户开户支行：</label>' +
          '<div class="col-md-5"><p class="form-control-static">' + investTransferCardSubbranch + '</p></div></div>' +
          '<div style="height:40px;" class="form-group" >' +
          '<label class="col-md-6 control-label">开户行行号：</label>' +
          '<div class="col-md-5"><p class="form-control-static">' + investTransferLineNum + '</p></div></div>' +
          '<div style="height:40px;" class="form-group" >' +
          '<label class="col-md-6 control-label">用户投资金额：</label>' +
          '<div class="col-md-5"><p class="form-control-static">' + investMoney + '</p></div></div>' +
          '</form>';
        $.confirm(str, [{
          yes: '确定'
        }, {
          no: '取消'
        }], function (type, e) {
          if (type == 'yes') {
            //校验全部完成，开始准备进行ajax提交
            $.ajax({
              url: 'report/investTransfer/addInvestTransfer.action',
              type: 'post',
              data: uploadFormData,
              processData: false,
              contentType: false,
              dataType: 'json',
              success: function (data) {
                addSubmitFlag = false
                if (data.message == 'success') {
                  $.alert('添加成功！', null, function () {
                    window.location.href = "${basePath}report/investTransfer/list.action";
                  })
                } else if (data.message == 'userPersonCardImgFail') {
                  $.alert('上传身份证复印件异常，请联系管理员！');
                } else if (data.message == 'userCardImgFail') {
                  $.alert('上传银行卡复印件异常，请联系管理员！');
                } else if (data.message == 'userRiskTypeImgFail') {
                  $.alert('上传风险测评材料异常，请联系管理员！');
                } else if (data.message == 'transferImgFail') {
                  $.alert('上传用户转账凭证异常，请联系管理员！');
                } else {
                  $.alert(data.msg);
                }
              },
              error: function (e) {
                $.alert('系统繁忙！');
              }
            })
          }  else {
            addSubmitFlag = false
          }
          this.hide();
        });
      }

    </script>
</body>

</html>
