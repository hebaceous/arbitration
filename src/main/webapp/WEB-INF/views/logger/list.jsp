<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form id="pagerForm" method="post" action="${pageContext.request.contextPath }/logger">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${model.numPerPage}" />
	<input type="hidden" name="keyword" value="${param.keyword}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${pageContext.request.contextPath }/logger" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					模糊查询：<input type="text" name="keyword" value="${param.keyword}"/>
				</td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>

<div class="pageContent">
	<div>
	<table class="list" width="98%" targetType="navTab" layoutH="116">
		<thead>
			<tr>
				<th width="50" orderField="event_id" <c:if test='${param.orderField == "event_id" }'>class="${param.orderDirection}"</c:if>>编号</th>
				<th width="100" orderField="level_string" <c:if test='${param.orderField == "level_string" }'>class="${param.orderDirection}"</c:if>>级别</th>
				<th>操作日志</th>
				<th width="150" orderField="time" <c:if test='${param.orderField == "time" }'>class="${param.orderDirection}"</c:if>>时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="logger" items="${model.list }">
			<tr>
				<td>${logger.event_id }</td>
				<td>${logger.level_string }</td>
				<td>${logger.formatted_message }</td>
				<td><fmt:formatDate value="${logger.time }" type="both"/></td>
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
				<option value="100" ${model.numPerPage == 100 ? 'selected':''}>100</option>
			</select>
			<span>条，共${model.totalCount }条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${model.totalCount }" numPerPage="${model.numPerPage }" pageNumShown="${model.totalCount/model.numPerPage == 0 ? model.totalCount/model.numPerPage:model.totalCount/model.numPerPage+1 }" currentPage="${model.pageNum }"></div>
	</div>
</div>