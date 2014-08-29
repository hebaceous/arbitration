<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form id="pagerForm" method="post" action="${pageContext.request.contextPath }/retrieval/receipt">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${model.numPerPage}" />
	<input type="hidden" name="keyword" value="${param.keyword}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${pageContext.request.contextPath }/retrieval/receipt" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					送达回证模糊搜索：<input type="text" name="keyword" value="${param.keyword}"/>
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
				<th width="300" orderField="id" <c:if test='${param.orderField == "id" }'>class="${param.orderDirection}"</c:if>>回证号</th>
				<th orderField="cause" <c:if test='${param.orderField == "cause" }'>class="${param.orderDirection}"</c:if>>案由</th>
				<th orderField="addressee" <c:if test='${param.orderField == "addressee" }'>class="${param.orderDirection}"</c:if>>受送达人</th>
				<th orderField="address" <c:if test='${param.orderField == "address" }'>class="${param.orderDirection}"</c:if>>送达地址</th>
				<th orderField="mode" <c:if test='${param.orderField == "mode" }'>class="${param.orderDirection}"</c:if>>送达方式</th>
				<th orderField="secretary" <c:if test='${param.orderField == "secretary" }'>class="${param.orderDirection}"</c:if>>签发人</th>
				<th orderField="processServer" <c:if test='${param.orderField == "processServer" }'>class="${param.orderDirection}"</c:if>>送达人</th>
				<th orderField="deliveredDate" <c:if test='${param.orderField == "deliveredDate" }'>class="${param.orderDirection}"</c:if>>送发日期</th>
				<th orderField="isReceive" <c:if test='${param.orderField == "isReceive" }'>class="${param.orderDirection}"</c:if>>是否收到</th>
				<th orderField="receiptDate" <c:if test='${param.orderField == "receiptDate" }'>class="${param.orderDirection}"</c:if>>接收日期</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="receipt" items="${model.list }">
			<tr>
				<td><a title="回证详情" target="navTab" rel="printReceipt" href="${pageContext.request.contextPath }/receipt/${receipt.id }">${fn:split(receipt.id,"-")[0] }安仲案字${fn:split(receipt.id,"-")[1] }号—<c:if test="${fn:split(receipt.id,'-')[2] == 1 }">受理案件后</c:if><c:if test="${fn:split(receipt.id,'-')[2] == 2 }">组庭后</c:if><c:if test="${fn:split(receipt.id,'-')[2] == 3 }">下达裁决书后</c:if>—${receipt.addressee }</a></td>
				<td>${receipt.cause }</td>
				<td>${receipt.addressee }</td>
				<td>${receipt.address }</td>
				<td>${receipt.mode }</td>
				<td>${receipt.secretary }</td>
				<td>${receipt.processServer }</td>
				<td><fmt:formatDate value="${receipt.deliveredDate }" type="date"/></td>
				<td>${receipt.isReceive?"是":"否" }</td>
				<td><fmt:formatDate value="${receipt.receiptDate }" type="date"/></td>
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
		<div class="pagination" targetType="navTab" totalCount="${model.totalCount }" numPerPage="${model.numPerPage }" pageNumShown="${model.totalCount/model.numPerPage == 0 ? model.totalCount/model.numPerPage:model.totalCount/model.numPerPage+1 }" currentPage="${model.pageNum }"></div>
	</div>
</div>