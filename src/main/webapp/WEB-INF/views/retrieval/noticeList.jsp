<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form id="pagerForm" method="post" action="${pageContext.request.contextPath }/retrieval/notice">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${model.numPerPage}" />
	<input type="hidden" name="keyword" value="${param.keyword}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${pageContext.request.contextPath }/retrieval/notice" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					文书签发单模糊搜索：<input type="text" name="keyword" value="${param.keyword}"/>
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
				<th width="200" orderField="id" <c:if test='${param.orderField == "id" }'>class="${param.orderDirection}"</c:if>>文书号</th>
				<th orderField="cause" <c:if test='${param.orderField == "cause" }'>class="${param.orderDirection}"</c:if>>案由</th>
				<th orderField="applicant" <c:if test='${param.orderField == "applicant" }'>class="${param.orderDirection}"</c:if>>申请人</th>
				<th orderField="respondent" <c:if test='${param.orderField == "respondent" }'>class="${param.orderDirection}"</c:if>>被申请人</th>
				<th orderField="deliveredDate" <c:if test='${param.orderField == "deliveredDate" }'>class="${param.orderDirection}"</c:if>>送发时间</th>
				<th orderField="secretary" <c:if test='${param.orderField == "secretary" }'>class="${param.orderDirection}"</c:if>>仲裁秘书</th>
				<th orderField="auditor" <c:if test='${param.orderField == "auditor" }'>class="${param.orderDirection}"</c:if>>审核人</th>
				<th orderField="courtDate" <c:if test='${param.orderField == "courtDate" }'>class="${param.orderDirection}"</c:if>>开庭时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${model.list }">
			<tr>
				<td><a title="公告详情" target="navTab" rel="printNotice" href="${pageContext.request.contextPath }/notice/${notice.id }">${fn:split(notice.id,"-")[0] }安仲案字${fn:split(notice.id,"-")[1] }号</a></td>
				<td>${notice.cause }</td>
				<td>${notice.applicant }</td>
				<td>${notice.respondent }</td>
				<td><fmt:formatDate value="${notice.deliveredDate }" type="date"/></td>
				<td>${notice.secretary }</td>
				<td>${notice.auditor }</td>
				<td><fmt:formatDate value="${notice.courtDate }" type="date"/></td>
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