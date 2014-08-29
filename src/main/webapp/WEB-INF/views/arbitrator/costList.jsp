<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form id="pagerForm" method="post" action="${pageContext.request.contextPath }/arbitrator/costList">
</form>

<div class="pageContent">

	<div>
	<table class="list" width="98%" targetType="navTab" layoutH="116">
		<thead>
			<tr>
				<th width="130">案件号</th>
				<th>仲裁员</th>
				<th>职务</th>
				<th>应付费用</th>
				<th>已付费用</th>
				<th>欠费金额</th>
				<th>是否付清</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty arbitratorDetails }">
				<tr>
					<td colspan="9" style="text-align: center;color: red;">没有相关数据！</td>
				</tr>
			</c:if>
			<c:forEach var="detail" items="${arbitratorDetails }">
			<tr>
				<td>${fn:split(detail.id,"-")[0] }安仲案字${fn:split(detail.id,"-")[1] }号</td>
				<td>${detail.name }</td>
				<td>${detail.post }</td>
				<td>${detail.accruedCharges }</td>
				<td>${detail.paidCharges }</td>
				<td>${detail.debtCharges }</td>
				<td>${detail.isPayInFull ? '是':'否' }</td>
				<td>${detail.description }</td>
				<td>
					<a title="修改仲裁员费用" target="dialog" mask="true" href="${pageContext.request.contextPath }/arbitrator/cost/${detail.id }">修改仲裁员费用</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>