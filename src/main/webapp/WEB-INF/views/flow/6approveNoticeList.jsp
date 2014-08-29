<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form id="pagerForm" method="post" action="${pageContext.request.contextPath }/flow/6approveNoticeList">
</form>

<div class="pageContent">

	<div>
	<table class="list" width="100%" targetType="navTab" layoutH="116">
		<thead>
			<tr>
				<th>案件号</th>
				<th>案由</th>
				<th>申请人</th>
				<th>被申请人</th>
				<th>开庭时间</th>
				<th>仲裁秘书</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty notices }">
				<tr>
					<td colspan="7" style="text-align: center;color: red;">没有相关数据！</td>
				</tr>
			</c:if>
			<c:forEach var="notice" items="${notices }">
			<tr>
				<td>${fn:split(notice.id,"-")[0] }安仲案字${fn:split(notice.id,"-")[1] }号</td>
				<td>${notice.cause }</td>
				<td>${notice.applicant }</td>
				<td>${notice.respondent }</td>
				<td><fmt:formatDate value="${notice.courtDate }" pattern="yyyy年MM月dd日 HH点"/></td>
				<td>${notice.secretary }</td>
				<td>
					<a title="审批" target="dialog" mask="true" max="true" href="${pageContext.request.contextPath }/flow/6approveNotice/${notice.id }">审批</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>