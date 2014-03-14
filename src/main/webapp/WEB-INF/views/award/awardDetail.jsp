<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="panelBar">
	<ul class="toolBar">
		<li class="line">line</li>
		<li><a class="icon" href="javascript:$.printBox('print_award')"><span>打印</span></a></li>
		<li class="line">line</li>
	</ul>
</div>

<div layoutH="30" id="print_award">
	<table class="print_award">
		<tr>
			<th class="th1"></th>
			<th class="th2"></th>
			<th class="th3"></th>
		</tr>
		<tr class="title"><td colspan="3">安阳仲裁委员会</td></tr>
		<tr class="title2">
			<td colspan="3">
				<c:forEach var="type" items="${awardTypes }"><c:if test="${awardTypes[award.type] == type }">${type }</c:if></c:forEach>书签发单
			</td>
		</tr>
		<tr>
			<td colspan="3" class="right">
				${fn:split(award.id,"-")[0] }安仲<c:forEach var="type" items="${awardTypes }"><c:if test="${awardTypes[award.type] == type }">${fn:split(type, '')[0] }</c:if></c:forEach>字第${fn:split(award.id,"-")[1] }号
			</td>
		</tr>
		<tr class="row">
			<td>案由：</td>
			<td colspan="2">${award.cause }</td>
		</tr>
		<tr class="row">
			<td>申请人：</td>
			<td colspan="2">${award.applicant }</td>
		</tr>
		<tr class="row">
			<td>被申请人：</td>
			<td colspan="2">${award.respondent }</td>
		</tr>
		<tr class="row">
			<td>受案日期：</td>
			<td colspan="2"><fmt:formatDate value="${award.caseDate }" pattern="yyyy年MM月dd日"/></td>
		</tr>
		<tr class="row">
			<td>承办人：</td>
			<td colspan="2">${award.undertaker }</td>
		</tr>
		<tr class="row">
			<td>审核人：</td>
			<td colspan="2">${award.auditor }</td>
		</tr>
		<tr class="row">
			<td>秘书长：</td>
			<td colspan="2">${award.secretaryGeneral }</td>
		</tr>
		<tr class="row">
			<td>主任：</td>
			<td colspan="2">${award.director }</td>
		</tr>
		<tr class="row">
			<td>仲裁秘书：${award.secretary }</td>
			<td>初审：${award.firstTrial }</td>
			<td>印数：${award.printing }份</td>
		</tr>
	</table>
</div>
