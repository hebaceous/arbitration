<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form id="pagerForm" method="post" action="${pageContext.request.contextPath }/user">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${model.numPerPage}" />
	<input type="hidden" name="keyword" value="${param.keyword}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${pageContext.request.contextPath }/user" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					用户搜索：<input type="text" name="keyword" value="${param.keyword}"/>&nbsp;&nbsp;&nbsp;&nbsp;(可根据姓名，用户名，用户身份进行模糊查询)
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
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${pageContext.request.contextPath }/user/insert" target="dialog" title="添加用户"><span>添加</span></a></li>
			<li><a class="delete" href="${pageContext.request.contextPath }/user/delete/{user_id}" target="ajaxTodo" title="确定要删除吗？" warn="请选择一个用户" rel="userList"><span>删除</span></a></li>
			<li><a class="edit" href="${pageContext.request.contextPath }/user/update/{user_id}" target="dialog" warn="请选择一个用户"><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="javascript:$.printBox('w_list_print')"><span>打印</span></a></li>
		</ul>
	</div>

	<div id="userList">
	<table class="list" width="98%" targetType="navTab" layoutH="116">
		<thead>
			<tr>
				<th width="100" orderField="name" <c:if test='${param.orderField == "name" }'>class="${param.orderDirection}"</c:if>>真实姓名</th>
				<th width="100">用户身份</th>
				<th width="100" orderField="username" <c:if test='${param.orderField == "username" }'>class="${param.orderDirection}"</c:if>>用户名</th>
				<th width="200">备注</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${model.list }">
			<tr target="user_id" rel="${user.id }">
				<td>${user.name }</td>
				<td>${user.role.name }</td>
				<td>${user.username }</td>
				<td>${user.description }</td>
				<td>
					<a title="确定要删除吗？" target="ajaxTodo" href="${pageContext.request.contextPath }/user/delete/${user.id }" class="btnDel" rel="userList">删除</a>
					&nbsp;&nbsp;&nbsp;&nbsp;<a title="编辑" target="dialog" href="${pageContext.request.contextPath }/user/update/${user.id }" class="btnEdit">编辑</a>
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
			</select>
			<span>条，共${model.totalCount }条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${model.totalCount }" numPerPage="${model.numPerPage }" pageNumShown="${model.totalCount/model.numPerPage == 0 ? model.totalCount/model.numPerPage:model.totalCount/model.numPerPage+1 }" currentPage="${model.pageNum }"></div>
	</div>
</div>