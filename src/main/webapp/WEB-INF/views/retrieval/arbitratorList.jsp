<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form id="pagerForm" method="post" action="${pageContext.request.contextPath }/retrieval/arbitrator">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${model.numPerPage}" />
	<input type="hidden" name="keyword" value="${param.keyword}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${pageContext.request.contextPath }/retrieval/arbitrator" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					仲裁员审批表模糊搜索：<input type="text" name="keyword" value="${param.keyword}"/>
				</td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
				<%-- <li><a class="button" href="${pageContext.request.contextPath }/retrieval/case/noticeUI" target="dialog" mask="true" title="查询框"><span>高级检索</span></a></li> --%>
			</ul>
		</div>
	</div>
	</form>
</div>

<div class="pageContent">

	<div>
	<table class="list" width="100%" targetType="navTab" layoutH="116">
		<thead>
			<tr>
				<th width="130" orderField="id" <c:if test='${param.orderField == "id" }'>class="${param.orderDirection}"</c:if>>案件号</th>
				<th orderField="type" <c:if test='${param.orderField == "type" }'>class="${param.orderDirection}"</c:if>>程序</th>
				<th orderField="secretary" <c:if test='${param.orderField == "secretary" }'>class="${param.orderDirection}"</c:if>>仲裁秘书</th>
				<th orderField="date" <c:if test='${param.orderField == "date" }'>class="${param.orderDirection}"</c:if>>日期</th>
				<th orderField="cause" <c:if test='${param.orderField == "cause" }'>class="${param.orderDirection}"</c:if>>案件</th>
				<th orderField="departmentOpinion" <c:if test='${param.orderField == "departmentOpinion" }'>class="${param.orderDirection}"</c:if>>部门意见</th>
				<th orderField="centerDirectorOpinion" <c:if test='${param.orderField == "centerDirectorOpinion" }'>class="${param.orderDirection}"</c:if>>中心主任审批</th>
				<th orderField="directorOpinion" <c:if test='${param.orderField == "directorOpinion" }'>class="${param.orderDirection}"</c:if>>主任审批</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="arbitrator" items="${model.list }">
			<tr>
				<td><a target="navTab" title='${fn:split(arbitrator.id,"-")[0] }安仲案字${fn:split(arbitrator.id,"-")[1] }号' href="${pageContext.request.contextPath }/arbitrator/${arbitrator.id }">${fn:split(arbitrator.id,"-")[0] }安仲案字${fn:split(arbitrator.id,"-")[1] }号</a></td>
				<td>${arbitrator.type }</td>
				<td>${arbitrator.secretary }</td>
				<td><fmt:formatDate value="${arbitrator.date }" type="date"/></td>
				<td>${arbitrator.cause }</td>
				<td>${arbitrator.departmentOpinion }</td>
				<td>${arbitrator.centerDirectorOpinion }</td>
				<td>${arbitrator.directorOpinion }</td>
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