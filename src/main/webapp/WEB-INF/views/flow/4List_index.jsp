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
				<th>案由</th>
				<th>争议金额</th>
				<th>是否减免</th>
				<th>立案日期</th>
				<th>适用程序</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty cases }">
				<tr>
					<td colspan="11" style="text-align: center;color: red;">没有相关数据！</td>
				</tr>
			</c:if>
			<c:forEach var="c" items="${cases }">
			<tr mark_remove="${c.id }">
				<td><a target="navTab" title='${fn:split(c.id,"-")[0] }安仲案字${fn:split(c.id,"-")[1] }号' href="${pageContext.request.contextPath }/case/${c.id }">${fn:split(c.id,"-")[0] }安仲案字${fn:split(c.id,"-")[1] }号</a></td>
				<td><a target="dialog" mask="true" width=900 height="400" title="详细信息" href="${pageContext.request.contextPath }/applicant/${c.id }/true">查看详情</a></td>
				<td><a target="dialog" mask="true" width="900" height="400" title="详细信息" href="${pageContext.request.contextPath }/applicant/${c.id }/false">查看详情</a></td>
				<td>${c.cause }</td>
				<td>${c.money }</td>
				<td>${c.isRelief ? '是':'否' }</td>
				<td><fmt:formatDate value="${c.registerDate }" type="date"/></td>
				<td>
					<c:forEach var="procedure" items="${caseProcedures }">
						<c:if test="${procedure == caseProcedures[c.applicableProcedure] }">${procedure }</c:if>
					</c:forEach>
				</td>
				<td>
					<a title="指定办案秘书" target="dialog" mask="true" href="${pageContext.request.contextPath }/flow/4/${c.id }">指定办案秘书</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>