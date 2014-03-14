<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="pageContent">

	<div>
	<table class="list" width="98%" targetType="navTab" layoutH="116">
		<thead>
			<tr>
				<th width="130">案件号</th>
				<th>案由</th>
				<th>裁决书类型</th>
				<th>送达日期</th>
				<th width="200">当前状态</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty awards }">
				<tr>
					<td colspan="5" style="text-align: center;color: red;">没有相关数据！</td>
				</tr>
			</c:if>
			<c:forEach var="award" items="${awards }" varStatus="status">
			<tr>
				<td>${fn:split(award.id,"-")[0] }安仲裁字${fn:split(award.id,"-")[1] }号</td>
				<td>${award.cause }</td>
				<td>
					<c:forEach var="type" items="${ awardTypes}">
						<c:if test="${awardTypes[award.type] == type }">${type }</c:if>
					</c:forEach>
				</td>
				<td><fmt:formatDate value="${award.deliveredDate }" type="date"/></td>
				<td>
					等待
					<c:if test="${cases[status.index].status == 18 }"><a>副主任</a></c:if>
					<c:if test="${cases[status.index].status == 19 }"><a>中心主任</a></c:if>
					<c:if test="${cases[status.index].status == 20 }"><a>仲裁委主任</a></c:if>
					审批
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>