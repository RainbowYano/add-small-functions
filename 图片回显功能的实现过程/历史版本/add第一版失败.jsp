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
      width: 300px;
      vertical-align: top;
    }

    .oldImgContainer {
      display: flex;
    }

    .oldImgContainer .img {
      position: relative;
      margin-right: 10px;
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
              <label class="col-md-2 control-label">请选择标的：</label>
              <div class="col-md-3">
                <div class="form-control-btn" onclick="selectSubjectList(1)">请选择标的</div>
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

              <div class="form-group">
                <!-- 身份证复印件回写 -->
                <input type="hidden" value="" name="idImg" id="idImg">
                <label class="col-md-2 control-label">上传身份证复印件：</label>
                <br>
                <button class="useOldBtn" id="idImgBtn">使用已上传的照片</button>
                <div class="col-md-9 oldImgContainer" id="idImgContainer" style="display: none">
                </div>
                <!-- 选择文件 -->
                <div class="col-md-9">
                  <div id="userPersonCardImg"></div>
                </div>
              </div>

              <input type="hidden" id="submitUserCardType" name="submitUserCardType" value="">
              <div id="hasUserCardInfo" style="display:none">
                <div class="form-group">
                  <label class="col-md-2 control-label">用户银行卡名称：</label>
                  <div class="col-md-2">
                    <p class="form-control-static"><span id="userCardBank"></span></p>
                  </div>
                  <p class="form-control-static text-warning2">
                    <i class="fa fa-info-circle fa-fw"></i><span onclick="changeUserCardInfo(0)">录入其它银行卡</span>
                  </p>
                </div>
                <br />

                <div class="form-group">
                  <label class="col-md-2 control-label">用户银行卡卡号：</label>
                  <div class="col-md-8">
                    <p class="form-control-static"><span id="userCardCardnum"></span></p>
                  </div>
                </div>
                <br />

                <input type="hidden" id="submitUserCardSubbranch" name="submitUserCardSubbranch" value="">

                <div id="hasUserCardSubbranch" style="display:none">
                  <div class="form-group">
                    <label class="col-md-2 control-label">用户开户支行：</label>
                    <div class="col-md-8">
                      <p class="form-control-static"><span id="userCardSubbranch"></span></p>
                    </div>
                  </div>
                  <br />
                </div>

                <div id="noUserCardSubbranch" style="display:none">
                  <div class="form-group">
                    <label class="col-md-2 control-label">用户开户支行：</label>
                    <div class="col-md-3">
                      <input type="text" class="form-control" id="investTransferUserCardSubbranch"
                        placeholder="请输入用户开户支行" required="required" name="investTransferUserCardSubbranch">
                    </div>
                  </div>
                  <br />
                </div>
              </div>

              <div id="noUserCardInfo" style="display:none">

                <div class="form-group">
                  <label class="col-md-2 control-label">用户银行卡名称：</label>
                  <div class="col-md-2">
                    <select class="form-control" name="investTransferCardBank" id="investTransferCardBank"
                      onchange="changeBank()">

                    </select>
                  </div>
                  <p class="form-control-static text-warning2">
                    <i class="fa fa-info-circle fa-fw"></i><span onclick="changeUserCardInfo(1)">使用绑定的卡</span>
                  </p>
                </div>
                <br />

                <div class="form-group none" id="otherCard">
                  <label class="col-md-2 control-label"></label>
                  <div class="col-md-3">
                    <input type="text" class="form-control" id="cardBank" placeholder="请输入用户银行卡名称" required="required"
                      name="cardBank">
                  </div>
                </div>
                <br />

                <div class="form-group">
                  <label class="col-md-2 control-label">用户银行卡卡号：</label>
                  <div class="col-md-3">
                    <input type="number" class="form-control"
                      onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" onpaste="return false"
                      oncopy="return false" id="investTransferCardCardnum" placeholder="请输入用户银行卡卡号" required="required"
                      name="investTransferCardCardnum">
                  </div>
                </div>
                <br />

                <div class="form-group">
                  <label class="col-md-2 control-label">再次输入银行卡卡号：</label>
                  <div class="col-md-3">
                    <input type="number" class="form-control"
                      onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" onpaste="return false"
                      oncopy="return false" id="reInvestTransferCardCardnum" placeholder="请再次输入银行卡卡号"
                      required="required" name="reInvestTransferCardCardnum">
                  </div>
                </div>
                <br />

                <div class="form-group">
                  <label class="col-md-2 control-label">用户开户支行：</label>
                  <div class="col-md-3">
                    <input type="text" class="form-control" id="investTransferCardSubbranch" placeholder="请输入用户开户支行"
                      required="required" name="investTransferCardSubbranch">
                  </div>
                </div>
                <br />

              </div>

              <div class="form-group">
                <label class="col-md-2 control-label">开户行行号：</label>
                <div class="col-md-3">
                  <input type="number" class="form-control" id="investTransferLineNum" placeholder="请输入开户行行号"
                    required="required" name="investTransferLineNum">
                </div>
              </div>
              <br />

              <div class="form-group">
                <!-- 银行卡复印件照片回写 -->
                <input type="hidden" value="" name="bankImg" id="bankImg">
                <label class="col-md-2 control-label">上传银行卡复印件：</label>
                <br>
                <button class="useOldBtn" id="bankImgBtn">使用已上传的照片</button>
                <div class="col-md-9 oldImgContainer" id="bankImgContainer" style="display: none">
                </div>

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

              <div class="form-group">
                <!-- 风险测评材料照片 -->
                <input type="hidden" value="" name="riskImg" id="riskImg">
                <label class="col-md-2 control-label">上传风险测评材料：</label>
                <br>
                <button class="useOldBtn" id="riskImgBtn">使用已上传的照片</button>
                <span class="notice">温馨提示：风险测评材料上传时间超过一年的，需重新上传</span>
                <div class="col-md-9 oldImgContainer" id="riskImgContainer" style="display: none">
                </div>

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
                <!-- 用户转账凭证照片 -->
                <input type="hidden" value="" name="payImg" id="payImg">
                <label class="col-md-2 control-label">上传用户转账凭证：</label>
                <br>
                <button class="useOldBtn" id="payImgBtn">使用已上传的照片</button>
                <div class="col-md-9 oldImgContainer" id="payImgContainer" style="display: none">
                </div>

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
      <div class="dialog" id="dialog-box" style="display:none">
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
      var userPersonCardImgFile = '';
      var userCardImgFile = '';
      var userRiskTypeImgFile = '';
      var transferImgFile = '';
      var usefulIdImg = []
        var idImgFlag = true
        var usefulBankImg = []
        var bankImgFlag = true
        var usefulRiskImg = []
        var riskImgFlag = true
        var usefulPayImg = []
        var payImgFlag = true

      $(document).ready(function () {
        // 以前照片回写逻辑
        // 身份证复印件
        // 后台传过来的图形
        var IdImgList = [{
            id: 1,
            src: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553847773432&di=849ad0ca1f605d0e82c4d3d1a3fc5007&imgtype=0&src=http%3A%2F%2Fp1.ifengimg.com%2Ffck%2F2018_01%2F4b3586c88209a81_w640_h429.jpg'
          },
          {
            id: 2,
            src: 'https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=c724ff91482309f7f86fab12420f0c39/30adcbef76094b3624c1f1e8adcc7cd98d109d60.jpg'
          },
          {
            id: 3,
            src: 'https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=eb318aa70d3b5bb5a1d726fe06d3d523/a6efce1b9d16fdfa6c544de2ba8f8c5494ee7b86.jpg'
          }
        ]

        if (IdImgList && IdImgList.length > 0) { //如果数据库中有图片
          // 生成html
          var imgHtml = ""
          for (var i = 0; i < IdImgList.length; i++) {
            var src = IdImgList[i].src
            var id = IdImgList[i].id
            imgHtml += `<div class="img" data_id="${id}">
                                <button class="delButton">删除</button>
                                <img src="${src}" alt="">
                            </div>`
          }
          $('#idImgContainer').html(imgHtml)

          // 删除图片按钮的点击事件
          $('#idImgContainer').on('click', '.delButton', function (e) {
            $(e.target.parentNode).hide()
            usefulIdImg.splice(usefulIdImg.indexOf(Number($(e.target.parentNode).attr(
              "data_id"))), 1)
            if (usefulIdImg.length <= 0) {
              $('#idImgContainer').hide()
              $('#idImgBtn').text('使用已上传的照片')
              usefulIdImg = []
              idImgFlag = true
            }
            console.log(usefulIdImg)
          })

          // 控制旧照片的显示与隐藏

          $('#idImgBtn').on('click', function () {
            if (idImgFlag) {
              $('#idImgContainer').show()
              $('#idImgBtn').text('不使用已上传的照片')
              IdImgList.forEach(function (item, i) {
                usefulIdImg.push(item.id)
              })
              idImgFlag = false
              $('#idImgContainer').html(imgHtml)
              console.log(usefulIdImg)
            } else {
              $('#idImgContainer').hide()
              $('#idImgBtn').text('使用已上传的身份证照片')
              usefulIdImg = []
              idImgFlag = true
              console.log(usefulIdImg)
            }
          })

        } else { // 没有图片
          $('#idImgBtn').hide()
        }

        // 银行卡复印件
        var bankImgList = [{
            id: 1,
            src: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553847773432&di=849ad0ca1f605d0e82c4d3d1a3fc5007&imgtype=0&src=http%3A%2F%2Fp1.ifengimg.com%2Ffck%2F2018_01%2F4b3586c88209a81_w640_h429.jpg'
          },
          {
            id: 2,
            src: 'https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=c724ff91482309f7f86fab12420f0c39/30adcbef76094b3624c1f1e8adcc7cd98d109d60.jpg'
          },
          {
            id: 3,
            src: 'https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=eb318aa70d3b5bb5a1d726fe06d3d523/a6efce1b9d16fdfa6c544de2ba8f8c5494ee7b86.jpg'
          }
        ]


        if (bankImgList && bankImgList.length > 0) { //如果数据库中有图片
          // 生成html
          var imgHtml = ""
          for (var i = 0; i < bankImgList.length; i++) {
            var src = bankImgList[i].src
            var id = bankImgList[i].id
            imgHtml += `<div class="img" data_id="${id}">
            <button class="delButton">删除</button>
              <img src="${src}" alt="">
          </div>`
          }
          $('#bankImgContainer').html(imgHtml)

          // 删除图片按钮的点击事件
          $('#bankImgContainer').on('click', '.delButton', function (e) {
            $(e.target.parentNode).hide()
            usefulBankImg.splice(usefulBankImg.indexOf(Number($(e.target.parentNode).attr(
              "data_id"))), 1)
            if (usefulBankImg.length <= 0) {
              $('#bankImgContainer').hide()
              $('#bankImgBtn').text('使用已上传的照片')
              usefulBankImg = []
              bankImgFlag = true
            }
            console.log(usefulBankImg)
          })

          // 控制旧照片的显示与隐藏

          $('#bankImgBtn').on('click', function () {
            if (bankImgFlag) {
              $('#bankImgContainer').show()
              $('#bankImgBtn').text('不使用已上传的照片')
              bankImgList.forEach(function (item, i) {
                usefulBankImg.push(item.id)
              })
              bankImgFlag = false
              $('#bankImgContainer').html(imgHtml)
              console.log(usefulBankImg)
            } else {
              $('#bankImgContainer').hide()
              $('#bankImgBtn').text('使用已上传的照片')
              usefulBankImg = []
              bankImgFlag = true
              console.log(usefulBankImg)
            }
          })

        } else { // 没有图片
          $('#bankImgBtn').hide()
        }

        // 风险评估材料
        var riskImgList = [{
            id: 1,
            src: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553847773432&di=849ad0ca1f605d0e82c4d3d1a3fc5007&imgtype=0&src=http%3A%2F%2Fp1.ifengimg.com%2Ffck%2F2018_01%2F4b3586c88209a81_w640_h429.jpg'
          },
          {
            id: 2,
            src: 'https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=c724ff91482309f7f86fab12420f0c39/30adcbef76094b3624c1f1e8adcc7cd98d109d60.jpg'
          },
          {
            id: 3,
            src: 'https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=eb318aa70d3b5bb5a1d726fe06d3d523/a6efce1b9d16fdfa6c544de2ba8f8c5494ee7b86.jpg'
          }
        ]


        if (riskImgList && riskImgList.length > 0) { //如果数据库中有图片
          // 生成html
          var imgHtml = ""
          for (var i = 0; i < riskImgList.length; i++) {
            var src = riskImgList[i].src
            var id = riskImgList[i].id
            imgHtml += `<div class="img" data_id="${id}">
            <button class="delButton">删除</button>
              <img src="${src}" alt="">
          </div>`
          }
          $('#riskImgContainer').html(imgHtml)

          // 删除图片按钮的点击事件
          $('#riskImgContainer').on('click', '.delButton', function (e) {
            $(e.target.parentNode).hide()
            usefulRiskImg.splice(usefulRiskImg.indexOf(Number($(e.target.parentNode).attr(
              "data_id"))), 1)
            if (usefulRiskImg.length <= 0) {
              $('#riskImgContainer').hide()
              $('#riskImgBtn').text('使用已上传的照片')
              usefulRiskImg = []
              riskImgFlag = true
            }
            console.log(usefulRiskImg)
          })

          // 控制旧照片的显示与隐藏

          $('#riskImgBtn').on('click', function () {
            if (riskImgFlag) {
              $('#riskImgContainer').show()
              $('#riskImgBtn').text('不使用已上传的照片')
              riskImgList.forEach(function (item, i) {
                usefulRiskImg.push(item.id)
              })
              riskImgFlag = false
              $('#riskImgContainer').html(imgHtml)
              console.log(usefulRiskImg)
            } else {
              $('#riskImgContainer').hide()
              $('#riskImgBtn').text('使用已上传的身份证照片')
              usefulRiskImg = []
              riskImgFlag = true
              console.log(usefulRiskImg)
            }
          })

        } else { // 没有图片
          $('#riskImgBtn').hide()
        }

        // 用户转账凭证
        var payImgList = [{
            id: 1,
            src: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553847773432&di=849ad0ca1f605d0e82c4d3d1a3fc5007&imgtype=0&src=http%3A%2F%2Fp1.ifengimg.com%2Ffck%2F2018_01%2F4b3586c88209a81_w640_h429.jpg'
          },
          {
            id: 2,
            src: 'https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=c724ff91482309f7f86fab12420f0c39/30adcbef76094b3624c1f1e8adcc7cd98d109d60.jpg'
          },
          {
            id: 3,
            src: 'https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=eb318aa70d3b5bb5a1d726fe06d3d523/a6efce1b9d16fdfa6c544de2ba8f8c5494ee7b86.jpg'
          }
        ]


        if (payImgList && payImgList.length > 0) { //如果数据库中有图片
          // 生成html
          var imgHtml = ""
          for (var i = 0; i < payImgList.length; i++) {
            var src = payImgList[i].src
            var id = payImgList[i].id
            imgHtml += `<div class="img" data_id="${id}">
        <button class="delButton">删除</button>
          <img src="${src}" alt="">
      </div>`
          }
          $('#payImgContainer').html(imgHtml)

          // 删除图片按钮的点击事件
          $('#payImgContainer').on('click', '.delButton', function (e) {
            $(e.target.parentNode).hide()
            usefulPayImg.splice(usefulPayImg.indexOf(Number($(e.target.parentNode).attr(
              "data_id"))), 1)
            if (usefulPayImg.length <= 0) {
              +$('#payImgContainer').hide()
              $('#payImgBtn').text('使用已上传的照片')
              usefulPayImg = []
              payImgFlag = true
            }
            console.log(usefulPayImg)
          })

          // 控制旧照片的显示与隐藏

          $('#payImgBtn').on('click', function () {
            if (payImgFlag) {
              $('#payImgContainer').show()
              $('#payImgBtn').text('不使用已上传的照片')
              payImgList.forEach(function (item, i) {
                usefulPayImg.push(item.id)
              })
              payImgFlag = false
              $('#payImgContainer').html(imgHtml)
              console.log(usefulPayImg)
            } else {
              $('#payImgContainer').hide()
              $('#payImgBtn').text('使用已上传的照片')
              usefulPayImg = []
              payImgFlag = true
              console.log(usefulPayImg)
            }
          })

        } else { // 没有图片
          $('#payImgBtn').hide()
        }



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

      function selectSubjectList(pageIndex) {
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
            pageIndex: pageIndex
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
      }

      function checkSubject(id) {
        selectSujectInfo(id);
        dialogClose();
      }

      function dialogClose() {
        $('#dialog-box').slideUp(500);
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
          $('#submitUserCardType').val('');
          $('#hasUserCardInfo').hide();
          $('#noUserCardInfo').hide();
          $('#submitUserCardSubbranch').val('');
          $('#userCardBank').html('');
          $('#userCardCardnum').html('');
          $('#hasUserCardSubbranch').hide();
          $('#noUserCardSubbranch').hide();
          $('#userCardSubbranch').html('');
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
            if (data.message == "success") {
              //数据请求成功
              $('#userInfo').show();
              $('#userId').val(data.user.userId);
              $('#userName').html(data.user.userName);
              $('#userPersonCard').html(data.user.userPersonCard);
              if (data.cardType == 1) {
                $('#submitUserCardType').val(1);
                $('#hasUserCardInfo').show();
                $('#noUserCardInfo').hide();
                $('#userCardBank').html(data.userCard.userCardBank);
                $('#userCardCardnum').html(data.userCard.userCardCardnum);
                if (data.userCard.userCardSubbranch == null || data.userCard.userCardSubbranch == '') {
                  $('#submitUserCardSubbranch').val(0);
                  $('#hasUserCardSubbranch').hide();
                  $('#noUserCardSubbranch').show();
                } else {
                  $('#submitUserCardSubbranch').val(1);
                  $('#hasUserCardSubbranch').show();
                  $('#noUserCardSubbranch').hide();
                  $('#userCardSubbranch').html(data.userCard.userCardSubbranch);
                }
              } else if (data.cardType == 0) {
                $('#submitUserCardType').val(0);
                $('#hasUserCardInfo').hide();
                $('#noUserCardInfo').show();
                $.each(data.bankPaymentLimitList, function (i, item) {
                  $('#investTransferCardBank').append('<option value="' + this.bankPaymentLimitName + '" >' +
                    this.bankPaymentLimitName + '</option>');
                })
              }
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
        $.ajax({
          type: "post",
          url: "report/investTransfer/changeUserCardInfo.action",
          dataType: "json",
          data: {
            phone: phone,
            channelId: channelId
          },
          success: function (data) {
            if (data.message == "success") {
              //数据请求成功
              if (type == 0) {
                $('#submitUserCardType').val(0);
                $('#hasUserCardInfo').hide();
                $('#noUserCardInfo').show();
                $('#investTransferCardBank').append('<option value="">请选择开户银行</option>');
                $('#investTransferCardBank').append('<option value="-1">其他</option>');
                $.each(data.bankPaymentLimitList, function (i, item) {
                  $('#investTransferCardBank').append('<option value="' + this.bankPaymentLimitName + '" >' +
                    this.bankPaymentLimitName + '</option>');
                })
              } else if (type == 1) {
                $('#investTransferCardBank').empty();
                $('#submitUserCardType').val(1);
                $('#hasUserCardInfo').show();
                $('#noUserCardInfo').hide();
                $('#userCardBank').html(data.userCard.userCardBank);
                $('#userCardCardnum').html(data.userCard.userCardCardnum);
                if (data.userCard.userCardSubbranch == null || data.userCard.userCardSubbranch == '') {
                  $('#submitUserCardSubbranch').val(0);
                  $('#hasUserCardSubbranch').hide();
                  $('#noUserCardSubbranch').show();
                } else {
                  $('#submitUserCardSubbranch').val(1);
                  $('#hasUserCardSubbranch').show();
                  $('#noUserCardSubbranch').hide();
                  $('#userCardSubbranch').html(data.userCard.userCardSubbranch);
                }
              }
            } else {
              $.alert(data.msg);
            }
          }
        })
      }

      var checkCardnum = 0;
      $('#reInvestTransferCardCardnum').blur(function () {
        var investTransferCardCardnum = parseInt($('#investTransferCardCardnum').val());
        var reInvestTransferCardCardnum = parseInt($('#reInvestTransferCardCardnum').val());
        if (investTransferCardCardnum == null || investTransferCardCardnum == '' || investTransferCardCardnum ==
          0) {
          $.alert('请输入用户银行卡号！');
          checkCardnum = 0;
          return false;
        }
        if (reInvestTransferCardCardnum == null || reInvestTransferCardCardnum == '' ||
          reInvestTransferCardCardnum == 0) {
          $.alert('请再次输入用户银行卡号！');
          checkCardnum = 0;
          return false;
        }
        if (investTransferCardCardnum != reInvestTransferCardCardnum) {
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


      function changeBank() {
        var bank = $('#investTransferCardBank').val();
        if (bank == -1) {
          $('#otherCard').show();
        } else {
          $('#otherCard').hide();
        }
      }



      var addSubmitFlag = false //提交按钮的节流阀，true:可以点击 false:不可以点击
      //提交
      function addSubmit() {
        // 将照片id赋值到input的value上
         $('#idImg').val(usefulIdImg.join(','))
         $('#bankImg').val(usefulBankImg.join(','))
         $('#riskImg').val(usefulRiskImg.join(','))
         $('#payImg').val(usefulPayImg.join(','))

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
        if ('' != userPersonCardImgFile && userPersonCardImgFile.length > 0 || usefulIdImg && usefulIdImg.length > 0 ) {
          for (var i = 0; i < userPersonCardImgFile.length; i++) {
            uploadFormData.append('userPersonCardImg', userPersonCardImgFile[i]);
          }
        } else {
          $.alert('请至少选择一张图片作为身份证复印件上传！');
          return false;
        }
        var submitUserCardType = $('#submitUserCardType').val();
        if (submitUserCardType == 0) {
          //录入其它银行卡
          var investTransferCardBank = $('#investTransferCardBank').val();
          var investTransferCardCardnum = $('#investTransferCardCardnum').val();
          var reInvestTransferCardCardnum = $('#reInvestTransferCardCardnum').val();
          var investTransferCardSubbranch = $('#investTransferCardSubbranch').val();
          if (investTransferCardCardnum == null || investTransferCardCardnum == '') {
            $.alert('请输入用户银行卡卡号！');
            return false;
          };
          if (reInvestTransferCardCardnum == null || reInvestTransferCardCardnum == '') {
            $.alert('请再次输入用户银行卡卡号！');
            return false;
          };
          if (investTransferCardCardnum != reInvestTransferCardCardnum) {
            $.alert('两次输入的用户银行卡卡号不一致！');
            return false;
          }
          if (investTransferCardSubbranch == null || investTransferCardSubbranch == '') {
            $.alert('请输入用户开户支行！');
            return false;
          }
        } else if (submitUserCardType == 1) {
          //使用绑定的卡
          var submitUserCardSubbranch = $('#submitUserCardSubbranch').val();
          if (submitUserCardSubbranch == 0) {
            var investTransferUserCardSubbranch = $('#investTransferUserCardSubbranch').val();
            if (investTransferUserCardSubbranch == null || investTransferUserCardSubbranch == '') {
              $.alert('请输入用户开户支行！');
              return false;
            }
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
        if ('' != transferImgFile && transferImgFile.length > 0 || usefulPayImg && usefulPayImg.length > 0) {
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

        var investTransferCardBank = "";
        var investTransferCardCardnum = "";
        var investTransferCardSubbranch = "";
        var phone = $('#uPhone').val();
        if (submitUserCardType == 0) {
          //录入其它银行卡
          investTransferCardBank = $('#investTransferCardBank option:selected').text();
          investTransferCardCardnum = $('#investTransferCardCardnum').val();
          investTransferCardSubbranch = $('#investTransferCardSubbranch').val();
        } else if (submitUserCardType == 1) {
          //使用绑定的卡
          investTransferCardBank = $('#userCardBank').html();
          investTransferCardCardnum = $('#userCardCardnum').html();
          investTransferCardSubbranch = $('#investTransferUserCardSubbranch').val();
        }
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
              error: function () {
                $.alert('系统繁忙！');
              }
            })
          }
          this.hide();
        });
      }
    </script>
</body>

</html>