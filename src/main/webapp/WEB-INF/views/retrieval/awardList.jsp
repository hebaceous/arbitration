<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form id="pagerForm" method="post" action="${pageContext.request.contextPath }/retrieval/award">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${model.numPerPage}" />
	<input type="hidden" name="keyword" value="${param.keyword}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${pageContext.request.contextPath }/retrieval/award" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					裁决书模糊搜索：<input type="text" name="keyword" value="${param.keyword}"/>
				</td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
				<%-- <li><a class="button" href="${pageContext.request.contextPath }/retrieval/case/awardUI" target="dialog" mask="true" title="查询框"><span>高级检索</span></a></li> --%>
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
				<th width="200" orderField="id" <c:if test='${param.orderField == "id" }'>class="${param.orderDirection}"</c:if>>裁决书号</th>
				<th orderField="cause" <c:if test='${param.orderField == "cause" }'>class="${param.orderDirection}"</c:if>>案由</th>
				<th orderField="applicant" <c:if test='${param.orderField == "applicant" }'>class="${param.orderDirection}"</c:if>>申请人</th>
				<th orderField="respondent" <c:if test='${param.orderField == "respondent" }'>class="${param.orderDirection}"</c:if>>被申请人</th>
				<th orderField="undertaker" <c:if test='${param.orderField == "undertaker" }'>class="${param.orderDirection}"</c:if>>承办人</th>
				<th orderField="auditor" <c:if test='${param.orderField == "auditor" }'>class="${param.orderDirection}"</c:if>>审核人</th>
				<th orderField="secretaryGeneral" <c:if test='${param.orderField == "secretaryGeneral" }'>class="${param.orderDirection}"</c:if>>秘书长</th>
				<th orderField="director" <c:if test='${param.orderField == "director" }'>class="${param.orderDirection}"</c:if>>主任</th>
				<th orderField="deliveredDate" <c:if test='${param.orderField == "deliveredDate" }'>class="${param.orderDirection}"</c:if>>送发时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="award" items="${model.list }">
			<tr>
				<td><a title="裁决书详情" target="navTab" rel="printaward" href="${pageContext.request.contextPath }/award/${award.id }">${fn:split(award.id,"-")[0] }安仲案字${fn:split(award.id,"-")[1] }号</a></td>
				<td>${award.cause }</td>
				<td>${award.applicant }</td>
				<td>${award.respondent }</td>
				<td>${award.undertaker }</td>
				<td>${award.auditor }</td>
				<td>${award.secretaryGeneral }</td>
				<td>${award.director }</td>
				<td><fmt:formatDate value="${award.deliveredDate }" type="date"/></td>
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