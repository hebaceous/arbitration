<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="pageContent">

	<div>
	<table class="list" width="98%" targetType="navTab" layoutH="116">
		<thead>
			<tr>
				<th width="130">案件号</th>
				<th>申请人</th>
				<th>被申请人</th>
				<th>类型</th>
				<th>标的额</th>
				<th>立案日期</th>
				<th>仲裁费</th>
				<th>受理费</th>
				<th>处理费</th>
				<th>适用程序</th>
				<th>仲裁员</th>
				<th>仲裁秘书</th>
				<th>审理结果</th>
				<th>条款/协议</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty cases }">
				<tr>
					<td colspan="11" style="text-align: center;color: red;">没有相关数据！</td>
				</tr>
			</c:if>
			<c:forEach var="c" items="${cases }">
			<tr>
				<td><a target="navTab" title="仲裁申请详细信息" href="${pageContext.request.contextPath }/case/approvaledDetail/${c.id }">${fn:split(c.id,"-")[0] }安仲案字${fn:split(c.id,"-")[1] }号</a></td>
				<td><a target="dialog" mask="true" width=1000 height="600" title="详细信息" href="${pageContext.request.contextPath }/applicant/${c.id }/true">查看详情</a></td>
				<td><a target="dialog" mask="true" width="1000" height="600" title="详细信息" href="${pageContext.request.contextPath }/applicant/${c.id }/false">查看详情</a></td>
				<td>
					<c:if test="${c.type lt 8 }">
						<c:forEach var="type" items="${caseTypes }">
							<c:if test="${type == caseTypes[c.type] }">${type }</c:if>
						</c:forEach>
					</c:if>
					<%-- c.type == 8为其它类型，从typeName取值 --%>
					<c:if test="${c.type eq 8 }">${c.typeName }</c:if>
				</td>
				<td>${c.money }</td>
				<td><fmt:formatDate value="${c.registerDate }" type="date"/></td>
				<td>${c.arbitrationCharges }</td>
				<td>${c.acceptCharges }</td>
				<td>${c.handlingCharges }</td>
				<td>
					<c:forEach var="procedure" items="${caseProcedures }">
						<c:if test="${procedure == caseProcedures[c.applicableProcedure] }">${procedure }</c:if>
					</c:forEach>
				</td>
				<td>${c.arbitratorNames }</td>
				<td>
					<c:if test="${c.status gt 4 }">${c.user.name }</c:if>
					<%-- <c:if test="${c.status <= 4 }">未指定</c:if> --%>
				</td>
				<td>${c.awardResult }</td>
				<td>${c.agreement eq '' ? '已有' : '补充' }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>