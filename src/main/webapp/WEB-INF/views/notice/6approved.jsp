<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="pageContent">

	<div>
	<table class="list" width="98%" targetType="navTab" layoutH="116">
		<thead>
			<tr>
				<th width="110">公告号</th>
				<th>案由</th>
				<th>申请人</th>
				<th>被申请人</th>
				<th>送发时间</th>
				<th>仲裁秘书</th>
				<th>开庭时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${notices }">
			<tr>
				<td><a title="公告详情" target="navTab" rel="printNotice" href="${pageContext.request.contextPath }/notice/${notice.id }">${fn:split(notice.id,"-")[0] }安仲案字${fn:split(notice.id,"-")[1] }号</a></td>
				<td>${notice.cause }</td>
				<td>${notice.applicant }</td>
				<td>${notice.respondent }</td>
				<td><fmt:formatDate value="${notice.deliveredDate }" type="date"/></td>
				<td>${notice.secretary }</td>
				<td><fmt:formatDate value="${notice.courtDate }" type="date"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>