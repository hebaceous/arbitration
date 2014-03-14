<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="pageContent">

	<div>
	<table class="list" width="100%" targetType="navTab">
		<thead>
			<tr>
				<th width="110">案件号</th>
				<th>申请人</th>
				<th>被申请人</th>
				<th>立案时间</th>
				<th>仲裁秘书</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty cases }">
				<tr>
					<td colspan="14" style="text-align: center;color: red;">没有相关数据！</td>
				</tr>
			</c:if>
			<c:forEach var="c" items="${cases }">
			<tr mark_remove="${c.id }">
				<td><a target="navTab" title='${fn:split(c.id,"-")[0] }安仲裁字${fn:split(c.id,"-")[1] }号' href="${pageContext.request.contextPath }/case/${c.id }">${fn:split(c.id,"-")[0] }安仲裁字${fn:split(c.id,"-")[1] }号</a></td>
				<td><a target="dialog" mask="true" width=900 height="400" title="详细信息" href="${pageContext.request.contextPath }/applicant/${c.id }/true">查看详情</a></td>
				<td><a target="dialog" mask="true" width="900" height="400" title="详细信息" href="${pageContext.request.contextPath }/applicant/${c.id }/false">查看详情</a></td>
				<td><fmt:formatDate value="${c.registerDate }" type="date"/></td>
				<th>${c.user.name }</th>
				<td>
					<a title="仲裁员审批" target="dialog" mask="true" max="true" href="${pageContext.request.contextPath }/flow/101112/${c.id }">仲裁员审批</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>