<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="panelBar">
	<ul class="toolBar">
		<li class="line">line</li>
		<li><a class="icon" href="javascript:$.printBox('print_notice')"><span>打印</span></a></li>
		<li class="line">line</li>
	</ul>
</div>

<div layoutH="30" id="print_notice">
	<table class="print_notice">
		<tr>
			<th class="th1"></th>
			<th></th>
		</tr>
		<tr class="title"><td colspan="2">安阳仲裁委员会公告签发单</td></tr>
		<tr>
			<td class="td1">案号：</td>
			<td>${fn:split(notice.id,"-")[0] }安仲案字${fn:split(notice.id,"-")[1] }号</td>
		</tr>
		<tr>
			<td>案由：</td>
			<td>${notice.cause }</td>
		</tr>
		<tr>
			<td>申请人：</td>
			<td>${notice.applicant }</td>
		</tr>
		<tr>
			<td>被申请人：</td>
			<td>${notice.respondent }</td>
		</tr>
		<tr class="tr1">
			<td colspan="2">公告内容：</td>
		</tr>
		<tr class="tr2">
			<td colspan="2">
				<span>${notice.applicant }</span>
				我会受理的申请人
				<span>${notice.applicant }</span>
				与你公司之间
				<span>${notice.cause }</span>
				合同纠纷一案，现依法向你送达（${fn:split(notice.id,"-")[0] }）安仲通字第
				<span>${fn:split(notice.id,"-")[1] }</span>
				号仲裁通知书，仲裁申请书副本、仲裁员选定书、本会的仲裁规则和仲裁员名册等案件材料，自公告之日起六十日内即视为送达。你提出答辩书及选定仲裁员的期限为公告期满后15日内。答辩期满后，本会将依法成立仲裁庭，并定于
				<span>
					<fmt:formatDate value="${notice.courtDate }" pattern="yyyy年MM月dd日 HH点"/>
				</span>
				在本会仲裁庭审理本案。
			</td>
		</tr>
		<tr class="tr3">
			<td colspan="2">安阳仲裁委员会</td>
		</tr>
		<tr class="tr4">
			<td colspan="2">
				<fmt:formatDate value="${notice.deliveredDate }" pattern="yyyy年MM月dd日"/>
			</td>
		</tr>
		<tr class="tr5">
			<td colspan="2">（本会地址：河南省安阳市友谊路16号，联系人： ${notice.secretary }，电话0372—2963110）</td>
		</tr>
		<tr>
			<td>仲裁秘书：</td>
			<td>${notice.secretary }</td>
		</tr>
	</table>
</div>