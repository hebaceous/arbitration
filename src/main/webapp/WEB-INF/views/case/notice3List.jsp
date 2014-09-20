<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form id="pagerForm" method="post" action="${pageContext.request.contextPath }/case/notice3List">
	<input type="hidden" name="uid" value="${user.id }" />
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${model.numPerPage}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />
</form>

<div class="pageContent">
	<div id="retrieval_caseList">
	<table class="list" width="100%" targetType="navTab" layoutH="26">
		<thead>
			<tr>
				<th width="130" orderField="id" <c:if test='${param.orderField == "id" }'>class="${param.orderDirection}"</c:if>>案件号</th>
				<th>申请人</th>
				<th>被申请人</th>
				<th orderField="type" width="130" <c:if test='${param.orderField == "type" }'>class="${param.orderDirection}"</c:if>>类型</th>
				<th orderField="money" <c:if test='${param.orderField == "money" }'>class="${param.orderDirection}"</c:if>>标的</th>
				<th orderField="registerDate" <c:if test='${param.orderField == "registerDate" }'>class="${param.orderDirection}"</c:if>>立案时间</th>
				<th orderField="arbitrationCharges" <c:if test='${param.orderField == "arbitrationCharges" }'>class="${param.orderDirection}"</c:if>>仲裁费</th>
				<th orderField="applicableProcedure" <c:if test='${param.orderField == "applicableProcedure" }'>class="${param.orderDirection}"</c:if>>适用程序</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${model.list }">
			<tr>
				<td><a target="navTab" title='${fn:split(c.id,"-")[0] }安仲案字${fn:split(c.id,"-")[1] }号' href="${pageContext.request.contextPath }/case/${c.id }">${fn:split(c.id,"-")[0] }安仲案字${fn:split(c.id,"-")[1] }号</a></td>
				<td><a target="dialog" mask="true" width=800 height="400" title="详细信息" href="${pageContext.request.contextPath }/applicant/${c.id }/true">查看详情</a></td>
				<td><a target="dialog" mask="true" width="800" height="400" title="详细信息" href="${pageContext.request.contextPath }/applicant/${c.id }/false">查看详情</a></td>
				<td>
					<c:forEach var="type" items="${caseTypes }">
						<c:if test="${type == caseTypes[c.type] }">${type }</c:if>
					</c:forEach>
				</td>
				<td>${c.money }</td>
				<td><fmt:formatDate value="${c.registerDate }" type="date"/></td>
				<td>${c.arbitrationCharges }</td>
				<td>
					<c:forEach var="procedure" items="${caseProcedures }">
						<c:if test="${procedure == caseProcedures[c.applicableProcedure] }">${procedure }</c:if>
					</c:forEach>
				</td>
				<td>
					<a title="打印开庭通知书" target="navTab" href="${pageContext.request.contextPath }/case/notice3/${c.id }">打印开庭通知书</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<div class="panelBar" >
		<div class="pages">
			<span>显示</span>
			<select name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="10" ${model.numPerPage == 10 ? 'selected':''}>10</option>
				<option value="20" ${model.numPerPage == 20 ? 'selected':''}>20</option>
				<option value="50" ${model.numPerPage == 50 ? 'selected':''}>50</option>
				<option value="50" ${model.numPerPage == 100 ? 'selected':''}>100</option>
			</select>
			<span>条，共${model.totalCount }条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${model.totalCount }" numPerPage="${model.numPerPage }" pageNumShown="10" currentPage="${model.pageNum }"></div>
	</div>
</div>