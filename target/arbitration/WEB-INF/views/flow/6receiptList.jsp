<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form id="pagerForm" method="post" action="${pageContext.request.contextPath }/flow/6receiptList/${user.id }">
</form>

<div class="pageContent">

	<div>
	<table class="list" width="98%" targetType="navTab" layoutH="116">
		<thead>
			<tr>
				<th>案件号</th>
				<th>受送达人</th>
				<th>送达地址</th>
				<th>送达方式</th>
				<th>送发日期</th>
				<th>签发人</th>
				<th>送达人</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty receipts }">
				<tr>
					<td colspan="7" style="text-align: center;color: red;">没有相关数据！</td>
				</tr>
			</c:if>
			<c:forEach var="receipt" items="${receipts }">
			<tr>
				<td>${fn:split(receipt.id,"-")[0] }安仲裁字${fn:split(receipt.id,"-")[1] }号</td>
				<td>${receipt.addressee }</td>
				<td>${receipt.address }</td>
				<td>${receipt.mode }</td>
				<td><fmt:formatDate value="${receipt.deliveredDate }" type="date"/></td>
				<td>${receipt.secretary }</td>
				<td>${receipt.processServer }</td>
				<td>
					<a title="完善送达回证" target="dialog" mask="true" max="true" href="${pageContext.request.contextPath }/flow/6receivedReceipt/${receipt.id }">完善送达回证</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>