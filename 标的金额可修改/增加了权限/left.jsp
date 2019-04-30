	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
			<a class="hide-nav-btn" href="javascript:;"></a>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
						<li>
						<a href="cms/admin/indexJsp.action"><i class="fa fa-dashboard fa-fw"></i> 主面版</a>
						</li>
                        <shiro:hasPermission name="project">
                        <li>
                            <a href="javascript:;"><i class="fa fa-user fa-fw"></i> 项目管理<span class="fa arrow"></span><div class="badge badgetotal"></div></a>
                            <ul class="nav nav-second-level">
                           	 
                                <li>
                                    <a href="cms/project/list.action?state=1">提交项目管理<div id="badgeprosubmit" class="badge"></div></a>
                                </li>
                                <li>
                                    <a href="cms/project/list.action?state=2">待初审项目<div id="badgeprofirstcount" class="badge"></div></a>
                                </li>
                                <li>
                                    <a href="cms/project/list.action?state=5">待复审项目<div id="badgeprosecondcount" class="badge"></div></a>
                                </li>
                                <li>
                                    <a href="cms/project/list.action?state=3">审核通过项目</a>
                                </li>
                                <li>
                                    <a href="cms/project/list.action?state=4">审核驳回项目</a>
                                </li>
                                <li>
                                    <a href="cms/project/list.action?state=-1">项目进度查询</a>
                                </li>
                                
                                 <shiro:hasPermission name="projectTemplate">
                                 <li>
                                    <a href="cms/projectTemplate/list.action">项目信息模板</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="projectRepay">
                                 <li>
                                    <a href="cms/projectReturn/list.action">项目还款查询</a>
                                </li>
                                </shiro:hasPermission>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="app_mng">
                        <li>
                            <a href="javascript:;"><i class="fa fa-user fa-fw"></i> 预约管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">     
                            	<shiro:hasPermission name="app_add">                      
                                <li>
                                    <a href="cms/projectAppoint/list.action?state=1">项目预约管理</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="app_auditing"> 
                                <li>
                                    <a href="cms/projectAppoint/list.action?state=2">待审核预约项目</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="app_update"> 
                                <li>
                                    <a href="cms/projectAppoint/list.action?state=3">审核驳回列表</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="app_sendapp_mess">
                                <li>
                                    <a href="cms/projectAppoint/list.action?state=4">已通过预约项目</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="app_user">
                                <li>
                                    <a href="cms/appUser/list.action">预约用户列表</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="app_schedule">
                                <li>
                                    <a href="cms/projectAppoint/list.action?state=-1">预约项目进度查询</a>
                                </li>
                                </shiro:hasPermission>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="subject">
                        <li>
                            <a href="javascript:;"><i class="fa fa-tag fa-fw"></i> 标的管理<span class="fa arrow"></span><div class="badge badgetotal"></div></a>
                            <ul class="nav nav-second-level">
                             <shiro:hasPermission name="subjectAdd">
                                <li>
                                    <a href="cms/subject/list.action?state=-2">标的的发布管理<div id="badgesubsubmit" class="badge"></div></a>
                                </li>
                             </shiro:hasPermission>
                             <shiro:hasPermission name="subjectauditing">
                                <li>
                                    <a href="cms/subject/list.action?state=0">待初审标的<div id="badgesubfirstcount" class="badge"></div></a>
                                </li>
                                 </shiro:hasPermission>
                                 <shiro:hasPermission name="subjectSecauditing">
                                <li>
                                    <a href="cms/subject/list.action?state=9">待复审标的<div id="badgesubsecondcount" class="badge"></div></a>
                                </li>
                                 </shiro:hasPermission>

                                <shiro:hasPermission name="subjectPass">
                                <li>
                                    <a href="cms/subject/list.action?state=1">审核通过标的</a>
                                </li>
                                </shiro:hasPermission>

                                
                                <shiro:hasPermission name="subjectMoneyChangeRecord">
                                <li>
                                    <a href="cms/subject/subjectMoneyChangeRecordJsp.action">标的金额修改记录</a>
                                </li>
                                </shiro:hasPermission>



                                <shiro:hasPermission name="subjectWithdraw">
                                <li>
                                    <a href="cms/subject/list.action?state=-1">撤回标的</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="subjectReject">
                                <li>
                                    <a href="cms/subject/list.action?state=5">审核驳回标的</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="subjectSuccessWait">
                                
                                <li>
                                    <a href="cms/subject/list.action?state=2">满标待审核标的<div id="badgesubfullcount" class="badge"></div></a>
                                </li>
                                </shiro:hasPermission>
                                
                                <shiro:hasPermission name="subjectSuccessPass">
                                <li>
                                    <a href="cms/subject/list.action?state=3">满标审核通过标的</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="subjectSuccessFail">
                                <li>
                                    <a href="cms/subject/list.action?state=6">满标审核未通过标的</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="sunjectRetruned">
                                <li>
                                    <a href="cms/subject/list.action?state=4">已还款标的</a>
                                </li>
                                </shiro:hasPermission>
                                <li>
                                    <a href="cms/subject/list.action?state=-3">标的进度查询</a>
                                </li>
                                <shiro:hasPermission name="subjectTemp">
                                <li>
                                    <a href="cms/subject/tempList.action">标的信息模板</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="timeSet">
                                <li>
                                    <a href="cms/timetable/list.action">时间设置</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="ancun_add">
                                <li>
                                    <a href="cms/subject/addAncunJsp.action">安存凭证添加</a>
                                </li>
                                </shiro:hasPermission>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>   
                        </shiro:hasPermission>
                        <shiro:hasPermission name="investTransfer">
                        <li>
                            <a href="javascript:;"><i class="fa fa-bar-chart-o fa-fw"></i> 预备投资管理<span class="fa arrow"></span><div class="badge badgetotal"></div></a>
                            <ul class="nav nav-second-level">
                                <shiro:hasPermission name="investTransferList"> 
                                <li>
                                    <a href="cms/invest/list.action">预备投资列表<div id="badgeInvestTransferCount" class="badge"></div></a>
                                </li>
                                </shiro:hasPermission>
                            </ul>
                        </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="originalMng">
                        <li>
                            <a href="javascript:;"><i class="fa fa-bar-chart-o fa-fw"></i> 借款人还款管理<span class="fa arrow"></span><div class="badge badgetotal"></div></a>
                            <ul class="nav nav-second-level"> 
                            	<shiro:hasPermission name="originalWait">
                                <li>
                                    <a href="cms/originator/originatorList.action">批量借款人还款提交<div id="badgeborsubmitcount" class="badge"></div></a>
                                </li>
                                </shiro:hasPermission> 
                                <shiro:hasPermission name="originalAudit">
                                <li>
                                    <a href="cms/returnReview/list.action">借款人还款审核<div  class="badge"></div></a>
                                </li>
                                </shiro:hasPermission> 
                                <shiro:hasPermission name="allreviewMng">
                                <li>
                                    <a href="cms/returnReview/historyList.action">借款人还款历史</a>
                                </li>
                                </shiro:hasPermission>
                            </ul>
                        </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="returnRmb">
                         <li>
                            <a href="javascript:;"><i class="fa fa-briefcase fa-fw"></i> 派息还本管理<span class="fa arrow"></span><div class="badge badgetotal"></div></a>
                            <ul class="nav nav-second-level">
<!--                                 <li> -->
<!--                                     <a href="cms/return/remainReturn.action">派息还本提交审核<div id="badgepaycount" class="badge"></div></a> -->
<!--                                 </li> -->
                                <li>
                                    <a href="cms/return/repayList.action">批量还本提交审核<div id="badgepaycount" class="badge"></div></a>
                                </li>
                                <li>
                                    <a href="cms/return/returnHistory.action">派息还本历史</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="transaction">
                        <li>
                            <a href="javascript:;"><i class="fa fa-money fa-fw"></i> 资金交易管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
<!--                                 <li> -->
<!--                                     <a href="cms/hierarchy/listH.action">用户充值管理</a> -->
<!--                                 </li> -->
                                <li>
                                    <a href="cms/capital/capitalList.action">资金流水记录</a>
                                </li>
                          <!--      <li>
                                    <a href="cms/role/roleJsp.action">角色管理</a>
                                </li>
                                 
                                <li>
                                    <a href="cms/permission/permission.action">数据权限</a>
                                </li>
                                <!--  
                                <li>
                                    <a href="cms/admin/adminList.action">用户管理</a>
                                </li>
                            	<li>
                                    <a href="cms/danger/list.action">危险人员管理</a>
                                </li>
                                
                                <li>
                                    <a href="cms/loginset/loginsetList.action">登陆页设置</a>
                                </li>
                                --> 
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="recharge">
                        <li>
                            <a href="javascript:;"><i class="fa fa-calendar fa-fw"></i> 用户充值管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<shiro:hasPermission name="rechargeList">
                                <li>
                                    <a href="cms/capital/rechargelist.action">用户充值记录</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="baofoo_search">
                                <li>
                                    <a href="cms/capital/selectrechargeJsp.action">用户宝付充值结果查询</a>
                                </li> 
                                </shiro:hasPermission>
                            </ul>
                        </li>
                        </shiro:hasPermission>
                         <shiro:hasPermission name="withdrawals">
                        <li>
                            <a href="javascript:;"><i class="fa fa-calendar fa-fw"></i> 用户提现管理<span class="fa arrow"></span><div class="badge badgetotal"></div></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="cms/withdrawReview/list.action">提现审核<div id="badgewithdrawcount" class="badge"></div></a>
                                </li>
                                <li>
                                    <a href="cms/withdrawReview/errorlist.action?type=1">用户异常提现处理<div id="badgeabnormalcount" class="badge"></div></a>
                                </li>
                                 <li>
                                    <a href="cms/withdrawReview/allwithdrawbackList.action?type=1">提现批次回调列表</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </shiro:hasPermission>
                        

                        <shiro:hasPermission name="subjectwithdraw">
                        <li>
                            <a href="javascript:;"><i class="fa fa-calendar fa-fw"></i> 项目打款管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <shiro:hasPermission name="projecterrorlist">
                                <li>
                                    <a href="cms/withdrawReview/projecterrorlist.action?type=2">项目打款异常处理</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="projectRecordList">
                                <li>
                                    <a href="cms/withdrawReview/projectrecordlist.action">项目打款记录列表</a>
                                </li>
                                </shiro:hasPermission>
                                <li>
                                    <a href="cms/withdrawReview/allrecordwithdrawbackList.action?type=2">打款批次回调列表</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="mer_transfer">
                        <li>
                            <a href="javascript:;"><i class="fa fa-calendar fa-fw"></i>商户转账管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level"> 
                                <shiro:hasPermission name="mer_transfer_list">                               
                                <li>
                                    <a href="cms/merTrans/merTransList.action">商户转账记录</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="mer_transfer_error_list">
                                <li>
                                    <a href="cms/merTrans/errorMerTransList.action">商户转账失败记录</a>
                                </li>
                                </shiro:hasPermission>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="ass_colu">
                        <li>
                            <a href="javascript:;"><i class="fa fa-group fa-fw"></i> 转让标的管理<span class="fa arrow"></span><div class="badge badgetotal"></div></a>
                            <ul class="nav nav-second-level">
                            	<shiro:hasPermission name="ass_info_colu">
                                <li>
                                    <a href="cms/assignment/list.action">转让信息管理<div id="badgeasscount" class="badge"></div></a>
                                </li>
                                </shiro:hasPermission>
<!--                                 <li> -->
<!--                                     <a href="">线下成标管理</a> -->
<!--                                 </li> -->
                            </ul>
                        </li>
						</shiro:hasPermission>
                        <shiro:hasPermission name="userMng">
                        <li>
                            <a href="javascript:;"><i class="fa fa-group fa-fw"></i> 用户管理<span class="fa arrow"></span><div class="badge badgetotal"></div></a>
                            <ul class="nav nav-second-level">
                            <shiro:hasPermission name="adminMng">
                                <li>
                                    <a href="cms/admin/adminList.action">管理员管理</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="roleMng">
                                <li>
                                    <a href="cms/role/roleJsp.action">角色管理</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="sponsorMng">
                                 <li>
                                    <a href="cms/originator/list.action">发起方管理</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="userGroupMng">
                                 <li>
                                    <a href="cms/userGroup/list.action">用户组管理</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="userInforMng">
                                <li>
                                    <a href="cms/userInfoMng/list.action">用户信息管理<div id="userinfocardimgcount" class="badge"></div></a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="account_mng">
                                <li>
                                    <a href="cms/userAccount/list.action">用户账户管理<div id="" class="badge"></div></a>
                                </li>
                                </shiro:hasPermission>
                                 <shiro:hasPermission name="userCardMng">
                                <li>
                                    <a href="cms/userCard/list.action">用户银行卡管理</a>
                                </li>
                                <li>
                                   <a href="cms/userCard/userCardChangeList.action">用户换卡记录管理</a> 
                                </li>
                                <li>
                                   <a href="cms/pplatChange/list.action">用户更换推广渠道管理</a> 
                                </li>
                                 <li>
                                   <a href="cms/phoneChange/list.action">用户手机号更换记录管理</a> 
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="userInforMng">
                                <li>
                                   <a href="cms/userInfoMng/riskRecordList.action">风险测评修改记录管理</a> 
                                </li>
                                </shiro:hasPermission>
                            </ul>
                        </li>
                        </shiro:hasPermission>
<!--                         <shiro:hasPermission name="reportMng"> -->
<!--                         <li> -->
<!--                             <a href="javascript:;"><i class="fa fa-bar-chart-o fa-fw"></i> 报表管理<span class="fa arrow"></span></a> -->
<!--                             <ul class="nav nav-second-level"> -->
<!--                                 <li> -->
<!--                                     <a href="cms/mission/myJsp.action">demo</a> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </li> -->
<!--                         </shiro:hasPermission> -->
<!--                         <shiro:hasPermission name="operate"> -->
<!--                         <li> -->
<!--                             <a href="javascript:;"><i class="fa fa-bar-chart-o fa-fw"></i> 运营管理<span class="fa arrow"></span></a> -->
<!--                             <ul class="nav nav-second-level"> -->
<!--                                 <li> -->
<!--                                     <a href="cms/mission/myJsp.action">demo</a> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </li> -->
<!--                         </shiro:hasPermission> -->
						<shiro:hasPermission name="replenish_mng">
						<li>
                            <a href="javascript:;"><i class="fa fa-sitemap fa-fw"></i> 项目收益差值管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<shiro:hasPermission name="replenish">
                                <li>
		                            <a href="cms/replenish/userList.action">项目收益差值充值</a>
		                        </li>
		                        </shiro:hasPermission>
		                        <shiro:hasPermission name="replenish_auditing">
		                        <li>
		                            <a href="cms/replenish/list.action">项目收益差值审核</a>
		                        </li>
		                        </shiro:hasPermission>
                            </ul>    
                        </li>
						</shiro:hasPermission>
                        <shiro:hasPermission name="channel">
                        <li>
                            <a href="javascript:;"><i class="fa fa-sitemap fa-fw"></i> 渠道管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <shiro:hasPermission name="area_mng">
                                 <li>
                                    <a href="cms/area/list.action">地区管理</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="channelList">
                                 <li>
                                    <a href="cms/channel/list.action">渠道列表</a>
                                </li>
                                </shiro:hasPermission>
                            </ul>    
                        </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="integral">
						<li>
                            <a href="javascript:;"><i class="fa fa-calendar fa-fw"></i> 积分管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">  
                            <shiro:hasPermission name="integralList">      
                                 <li>
                                    <a href="cms/integral/ruleList.action">积分规则</a>
                                </li>
                            </shiro:hasPermission>
                            </ul>
                        </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="line_re_colu">
						<li>
                            <a href="javascript:;"><i class="fa fa-calendar fa-fw"></i> 线下充值管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">  
                            <shiro:hasPermission name="line_re_firau">
                                 <li>
                                    <a href="cms/lineRecharge/list.action?state=1">投资券申请待初审</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="line_re_fir_refu">
                                <li>
                                    <a href="cms/lineRecharge/list.action?state=4">投资券申请初审拒绝</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="line_re_secau">
                                <li>
                                    <a href="cms/lineRecharge/list.action?state=2">投资券申请待复审</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="line_re_sec_refu">
                                <li>
                                    <a href="cms/lineRecharge/list.action?state=5">投资券申请复审拒绝</a>
                                </li>
                            </shiro:hasPermission>
                               <!--  <li>
                                    <a href="cms/lineRecharge/list.action?state=0">申请充值成功</a>
                                </li> -->
                                
                            <shiro:hasPermission name="line_re_mng">
                                 <li>
                                    <a href="cms/investsecurity/list.action?state=-2">投资券管理</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="line_re_ca_au">
                                <li>
                                    <a href="cms/investsecurity/list.action?state=7&flag=1">取消投资券待审核</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="line_re_cancel">
                                <li>
                                    <a href="cms/investsecurity/list.action?state=8&flag=2">已取消投资券</a>
                                </li>
                            </shiro:hasPermission>
                            </ul>
                        </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="platformLink">
                        <li>
                            <a href="javascript:;"><i class="fa fa-cog fa-fw"></i> 平台跳转<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">          
                            <shiro:hasPermission name="reportadmin">
                                 <li>
                                    <a href="cms/pageleap/report.action">数据报表系统</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="publishadmin">
                                <li>
                                    <a href="cms/pageleap/publish.action">运营系统</a>
                                </li>
                            </shiro:hasPermission>
                            </ul>
                        </li>
						</shiro:hasPermission>
                        <shiro:hasPermission name="createhtml">
                        <li>
                            <a href="javascript:;"><i class="fa fa-leaf fa-fw"></i> 静态页面生成<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level"> 
                            	<li>
                                    <a href="cms/state/generateHtml.action">生成静态页面</a>
                                </li>
                            </ul>
                        </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="system">
                        <li>
                            <a href="javascript:;"><i class="fa fa-cog fa-fw"></i>系统管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level"> 
                            	<shiro:hasPermission name="history_show">
                            	<li>
                                    <a href="cms/operation/list.action">历史操作记录列表</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="baofoo_mng">
                                <li>
                                    <a href="cms/baofoo/list.action">宝付库管理</a>
                                </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="bank_limit_pay">
                                <li>
                                    <a href="cms/bankpaymentlimit/list.action">银行支付限额管理</a>
                                </li>
                                </shiro:hasPermission>
                            </ul>
                        </li>
                        </shiro:hasPermission>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
