<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript">
$(function() {
	$("#notice1_select").unbind("change").bind("change",function(){
		var $option = $("#notice1_select option:selected");
		var name = $option.val();
		var isApplicant = $option.attr("isApplicant");
		$("#notice1_name").html("&nbsp;&nbsp;"+name+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:");
		if(isApplicant == "true"){
			$("#notice1_applicant").show();
			$("#notice1_respondent").hide();
		} else {
			$("#notice1_applicant").hide();
			$("#notice1_respondent").show();
		}
	});
});
/**
 * 处理打印时判断是否选择申请人/被申请人
 */
function doPrint() {
	if($('#notice1_select option:selected').val() == ''){
		alert('请先选择申请人或者被申请人！');
	} else {
		$.printBox('print_notice1');
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
					<select id="notice1_select" class="combox">
						<option value="">请选择</option>
						<c:forEach var="applicant" items="${applicants }">
							<option isApplicant="${applicant.isApplicant }">${applicant.name }</option>
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

<div layoutH="60" id="print_notice1">
	<table class="print_notice1">
		<tr>
			<th class="th1"></th>
			<th class="th2"></th>
		</tr>
		<tr class="title"><td colspan="2">安阳仲裁委员会</td></tr>
		<tr class="title2"><td colspan="2">受理通知书</td></tr>
		<tr class="number"><td colspan="2">（${fn:split(c.id,"-")[0] }）安仲受字第&nbsp;${fn:split(c.id,"-")[1] }&nbsp;号</td></tr>
		<tr class="tr1"><td colspan="2" id="notice1_name"></td></tr>
		<tr class="tr2">
			<td colspan="2">
				<div id="notice1_applicant">
					<p><span><fmt:formatDate value="${c.date }" pattern="yyyy年MM月dd日"/></span>你（单位）递交的仲裁申请书已收悉。经审核，符合《中华人民共和国仲裁法》和《安阳仲裁委员会仲裁规则》规定的受理案件，本会决定受理仲裁申请。现将有关事宜通知如下：</p>
					<p>一、请填写《法定代表人证明书》（单位必填）、《授权委托书》送交本会。</p>
					<p>二、请于收到此《受理通知书》之日起<span>10</span>日内在本会的《仲裁员名册》中选定或者委托本会主任指定仲裁员。逾期未选定的，由本会主任指定。</p>
					<p>三、请于收到此《受理通知书》之日起<span>5</span>内，向本会预交案件受理费<span>${c.acceptCharges }</span>元，案件处理费<span>${c.handlingCharges }</span>元。逾期不交的，视为撤回仲裁申请。
				</div>
				<div id="notice1_respondent" style="display: none;">
					<p>申请人<span>${names[0] }</span>就与你（单位）发生的<span>${c.cause }</span>争议向本会提出仲裁申请，本会已受理此案。现将申请人递交的仲裁申请书（副本）和本通知书送你单位，并将有关事宜通知如下：</p>
					<p>一、请在申请书副本送达回证上签收，并在注明签收人姓名和收到时间将送达回证退回本会。</p>
					<p>二、你单位应在收受本通知书之日起<span>7</span>日内向本会递交答辩书及有关证明材料，并递交答辩书副本<span>1</span>份，未递交答辩书的，不影响案件审理。</p>
					<p>三、你单位应在收到本通知书之日起<span>5</span>日内根据本会《仲裁庭人数选定书》填写有关内容，并将该选定书退回本会。</p>
					<p>四、请向本会递交《法定代表人证明书》、《授权委托书》一式二份。</p>
					<p>五、如有反请求事项，请在本通知第二条规定的递交答辩书的期限内，一并递交反请求申请书。</p>
				</div>
				<p class="ps">附：《法定代表人证明书》一份、《授权委托书》一份、本会《仲裁员名册》一份、本会《仲裁规则》一份、《仲裁选定书》一份。
			</td>
		</tr>
		<tr class="tr3">
			<td>本会联系人:${c.user.name }</td>
			<td>电话：2963110</td>
		</tr>
		<tr class="tr4">
			<td colspan="2">安阳仲裁委员会</td>
		</tr>
		<%
			Date now = new Date();
			pageContext.setAttribute("now", now);
		%>
		<tr class="tr4">
			<td colspan="2"><fmt:formatDate value="${now }" pattern="yyyy年MM月dd日"/></td>
		</tr>
	</table>
</div>
