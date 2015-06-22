<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>安阳仲裁委员会办案管理系统</title>
<meta charset="utf-8">

<link href="${pageContext.request.contextPath }/css/arbitration.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${pageContext.request.contextPath }/css/print.css" rel="stylesheet" type="text/css" media="all" />

<link href="${pageContext.request.contextPath }/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${pageContext.request.contextPath }/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen" />
<%-- <link href="${pageContext.request.contextPath }/dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print" /> --%>
<link href="${pageContext.request.contextPath }/dwz/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen" />

<!--[if IE]>
<link href="${pageContext.request.contextPath }/dwz/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->
<!--[if lte IE 9]>
<script src="${pageContext.request.contextPath }/dwz/js/speedup.js" type="text/javascript"></script>
<![endif]-->

<script src="${pageContext.request.contextPath }/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery.validate.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script src="${pageContext.request.contextPath }/dwz/chart/raphael.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/chart/g.raphael.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/chart/g.bar.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/chart/g.line.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/chart/g.pie.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/chart/g.dot.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath }/dwz/js/dwz.core.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.util.date.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.drag.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.tree.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.accordion.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.ui.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.theme.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.navTab.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.tab.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.resize.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.dialog.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.stable.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.ajax.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.pagination.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.database.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.effects.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.panel.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.history.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.combox.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dwz/js/dwz.print.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath }/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	initIndexData();
	//setTimeout(initDWZ, 777);
});

/**
 * 初始化DWZ框架
 */
function initDWZ(){
	DWZ.init("${pageContext.request.contextPath }/dwz/dwz.frag.xml", {
		loginUrl : "${pageContext.request.contextPath }/login/loginDialog", loginTitle:"登录",	// 弹出登录对话框
		debug : false,	// 调试模式 【true|false】
		callback : function() {
			initEnv();
			$("#themeList").theme({themeBase:"${pageContext.request.contextPath }/dwz/themes"}); // themeBase 相对于index页面的主题base路径
			// $("#sidebar .toggleCollapse div").trigger("click");
		}
	});
}

/**
 * 初始化主页数据
 */
var rid = ${user.role.id };
if(rid == 4 || rid == 7 || rid == 8 || rid == 9){ initDWZ(); }
var count = 0;
var parameter = { timestamp : new Date() };
var loadCallback = function(){
	count++;
	switch(rid){
		case 0 : if(count == 1){ initDWZ(); } break;
		case 1 : if(count == 5){ initDWZ(); } break;
		case 2 : if(count == 4){ initDWZ(); } break;
		case 3 : if(count == 3){ initDWZ(); } break;
		case 5 : if(count == 2){ initDWZ(); } break;
		case 6 : if(count == 2){ initDWZ(); } break;
	}
};
function initIndexData() {
	// 加载案件监控
	$("#caseing").attr("layoutH", 60).load("${pageContext.request.contextPath }/case/caseing",parameter,loadCallback);

	// 副主任
	$("#flow2").load("${pageContext.request.contextPath }/flow/123List_index/2",parameter,loadCallback);
	$("#flow6approve").load("${pageContext.request.contextPath }/flow/6approveNoticeList_index",parameter,loadCallback);
	$("#flow10").load("${pageContext.request.contextPath }/flow/101112List_index/10",parameter,loadCallback);
	$("#flow18").load("${pageContext.request.contextPath }/flow/181920List_index/18",parameter,loadCallback);

	// 中心主任
	$("#flow3").load("${pageContext.request.contextPath }/flow/123List_index/3",parameter,loadCallback);
	$("#flow11").load("${pageContext.request.contextPath }/flow/101112List_index/11",parameter,loadCallback);
	$("#flow19").load("${pageContext.request.contextPath }/flow/181920List_index/19",parameter,loadCallback);

	// 仲裁委主任
	$("#flow12").load("${pageContext.request.contextPath }/flow/101112List_index/12",parameter,loadCallback);
	$("#flow20").load("${pageContext.request.contextPath }/flow/181920List_index/20",parameter,loadCallback);

	// 立案科长
	$("#flow1").load("${pageContext.request.contextPath }/flow/123List_index/1",parameter,loadCallback);

	// 联络科长
	$("#flow4").load("${pageContext.request.contextPath }/flow/4List_index",parameter,loadCallback);
};
</script>
</head>
<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo"></a>
				<ul class="nav">
					<li><a>${user.name }</a></li>
					<li><a href="${pageContext.request.contextPath }/login/logout">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>

			<!-- navMenu -->
			
		</div>
<c:choose>
	<%-- 管理员菜单 --%>
	<c:when test="${user.role.id == 0 }">
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2><span>Folder</span>案件受理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/case/123ing" target="navTab" rel="123ing">审批中的仲裁申请</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件检索</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/retrieval/case" target="navTab" rel="retrievalCase">案件检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/receipt" target="navTab" rel="retrievalReceipt">送达文书检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/notice" target="navTab" rel="retrievalNotice">公告检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/arbitrator" target="navTab" rel="retrievalArbitrator">仲裁员审批表检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/award" target="navTab" rel="retrievalAward">裁决书检索</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件统计</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/statistics/count" target="navTab" rel="statisticsCount">案件数量统计</a></li>
							<li><a href="${pageContext.request.contextPath }/statistics/type" target="navTab" rel="statisticsType">案件类型统计</a></li>
							<li><a href="${pageContext.request.contextPath }/statistics/secretary" target="navTab" rel="statisticsSecretary">人员办案统计</a></li>
							<%-- <li><a href="${pageContext.request.contextPath }/statistics/cost" target="navTab" rel="statisticsCost">案件费用统计</a></li> --%>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>系统管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/user" target="navTab" rel="user">用户管理</a></li>
							<li><a href="${pageContext.request.contextPath }/logger" target="navTab" rel="logger">系统日志</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<p><span>欢迎您：<a>${user.name }</a></span></p>
							<p>身份：${user.role.name }&nbsp;&nbsp;&nbsp;&nbsp;登录用户名：${user.username }</p>
						</div>
						<div class="pageFormContent" style="width: 49%;padding: 0px;">
							<div class="index_title">进行中的案件：</div>
							<div id="caseing"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<%-- 副主任菜单 --%>
	<c:when test="${user.role.id == 1 }">
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2><span>Folder</span>案件受理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/flow/123List/2" target="navTab" rel="flow123List">立案审批</a></li>
							<li><a href="${pageContext.request.contextPath }/case/123ing" target="navTab" rel="123ing">审批中的仲裁申请</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件办理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/flow/6approveNoticeList" target="navTab" rel="6approveNoticeList">文书审批</a></li>
							<li><a href="${pageContext.request.contextPath }/flow/101112List/10" target="navTab" rel="flow101112List">仲裁员审批</a></li>
							<li><a href="${pageContext.request.contextPath }/flow/181920List/18" target="navTab" rel="flow181920List">裁决书审批</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件检索</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/retrieval/case" target="navTab" rel="retrievalCase">案件检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/receipt" target="navTab" rel="retrievalReceipt">送达文书检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/notice" target="navTab" rel="retrievalNotice">公告检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/arbitrator" target="navTab" rel="retrievalArbitrator">仲裁员审批表检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/award" target="navTab" rel="retrievalAward">裁决书检索</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件统计</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/statistics/count" target="navTab" rel="statisticsCount">案件数量统计</a></li>
							<li><a href="${pageContext.request.contextPath }/statistics/type" target="navTab" rel="statisticsType">案件类型统计</a></li>
							<li><a href="${pageContext.request.contextPath }/statistics/secretary" target="navTab" rel="statisticsSecretary">人员办案统计</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<p><span>欢迎您：<a>${user.name }</a></span></p>
							<p>身份：${user.role.name }&nbsp;&nbsp;&nbsp;&nbsp;登录用户名：${user.username }</p>
						</div>
						<div class="pageFormContent" style="width: 49%;padding: 0px;">
							<div class="index_title">进行中的案件：</div>
							<div id="caseing"></div>
						</div>
						<div id="menu" layoutH="58">
							<div class="index_title">1、立案审批：<a title="立案审批" target="navTab" href="${pageContext.request.contextPath }/flow/123List/2">查看详细</a></div>
							<div id="flow2"></div>
							<div class="index_title">2、文书审批：<a title="文书审批" target="navTab" href="${pageContext.request.contextPath }/flow/6approveNoticeList">查看详细</a></div>
							<div id="flow6approve"></div>
							<div class="index_title">3、仲裁员选定审批：<a title="仲裁员选定审批" target="navTab" href="${pageContext.request.contextPath }/flow/101112List/10">查看详细</a></div>
							<div id="flow10"></div>
							<div class="index_title">4、裁决书审批：<a title="裁决书审批" target="navTab" href="${pageContext.request.contextPath }/flow/181920List/18">查看详细</a></div>
							<div id="flow18"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<%-- 中心主任菜单 --%>
	<c:when test="${user.role.id == 2 }">
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2><span>Folder</span>案件受理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/flow/123List/3" target="navTab" rel="flow123List">立案审批</a></li>
							<li><a href="${pageContext.request.contextPath }/case/123ing" target="navTab" rel="123ing">审批中的仲裁申请</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件办理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/flow/101112List/11" target="navTab" rel="flow101112List">仲裁员审批</a></li>
							<li><a href="${pageContext.request.contextPath }/flow/181920List/19" target="navTab" rel="flow181920List">裁决书审批</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件检索</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/retrieval/case" target="navTab" rel="retrievalCase">案件检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/receipt" target="navTab" rel="retrievalReceipt">送达文书检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/notice" target="navTab" rel="retrievalNotice">公告检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/arbitrator" target="navTab" rel="retrievalArbitrator">仲裁员审批表检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/award" target="navTab" rel="retrievalAward">裁决书检索</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件统计</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/statistics/count" target="navTab" rel="statisticsCount">案件数量统计</a></li>
							<li><a href="${pageContext.request.contextPath }/statistics/type" target="navTab" rel="statisticsType">案件类型统计</a></li>
							<li><a href="${pageContext.request.contextPath }/statistics/secretary" target="navTab" rel="statisticsSecretary">人员办案统计</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<p><span>欢迎您：<a>${user.name }</a></span></p>
							<p>身份：${user.role.name }&nbsp;&nbsp;&nbsp;&nbsp;登录用户名：${user.username }</p>
						</div>
						<div class="pageFormContent" style="width: 49%;padding: 0px;">
							<div class="index_title">进行中的案件：</div>
							<div id="caseing"></div>
						</div>
						<div id="menu" layoutH="58">
							<div class="index_title">1、立案审批：<a title="立案审批" target="navTab" href="${pageContext.request.contextPath }/flow/123List/3">查看详细</a></div>
							<div id="flow3"></div>
							<div class="index_title">2、仲裁员选定审批：<a title="仲裁员选定审批" target="navTab" href="${pageContext.request.contextPath }/flow/101112List/11">查看详细</a></div>
							<div id="flow11"></div>
							<div class="index_title">3、裁决书审批：<a title="裁决书审批" target="navTab" href="${pageContext.request.contextPath }/flow/181920List/19">查看详细</a></div>
							<div id="flow19"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<%-- 仲裁委主任菜单 --%>
	<c:when test="${user.role.id == 3 }">
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2><span>Folder</span>案件受理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/case/123ing" target="navTab" rel="123ing">审批中的仲裁申请</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件办理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/flow/101112List/12" target="navTab" rel="flow101112List">仲裁员审批</a></li>
							<li><a href="${pageContext.request.contextPath }/flow/181920List/20" target="navTab" rel="flow181920List">裁决书审批</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件检索</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/retrieval/case" target="navTab" rel="retrievalCase">案件检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/receipt" target="navTab" rel="retrievalReceipt">送达文书检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/notice" target="navTab" rel="retrievalNotice">公告检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/arbitrator" target="navTab" rel="retrievalArbitrator">仲裁员审批表检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/award" target="navTab" rel="retrievalAward">裁决书检索</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件统计</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/statistics/count" target="navTab" rel="statisticsCount">案件数量统计</a></li>
							<li><a href="${pageContext.request.contextPath }/statistics/type" target="navTab" rel="statisticsType">案件类型统计</a></li>
							<li><a href="${pageContext.request.contextPath }/statistics/secretary" target="navTab" rel="statisticsSecretary">人员办案统计</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<p><span>欢迎您：<a>${user.name }</a></span></p>
							<p>身份：${user.role.name }&nbsp;&nbsp;&nbsp;&nbsp;登录用户名：${user.username }</p>
						</div>
						<div class="pageFormContent" style="width: 49%;padding: 0px;">
							<div class="index_title">进行中的案件：</div>
							<div id="caseing"></div>
						</div>
						<div id="menu" layoutH="58">
							<div class="index_title">1、仲裁员选定审批：<a title="仲裁员选定审批" target="navTab" href="${pageContext.request.contextPath }/flow/101112List/12">查看详细</a></div>
							<div id="flow12"></div>
							<div class="index_title">2、裁决书审批：<a title="裁决书审批" target="navTab" href="${pageContext.request.contextPath }/flow/181920List/20">查看详细</a></div>
							<div id="flow20"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<%-- 普通仲裁秘书(4)/立案秘书(9)菜单 --%>
	<c:when test="${user.role.id == 4 || user.role.id == 9 }">
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
					<c:if test="${user.role.id == 9 }">
						<div class="accordionHeader">
							<h2><span>Folder</span>案件受理</h2>
						</div>
						<div class="accordionContent">
							<ul class="tree treeFolder collapse">
								<li><a href="${pageContext.request.contextPath }/flow/0" target="navTab" rel="insertCase">添加仲裁申请</a></li>
								<li><a href="${pageContext.request.contextPath }/case/123ing/${user.id }" target="navTab" rel="123ing">审批中的仲裁申请</a></li>
								<li><a href="${pageContext.request.contextPath }/case/123ed/${user.id }" target="navTab" rel="123ed">审批通过仲裁申请</a></li>
								<li><a href="${pageContext.request.contextPath }/case/notice1List?uid=${user.id }" target="navTab" rel="notice1List">受理通知书</a></li>
							</ul>
						</div>
					</c:if>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件办理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="javascript:;">送达文书《受理案件后》</a>
								<ul>
									<li><a href="${pageContext.request.contextPath }/flow/5List/${user.id }" target="navTab" rel="flow5List">送达文书</a></li>
									<li><a href="${pageContext.request.contextPath }/flow/6receiptList/${user.id }" target="navTab" rel="6receiptList">完善送达文书</a></li>
									<li><a href="javascript:;">公告签发单</a>
										<ul>
											<li><a href="${pageContext.request.contextPath }/flow/6noticeList/${user.id }" target="navTab" rel="6noticeList">送达公告</a></li>
											<li><a href="${pageContext.request.contextPath }/notice/6approving/${user.id }" target="navTab" rel="6approving">审批中的公告</a></li>
											<li><a href="${pageContext.request.contextPath }/notice/6approved/${user.id }" target="navTab" rel="6approved">审批通过的公告</a></li>
										</ul>
									</li>
								</ul>
							</li>
							<li><a href="javascript:;">上报仲裁员</a>
								<ul>
									<li><a href="${pageContext.request.contextPath }/flow/9List/${user.id }" target="navTab" rel="flow9List">上报仲裁员</a></li>
									<li><a href="${pageContext.request.contextPath }/case/101112ing/${user.id }" target="navTab" rel="101112ing">审批中的仲裁员表</a></li>
									<li><a href="${pageContext.request.contextPath }/case/101112ed/${user.id }" target="navTab" rel="101112ed">审批通过的仲裁员表</a></li>
								</ul>
							</li>
							<li><a href="${pageContext.request.contextPath }/case/notice2List?uid=${user.id }" target="navTab" rel="notice2List">组庭通知书</a></li>
							<li><a href="javascript:;">送达文书《组庭后》</a>
								<ul>
									<li><a href="${pageContext.request.contextPath }/flow/14List/${user.id }" target="navTab" rel="flow14List">送达文书</a></li>
									<li><a href="${pageContext.request.contextPath }/flow/15receiptList/${user.id }" target="navTab" rel="15receiptList">完善送达文书</a></li>
								</ul>
							</li>
							<li><a href="${pageContext.request.contextPath }/case/notice3List?uid=${user.id }" target="navTab" rel="notice3List">开庭通知书</a></li>
							<li><a href="${pageContext.request.contextPath }/flow/16List/${user.id }" target="navTab" rel="flow16List">上传笔录和裁决书</a></li>
							<li><a href="javascript:;">下达裁决书</a>
								<ul>
									<li><a href="${pageContext.request.contextPath }/flow/17List/${user.id }" target="navTab" rel="flow17List">下达裁决书</a></li>
									<li><a href="${pageContext.request.contextPath }/award/awarding" target="navTab" rel="awardingList">审批中的裁决书</a></li>
								</ul>
							</li>
							<li><a href="javascript:;">送达文书《下达裁决书后》</a>
								<ul>
									<li><a href="${pageContext.request.contextPath }/flow/21List/${user.id }" target="navTab" rel="flow21List">送达文书</a></li>
									<li><a href="${pageContext.request.contextPath }/flow/22receiptList/${user.id }" target="navTab" rel="22receiptList">完善送达文书</a></li>
								</ul>
							</li>
							<li><a href="${pageContext.request.contextPath }/flow/23List/${user.id }" target="navTab" rel="flow23List">上报归档</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件检索</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/retrieval/case" target="navTab" rel="retrievalCase">案件检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/receipt" target="navTab" rel="retrievalReceipt">送达文书检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/notice" target="navTab" rel="retrievalNotice">公告检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/arbitrator" target="navTab" rel="retrievalArbitrator">仲裁员审批表检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/award" target="navTab" rel="retrievalAward">裁决书检索</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="${pageContext.request.contextPath }/index.jsp">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<p><span>欢迎您：<a>${user.name }</a></span></p>
							<p>身份：${user.role.name }&nbsp;&nbsp;&nbsp;&nbsp;登录用户名：${user.username }</p>
						</div>
						<div class="pageFormContent" layoutH="80" style="margin-right:230px">
						<br/><h2>送达文书《受理案件后》：</h2><br/>
							<p>
								<c:if test="${count5 == 0 }"><span class="notice_none">当前没有需要填写的送达文书清单！</span></c:if>
								<c:if test="${count5 > 0 }">
									当前有<span class="notice_number">${count5 }</span>个案件需要送达文书，
									<a href="${pageContext.request.contextPath }/flow/5List/${user.id }" rel="flow5List" title="填写送达文书" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<p>
								<c:if test="${count6receipt == 0 }"><span class="notice_none">当前没有需要完善的送达文书！</span></c:if>
								<c:if test="${count6receipt > 0 }">
									当前有<span class="notice_number">${count6receipt }</span>条待完善的送达文书，
									<a href="${pageContext.request.contextPath }/flow/6receiptList/${user.id }" rel="6receiptList" title="完善送达回证" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
							
							<br/><h2>公告签发单：</h2><br/>
							<p>
								<c:if test="${count6notice == 0 }"><span class="notice_none">当前没有要送达的公告！</span></c:if>
								<c:if test="${count6notice > 0 }">
									当前有<span class="notice_number">${count6notice }</span>条待送达的公告，
									<a href="${pageContext.request.contextPath }/flow/6noticeList/${user.id }" rel="6noticeList" title="送达公告" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
							<br/><h2>选定仲裁员：</h2><br/>
							<p>
								<c:if test="${count9 == 0 }"><span class="notice_none">当前没有需要选定仲裁员的案件！</span></c:if>
								<c:if test="${count9 > 0 }">
									当前有<span class="notice_number">${count9 }</span>条待选定仲裁员的案件，
									<a href="${pageContext.request.contextPath }/flow/9List/${user.id }" rel="flow9List" title="选定仲裁员" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
							<br/><h2>送达文书《组庭后》：</h2><br/>
							<p>
								<c:if test="${count14 == 0 }"><span class="notice_none">当前没有需要送达文书的案件！</span></c:if>
								<c:if test="${count14 > 0 }">
									当前有<span class="notice_number">${count14 }</span>个案件等待送达文书，
									<a href="${pageContext.request.contextPath }/flow/14List/${user.id }" rel="flow14List" title="填写送达文书" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<p>
								<c:if test="${count15receipt == 0 }"><span class="notice_none">当前没有需要完善的送达回证！</span></c:if>
								<c:if test="${count15receipt > 0 }">
									当前有<span class="notice_number">${count15receipt }</span>条待完善的送达回证，
									<a href="${pageContext.request.contextPath }/flow/15receiptList/${user.id }" rel="15receiptList" title="完善送达回证" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
							<br/><h2>上传笔录和裁决书：</h2><br/>
							<p>
								<c:if test="${count16 == 0 }"><span class="notice_none">当前没有需要上传笔录和裁决书！</span></c:if>
								<c:if test="${count16 > 0 }">
									当前有<span class="notice_number">${count16 }</span>条待上传的笔录和裁决书，
									<a href="${pageContext.request.contextPath }/flow/16List/${user.id }" title="上传笔录和裁决书" target="navTab" rel="flow16List" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
							<br/><h2>下达裁决书：</h2><br/>
							<p>
								<c:if test="${count17 == 0 }"><span class="notice_none">当前没有需要下达的裁决书！</span></c:if>
								<c:if test="${count17 > 0 }">
									当前有<span class="notice_number">${count17 }</span>条待下达的裁决书，
									<a href="${pageContext.request.contextPath }/flow/17List/${user.id }" title="下达裁决书" target="navTab" rel="flow17List" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
							<br/><h2>送达文书《下达裁决书后》：</h2><br/>
							<p>
								<c:if test="${count21 == 0 }"><span class="notice_none">当前没有需要送达文书的案件！</span></c:if>
								<c:if test="${count21 > 0 }">
									当前有<span class="notice_number">${count21 }</span>个案件等待送达文书，
									<a href="${pageContext.request.contextPath }/flow/21List/${user.id }" rel="flow21List" title="填写送达文书" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<p>
								<c:if test="${count22receipt == 0 }"><span class="notice_none">当前没有需要完善的送达文书！</span></c:if>
								<c:if test="${count22receipt > 0 }">
									当前有<span class="notice_number">${count22receipt }</span>条待完善的送达文书，
									<a href="${pageContext.request.contextPath }/flow/22receiptList/${user.id }" rel="22receiptList" title="完善送达文书" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<%-- 归档秘书菜单 --%>
	<c:when test="${user.role.id == 8 }">
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2><span>Folder</span>案件受理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/flow/0" target="navTab" rel="insertCase">添加仲裁申请</a></li>
							<li><a href="${pageContext.request.contextPath }/case/123ing/${user.id }" target="navTab" rel="123ing">审批中的仲裁申请</a></li>
							<li><a href="${pageContext.request.contextPath }/case/123ed/${user.id }" target="navTab" rel="123ed">审批通过仲裁申请</a></li>
							<li><a href="${pageContext.request.contextPath }/case/notice1List?uid=${user.id }" target="navTab" rel="notice1List">受理通知书</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件办理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="javascript:;">送达文书《受理案件后》</a>
								<ul>
									<li><a href="${pageContext.request.contextPath }/flow/5List/${user.id }" target="navTab" rel="flow5List">送达文书</a></li>
									<li><a href="${pageContext.request.contextPath }/flow/6receiptList/${user.id }" target="navTab" rel="6receiptList">完善送达文书</a></li>
									<li><a href="javascript:;">公告签发单</a>
										<ul>
											<li><a href="${pageContext.request.contextPath }/flow/6noticeList/${user.id }" target="navTab" rel="6noticeList">送达公告</a></li>
											<li><a href="${pageContext.request.contextPath }/notice/6approving/${user.id }" target="navTab" rel="6approving">审批中的公告</a></li>
										</ul>
									</li>
								</ul>
							</li>
							<li><a href="javascript:;">上报仲裁员</a>
								<ul>
									<li><a href="${pageContext.request.contextPath }/flow/9List/${user.id }" target="navTab" rel="flow9List">上报仲裁员</a></li>
									<li><a href="${pageContext.request.contextPath }/case/101112ing/${user.id }" target="navTab" rel="101112ing">审批中的仲裁员表</a></li>
									<li><a href="${pageContext.request.contextPath }/case/101112ed/${user.id }" target="navTab" rel="101112ed">审批通过的仲裁员表</a></li>
								</ul>
							</li>
							<li><a href="${pageContext.request.contextPath }/case/notice2List?uid=${user.id }" target="navTab" rel="notice2List">组庭通知书</a></li>
							<li><a href="javascript:;">送达文书《组庭后》</a>
								<ul>
									<li><a href="${pageContext.request.contextPath }/flow/14List/${user.id }" target="navTab" rel="flow14List">送达文书</a></li>
									<li><a href="${pageContext.request.contextPath }/flow/15receiptList/${user.id }" target="navTab" rel="15receiptList">完善送达文书</a></li>
								</ul>
							</li>
							<li><a href="${pageContext.request.contextPath }/case/notice3List?uid=${user.id }" target="navTab" rel="notice3List">开庭通知书</a></li>
							<li><a href="${pageContext.request.contextPath }/flow/16List/${user.id }" target="navTab" rel="flow16List">上传笔录和裁决书</a></li>
							<li><a href="javascript:;">下达裁决书</a>
								<ul>
									<li><a href="${pageContext.request.contextPath }/flow/17List/${user.id }" target="navTab" rel="flow17List">下达裁决书</a></li>
									<li><a href="${pageContext.request.contextPath }/award/awarding" target="navTab" rel="awardingList">审批中的裁决书</a></li>
								</ul>
							</li>
							<li><a href="javascript:;">送达文书《下达裁决书后》</a>
								<ul>
									<li><a href="${pageContext.request.contextPath }/flow/21List/${user.id }" target="navTab" rel="flow21List">送达文书</a></li>
									<li><a href="${pageContext.request.contextPath }/flow/22receiptList/${user.id }" target="navTab" rel="22receiptList">完善送达文书</a></li>
								</ul>
							</li>
							<li><a href="${pageContext.request.contextPath }/flow/23List/${user.id }" target="navTab" rel="flow23List">上报归档</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件归档</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/flow/24List" target="navTab" rel="flow24List">案件归档</a></li>
							<%-- <li><a href="${pageContext.request.contextPath }" target="navTab" rel="">归档案件汇总</a></li> --%>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件检索</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/retrieval/case" target="navTab" rel="retrievalCase">案件检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/receipt" target="navTab" rel="retrievalReceipt">送达文书检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/notice" target="navTab" rel="retrievalNotice">公告检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/arbitrator" target="navTab" rel="retrievalArbitrator">仲裁员审批表检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/award" target="navTab" rel="retrievalAward">裁决书检索</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<p><span>欢迎您：<a>${user.name }</a></span></p>
							<p>身份：${user.role.name }&nbsp;&nbsp;&nbsp;&nbsp;登录用户名：${user.username }</p>
						</div>
						<div class="pageFormContent" layoutH="80" style="margin-right:230px">
						<br/><h2>送达文书《受理案件后》：</h2><br/>
							<p>
								<c:if test="${count5 == 0 }"><span class="notice_none">当前没有需要填写的送达文书清单！</span></c:if>
								<c:if test="${count5 > 0 }">
									当前有<span class="notice_number">${count5 }</span>个案件需要送达文书，
									<a href="${pageContext.request.contextPath }/flow/5List/${user.id }" rel="flow5List" title="填写送达文书" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<p>
								<c:if test="${count6receipt == 0 }"><span class="notice_none">当前没有需要完善的送达文书！</span></c:if>
								<c:if test="${count6receipt > 0 }">
									当前有<span class="notice_number">${count6receipt }</span>条待完善的送达文书，
									<a href="${pageContext.request.contextPath }/flow/6receiptList/${user.id }" rel="6receiptList" title="完善送达回证" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
							
							<br/><h2>公告签发单：</h2><br/>
							<p>
								<c:if test="${count6notice == 0 }"><span class="notice_none">当前没有要送达的公告！</span></c:if>
								<c:if test="${count6notice > 0 }">
									当前有<span class="notice_number">${count6notice }</span>条待送达的公告，
									<a href="${pageContext.request.contextPath }/flow/6noticeList/${user.id }" rel="6noticeList" title="送达公告" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
							<br/><h2>选定仲裁员：</h2><br/>
							<p>
								<c:if test="${count9 == 0 }"><span class="notice_none">当前没有需要选定仲裁员的案件！</span></c:if>
								<c:if test="${count9 > 0 }">
									当前有<span class="notice_number">${count9 }</span>条待选定仲裁员的案件，
									<a href="${pageContext.request.contextPath }/flow/9List/${user.id }" rel="flow9List" title="选定仲裁员" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
							<br/><h2>送达文书《组庭后》：</h2><br/>
							<p>
								<c:if test="${count14 == 0 }"><span class="notice_none">当前没有需要送达文书的案件！</span></c:if>
								<c:if test="${count14 > 0 }">
									当前有<span class="notice_number">${count14 }</span>个案件等待送达文书，
									<a href="${pageContext.request.contextPath }/flow/14List/${user.id }" rel="flow14List" title="填写送达文书" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<p>
								<c:if test="${count15receipt == 0 }"><span class="notice_none">当前没有需要完善的送达回证！</span></c:if>
								<c:if test="${count15receipt > 0 }">
									当前有<span class="notice_number">${count15receipt }</span>条待完善的送达回证，
									<a href="${pageContext.request.contextPath }/flow/15receiptList/${user.id }" rel="15receiptList" title="完善送达回证" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
							<br/><h2>上传笔录和裁决书：</h2><br/>
							<p>
								<c:if test="${count16 == 0 }"><span class="notice_none">当前没有需要上传的笔录和裁决书！</span></c:if>
								<c:if test="${count16 > 0 }">
									当前有<span class="notice_number">${count16 }</span>条待上传的笔录和裁决书，
									<a href="${pageContext.request.contextPath }/flow/16List/${user.id }" title="上传笔录和裁决书" target="navTab" rel="flow16List" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
							<br/><h2>下达裁决书：</h2><br/>
							<p>
								<c:if test="${count17 == 0 }"><span class="notice_none">当前没有需要下达的裁决书！</span></c:if>
								<c:if test="${count17 > 0 }">
									当前有<span class="notice_number">${count17 }</span>条待下达的裁决书，
									<a href="${pageContext.request.contextPath }/flow/17List/${user.id }" title="下达裁决书" target="navTab" rel="flow17List" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
							<br/><h2>送达文书《下达裁决书后》：</h2><br/>
							<p>
								<c:if test="${count21 == 0 }"><span class="notice_none">当前没有需要送达文书的案件！</span></c:if>
								<c:if test="${count21 > 0 }">
									当前有<span class="notice_number">${count21 }</span>个案件等待送达文书，
									<a href="${pageContext.request.contextPath }/flow/21List/${user.id }" rel="flow21List" title="填写送达文书" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<p>
								<c:if test="${count22receipt == 0 }"><span class="notice_none">当前没有需要完善的送达文书！</span></c:if>
								<c:if test="${count22receipt > 0 }">
									当前有<span class="notice_number">${count22receipt }</span>条待完善的送达文书，
									<a href="${pageContext.request.contextPath }/flow/22receiptList/${user.id }" rel="22receiptList" title="完善送达文书" target="navTab" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
							<br/><h2>案件归档：</h2><br/>
							<p>
								<c:if test="${count24 == 0 }"><span class="notice_none">当前没有需要归档的案件！</span></c:if>
								<c:if test="${count24 > 0 }">
									当前有<span class="notice_number">${count24 }</span>个待归档的案件，
									<a href="${pageContext.request.contextPath }/flow/24List" title="案件归档" target="navTab" rel="flow24List" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p>
							<div class="divider"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<%-- 立案科长菜单 --%>
	<c:when test="${user.role.id == 5 }">
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2><span>Folder</span>案件申请</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/flow/0" target="navTab" rel="insertCase">添加仲裁申请</a></li>
							<li><a href="${pageContext.request.contextPath }/case/123ing/${user.id }" target="navTab" rel="123ing">审批中的仲裁申请</a></li>
							<li><a href="${pageContext.request.contextPath }/case/123ed/${user.id }" target="navTab" rel="123ed">审批通过仲裁申请</a></li>
							<li><a href="${pageContext.request.contextPath }/case/notice1List?uid=${user.id }" target="navTab" rel="notice1List">受理通知书</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件受理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/flow/123List/1" target="navTab" rel="flow123List">立案审批</a></li>
							<li><a href="${pageContext.request.contextPath }/case/123ing" target="navTab" rel="123ing">审批中的仲裁申请</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件检索</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/retrieval/case" target="navTab" rel="retrievalCase">案件检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/receipt" target="navTab" rel="retrievalReceipt">送达文书检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/notice" target="navTab" rel="retrievalNotice">公告检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/arbitrator" target="navTab" rel="retrievalArbitrator">仲裁员审批表检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/award" target="navTab" rel="retrievalAward">裁决书检索</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件统计</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/statistics/count" target="navTab" rel="statisticsCount">案件数量统计</a></li>
							<li><a href="${pageContext.request.contextPath }/statistics/type" target="navTab" rel="statisticsType">案件类型统计</a></li>
							<li><a href="${pageContext.request.contextPath }/statistics/secretary" target="navTab" rel="statisticsSecretary">人员办案统计</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>系统管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/case" target="navTab" rel="user">案件管理</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<p><span>欢迎您：<a>${user.name }</a></span></p>
							<p>身份：${user.role.name }&nbsp;&nbsp;&nbsp;&nbsp;登录用户名：${user.username }</p>
						</div>
						<div class="pageFormContent" style="width: 49%;padding: 0px;">
							<div class="index_title">进行中的案件：</div>
							<div id="caseing"></div>
						</div>
						<div id="menu" layoutH="58">
							<div class="index_title">立案审批：<a title="立案审批" target="navTab" href="${pageContext.request.contextPath }/flow/123List/1">查看详细</a></div>
							<div id="flow1"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<%-- 联络科长菜单 --%>
	<c:when test="${user.role.id == 6 }">
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2><span>Folder</span>案件受理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/flow/0" target="navTab" rel="insertCase">添加仲裁申请</a></li>
								<li><a href="${pageContext.request.contextPath }/case/123ing/${user.id }" target="navTab" rel="123ing">审批中的仲裁申请</a></li>
								<li><a href="${pageContext.request.contextPath }/case/123ed/${user.id }" target="navTab" rel="123ed">审批通过仲裁申请</a></li>
								<li><a href="${pageContext.request.contextPath }/case/notice1List?uid=${user.id }" target="navTab" rel="notice1List">受理通知书</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件办理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/flow/4List" target="navTab" rel="flow4List">指定办案秘书</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件检索</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/retrieval/case" target="navTab" rel="retrievalCase">案件检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/receipt" target="navTab" rel="retrievalReceipt">送达文书检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/notice" target="navTab" rel="retrievalNotice">公告检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/arbitrator" target="navTab" rel="retrievalArbitrator">仲裁员审批表检索</a></li>
							<li><a href="${pageContext.request.contextPath }/retrieval/award" target="navTab" rel="retrievalAward">裁决书检索</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>案件统计</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/statistics/count" target="navTab" rel="statisticsCount">案件数量统计</a></li>
							<li><a href="${pageContext.request.contextPath }/statistics/type" target="navTab" rel="statisticsType">案件类型统计</a></li>
							<li><a href="${pageContext.request.contextPath }/statistics/secretary" target="navTab" rel="statisticsSecretary">人员办案统计</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<p><span>欢迎您：<a>${user.name }</a></span></p>
							<p>身份：${user.role.name }&nbsp;&nbsp;&nbsp;&nbsp;登录用户名：${user.username }</p>
						</div>
						<div class="pageFormContent" style="width: 49%;padding: 0px;">
							<div class="index_title">进行中的案件：</div>
							<div id="caseing"></div>
						</div>
						<div id="menu" layoutH="58">
							<div class="index_title">1、分案：<a title="指定办案秘书" target="navTab" href="${pageContext.request.contextPath }/flow/4List">查看详细</a></div>
							<div id="flow4"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<%-- 会计菜单 --%>
	<c:when test="${user.role.id == 7 }">
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2><span>Folder</span>费用管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="${pageContext.request.contextPath }/case/costList" target="navTab" rel="caseCostList">案件费用管理</a></li>
							<li><a href="${pageContext.request.contextPath }/arbitrator/costList" target="navTab" rel="arbitratorCostList">仲裁员费用管理</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="${pageContext.request.contextPath }/index.jsp">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<p><span>欢迎您：<a>${user.name }</a></span></p>
							<p>身份：${user.role.name }&nbsp;&nbsp;&nbsp;&nbsp;登录用户名：${user.username }</p>
						</div>
						<div class="pageFormContent" layoutH="80" style="margin-right:230px">
							<%-- <br/><h2>案件费用管理：</h2><br/>
							<p>
								<c:if test="${count1 == 0 }"><span class="notice_none">当前没有要审批的仲裁申请！</span></c:if>
								<c:if test="${count1 > 0 }">
									当前有<span class="notice_number">${count1 }</span>条待审批的仲裁申请，
									<a href="${pageContext.request.contextPath }/flow/123List/1" title="立案审批" target="navTab" rel="flow123List" style="color: red;text-decoration: underline;">点击这里查看...</a>
								</c:if>
							</p> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>
		
	</div>
	<div id="footer">Copyright &copy; 2013 Herbaceous Inc. All Rights Reserved.</div>

</body>
</html>