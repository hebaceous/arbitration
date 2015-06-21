<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form id="pagerForm" method="post" action="${pageContext.request.contextPath }/retrieval/case">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${model.numPerPage}" />
	<input type="hidden" name="keyword" value="${param.keyword}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${pageContext.request.contextPath }/retrieval/case" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					案件模糊搜索：<input type="text" name="keyword" value="${param.keyword}"/>
				</td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
				<%-- <li><a class="button" href="${pageContext.request.contextPath }/retrieval/case/advancedUI" target="dialog" mask="true" title="查询框"><span>高级检索</span></a></li> --%>
			</ul>
		</div>
	</div>
	</form>
</div>

<div class="pageContent">
	<div id="retrieval_caseList">
	<table class="list" width="100%" targetType="navTab" layoutH="116">
		<thead>
			<tr>
				<th width="130" orderField="id" <c:if test='${param.orderField == "id" }'>class="${param.orderDirection}"</c:if>>案件号</th>
				<th>申请人</th>
				<th>被申请人</th>
				<th orderField="type" <c:if test='${param.orderField == "type" }'>class="${param.orderDirection}"</c:if>>类型</th>
				<th orderField="money" <c:if test='${param.orderField == "money" }'>class="${param.orderDirection}"</c:if>>标的额</th>
				<th orderField="registerDate" <c:if test='${param.orderField == "registerDate" }'>class="${param.orderDirection}"</c:if>>立案日期</th>
				<th orderField="arbitrationCharges" <c:if test='${param.orderField == "arbitrationCharges" }'>class="${param.orderDirection}"</c:if>>仲裁费</th>
				<th orderField="acceptCharges" <c:if test='${param.orderField == "acceptCharges" }'>class="${param.orderDirection}"</c:if>>受理费</th>
				<th orderField="handlingCharges" <c:if test='${param.orderField == "handlingCharges" }'>class="${param.orderDirection}"</c:if>>处理费</th>
				<th orderField="applicableProcedure" <c:if test='${param.orderField == "applicableProcedure" }'>class="${param.orderDirection}"</c:if>>适用程序</th>
				<th>仲裁员</th>
				<th>仲裁秘书</th>
				<th>审理结果</th>
				<th>条款/协议</th>
				<th orderField="formationDate" <c:if test='${param.orderField == "formationDate" }'>class="${param.orderDirection}"</c:if>>组庭时间</th>
				<th orderField="concludedDate" <c:if test='${param.orderField == "concludedDate" }'>class="${param.orderDirection}"</c:if>>结案时间</th>
				<th>开庭笔录</th>
				<th>裁决书</th>
				<th width="150" orderField="status" <c:if test='${param.orderField == "status" }'>class="${param.orderDirection}"</c:if>>结果</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="c" items="${model.list }">
			<tr>
				<td><a target="navTab" title='${fn:split(c.id,"-")[0] }安仲案字${fn:split(c.id,"-")[1] }号' href="${pageContext.request.contextPath }/case/${c.id }">${fn:split(c.id,"-")[0] }安仲案字${fn:split(c.id,"-")[1] }号</a></td>
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
				<td><fmt:formatDate value="${c.formationDate }" type="date"/></td>
				<td><fmt:formatDate value="${c.concludedDate }" type="date"/></td>
				<td>
					<c:if test="${c.status>16 }">
						<a href="${pageContext.request.contextPath }/case/download/hearingRecord/${c.id }">点击下载</a>
					</c:if>
				</td>
				<td>
					<c:if test="${c.status>16 }">
						<a href="${pageContext.request.contextPath }/case/download/award/${c.id }">点击下载</a>
					</c:if>
				</td>
				<td>
					<c:choose>
						<c:when test="${c.status == 1 }">审批仲裁申请（立案科长）</c:when>
						<c:when test="${c.status == 2 }">审批仲裁申请（副主任）</c:when>
						<c:when test="${c.status == 3 }">审批仲裁申请（中心主任）</c:when>
						<c:when test="${c.status == 4 }">联络科长指定秘书</c:when>
						<c:when test="${c.status == 5 }">送达回证中--立案后（${c.user.name }）</c:when>
						<c:when test="${c.status == 6 }">处理回证和文书--立案后</c:when>
						<c:when test="${c.status == 9 }">选定仲裁员（${c.user.name }）</c:when>
						<c:when test="${c.status == 10 }">审批仲裁员选定表（副主任）</c:when>
						<c:when test="${c.status == 11 }">审批仲裁员选定表（中心主任）</c:when>
						<c:when test="${c.status == 12 }">审批仲裁员选定表（仲裁委主任）</c:when>
						<c:when test="${c.status == 14 }">送达回证--组庭后（${c.user.name }）</c:when>
						<c:when test="${c.status == 15 }">等待收到回证--组庭后（${c.user.name }）</c:when>
						<c:when test="${c.status == 16 }">上传开庭笔录（${c.user.name }）</c:when>
						<c:when test="${c.status == 17 }">下达裁决书（${c.user.name }）</c:when>
						<c:when test="${c.status == 18 }">审批裁决书（副主任）</c:when>
						<c:when test="${c.status == 19 }">审批裁决书（中心主任）</c:when>
						<c:when test="${c.status == 20 }">审批裁决书（仲裁委主任）</c:when>
						<c:when test="${c.status == 21 }">送达回证--裁决书后（${c.user.name }）</c:when>
						<c:when test="${c.status == 22 }">等待收到回证--裁决书后（${c.user.name }）</c:when>
						<c:when test="${c.status == 23 }">案件归档</c:when>
						<c:when test="${c.status == 24 }">已结案</c:when>
					</c:choose>
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