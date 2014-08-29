<%@ page import="java.util.Date"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript">
$(function() {
	$("#notice3_select").unbind("change").bind("change",function(){
		var $option = $("#notice3_select option:selected");
		var name = $option.val();
		$("#notice3_name").html("&nbsp;&nbsp;"+name+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:");
	});
});
/**
 * 处理打印时判断是否选择申请人/被申请人
 */
function doPrint() {
	if($('#notice3_select option:selected').val() == ''){
		alert('请先选择申请人或者被申请人！');
	} else {
		$.printBox('print_notice3');
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
					<select id="notice3_select" class="combox">
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

<div layoutH="60" id="print_notice3">
	<table class="print_notice3">
		<tr class="title"><td>安阳仲裁委员会</td></tr>
		<tr class="title2"><td>开庭通知书</td></tr>
		<tr class="number"><td>（${fn:split(c.id,"-")[0] }）安仲开字第（${fn:split(c.id,"-")[1] }）号</td></tr>
		<tr class="tr1"><td id="notice3_name"></td></tr>
		<tr class="tr2">
			<td>
				现决定<span>${names[0] }</span>与<span>${names[1] }</span>一案，于
				<fmt:formatDate value="${c.courtDate }" pattern="yyyy年MM月dd日HH时KK分"/>在安阳仲裁委员会仲裁庭开庭仲裁，请准时到庭。
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
			<td>注：1、申请人无正当理由不到庭或者未经仲裁庭许可中途退庭的，可以视为撤回仲裁请求；被申请人无正当理由不
			到庭或者未经仲裁庭许可中途退庭的，仲裁庭可以缺席审理并作出裁决。</td>
		</tr>
		<tr class="tr5">
			<td>2、仲裁秘书 联系电话：2963110</td>
		</tr>
	</table>
</div>
