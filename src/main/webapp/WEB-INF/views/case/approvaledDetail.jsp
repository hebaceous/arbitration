<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="panelBar">
	<ul class="toolBar">
		<li class="line">line</li>
		<li><a class="icon" href="javascript:$.printBox('print_case')"><span>打印</span></a></li>
		<li class="line">line</li>
	</ul>
</div>

<div layoutH="30" id="print_case">
	<table class="print_case">
		<tr>
			<th class="th1"></th>
			<th></th>
			<th></th>
		</tr>
		<tr class="title">
			<td colspan="3">安阳仲裁委员会仲裁申请受理审批表</td>
		</tr>
		<tr class="number">
			<td colspan="3">案件号：（${fn:split(c.id,"-")[0] }）安仲案字${fn:split(c.id,"-")[1] }号</td>
		</tr>
		<tr>
			<td>案由：</td>
			<td colspan="2">${c.cause }</td>
		</tr>
		<tr>
			<td>申请人：</td>
			<td colspan="2">${names1 }</td>
		</tr>
		<tr>
			<td>被申请人：</td>
			<td colspan="2">${names2 }</td>
		</tr>
		<tr>
			<td>仲裁协议：</td>
			<td colspan="2">
				<c:if test="${empty(c.agreement) }">已有</c:if>
				<c:if test="${!empty(c.agreement) }">联系人：${c.agreement }</c:if>
			</td>
		</tr>
		<tr>
			<td>仲裁请求事项：</td>
			<td colspan="2">${c.request }</td>
		</tr>
		<tr>
			<td>争议金额：</td>
			<td colspan="2">${c.money }</td>
		</tr>
		<tr>
			<td>立案科意见：</td>
			<td colspan="2">
				${fn:split(c.responsiblePersonOpinion,",")[0] }
				<p>${fn:split(c.responsiblePersonOpinion,",")[1] }
				<p>${fn:split(c.responsiblePersonOpinion,",")[2] }
			</td>
		</tr>
		<tr>
			<td>部门初审意见：</td>
			<td colspan="2">
				${fn:split(c.departmentOpinion,",")[0] }
				<p>${fn:split(c.departmentOpinion,",")[1] }
				<p>${fn:split(c.departmentOpinion,",")[2] }
			</td>
		</tr>
		<tr>
			<td>中心主任审批意见：</td>
			<td colspan="2">
				${fn:split(c.secretaryGeneralOpinion,",")[0] }
				<p>${fn:split(c.secretaryGeneralOpinion,",")[1] }
				<p>${fn:split(c.secretaryGeneralOpinion,",")[2] }
			</td>
		</tr>
		<tr>
			<td>案件费用：</td>
			<td>受理费：${c.acceptCharges }</td>
			<td>处理费：${c.handlingCharges }</td>
		</tr>
		<tr>
			<td>立案员：</td>
			<td>${c.caseOfficer }</td>
			<td>仲裁秘书：${c.user.name }</td>
		</tr>
		<tr>
			<td>备注：</td>
			<td colspan="2" style="text-align: right;">申请日期：<fmt:formatDate value="${c.date }" pattern="yyyy年MM月dd日"/></td>
		</tr>
	</table>
</div>