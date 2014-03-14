<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript">
$(function() {
	$("#notice2_select").unbind("change").bind("change",function(){
		var $option = $("#notice2_select option:selected");
		var name = $option.val();
		$("#notice2_name").html("&nbsp;&nbsp;"+name+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:");
	});
	/**
	* 填补仲裁员姓名
	**/
	var $spans = $('#print_notice2 table tr.tr2 span');
	if(parseInt('${c.applicableProcedure }') == 0){	//简易
		$($spans[5]).html('&nbsp;&nbsp;${arbitrators[0].name }&nbsp;&nbsp;');
	} else {	//普通
		$($spans[2]).html('&nbsp;&nbsp;${arbitrators[0].name }&nbsp;&nbsp;');
		$($spans[3]).html('&nbsp;&nbsp;${arbitrators[1].name }&nbsp;&nbsp;');
		$($spans[4]).html('&nbsp;&nbsp;${arbitrators[2].name }&nbsp;&nbsp;');
		$($spans[5]).html('&nbsp;&nbsp;${arbitrators[0].name }&nbsp;&nbsp;');
	}
});
/**
 * 处理打印时判断是否选择申请人/被申请人
 */
function doPrint() {
	if($('#notice2_select option:selected').val() == ''){
		alert('请先选择申请人或者被申请人！');
	} else {
		$.printBox('print_notice2');
	}
}
</script>

<div class="pageHeader">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					选择（被）申请人：
				</td>
				<td>
					<select id="notice2_select" class="combox">
						<option value="">请选择</option>
						<c:forEach var="applicant" items="${applicants }">
							<option>${applicant.name }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
	</div>
</div>

<div class="panelBar">
	<ul class="toolBar">
		<li class="line">line</li>
		<li><a class="icon" href="javascript:doPrint();"><span>打印</span></a></li>
		<li class="line">line</li>
	</ul>
</div>

<div layoutH="60" id="print_notice2">
	<table class="print_notice2">
		<tr class="title"><td>安阳仲裁委员会</td></tr>
		<tr class="title2"><td>仲裁庭组成通知书</td></tr>
		<tr class="number"><td>（${fn:split(c.id,"-")[0] }）安仲组字第（${fn:split(c.id,"-")[1] }）号</td></tr>
		<tr class="tr1"><td id="notice2_name"></td></tr>
		<tr class="tr2">
			<td>
				根据《安阳仲裁委员会仲裁规则》之规定，本会受理的<span>&nbsp;&nbsp;${names[0] }&nbsp;&nbsp;</span>与<span>&nbsp;&nbsp;${names[1] }&nbsp;&nbsp;</span>一案，
				由冲裁员
				<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>、
				<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>、
				<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>组成仲裁庭，
				<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>为首席/独任仲裁员。
				<%-- <!-- 简易 -->
				<c:if test="${c.applicableProcedure == 0 }">
					由<span>${arbitrators[0].name }</span>为独任仲裁员。
				</c:if>
				<!-- 普通 -->
				<c:if test="${c.applicableProcedure == 1 }">
					由冲裁员<span>${arbitrators[0].name }</span>、<span>${arbitrators[1].name }</span>、<span>${arbitrators[2].name }</span>组成仲裁庭，
					<span>${arbitrators[2].name }</span>为首席仲裁员。
				</c:if> --%>
			</td>
		</tr>
		<tr class="tr3">
			<td>特此通知</td>
		</tr>
		<tr class="tr4">
			<td>安阳仲裁委员会</td>
		</tr>
		<% Date now = new Date();pageContext.setAttribute("now", now); %>
		<tr class="tr4">
			<td colspan="2"><fmt:formatDate value="${now }" pattern="yyyy年MM月dd日"/></td>
		</tr>
		<tr class="tr3">
			<td>注：本案的仲裁秘书：${c.user.name }</td>
		</tr>
		<tr class="tr3">
			<td>联系电话：2963110</td>
		</tr>
	</table>
</div>
