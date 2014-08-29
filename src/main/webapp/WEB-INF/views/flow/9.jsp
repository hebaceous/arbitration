<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form method="post" action="${pageContext.request.contextPath }/flow/9/${c.id }" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">

<div layoutH="30">
	<table class="print_arbitrator">
		<tr>
			<th class="th1"></th>
			<th class="th2"></th>
			<th class="th3"></th>
			<th class="th4"></th>
		</tr>
		<tr class="title"><td colspan="5">仲裁员选定、指定审批表</td></tr>
		<tr class="number">
			<td colspan="4">
				案号：${fn:split(c.id,"-")[0] }安仲案字${fn:split(c.id,"-")[1] }号
				程序：<c:forEach var="procedure" items="${caseProcedures }">
						<c:if test="${procedure == caseProcedures[c.applicableProcedure] }">${procedure }</c:if>
					</c:forEach>&nbsp;&nbsp;&nbsp;&nbsp;
				仲裁秘书：${c.user.name }&nbsp;&nbsp;&nbsp;&nbsp;
				日期：<input type="text" name="date" class="required date textInput" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td>案件</td>
			<td colspan="3">${c.cause }</td>
		</tr>

		<tr>
			<td rowspan="4">申请人选定情况</td>
			<td></td>
			<td>仲裁员姓名</td>
			<td>专业</td>
		</tr>
		<tr>
			<td>首席仲裁员</td>
			<td><input type="text" name="contents" ${c.applicableProcedure == 1 ? '':'readonly' } <c:if test="${c.applicableProcedure == 1 }">class="required textInput"</c:if>></td>
			<td><input type="text" name="contents" class="textInput" ${c.applicableProcedure == 1 ? '':'readonly' }></td>
		</tr>
		<tr>
			<td>仲裁员</td>
			<td><input type="text" name="contents" ${c.applicableProcedure == 1 ? '':'readonly' } <c:if test="${c.applicableProcedure == 1 }">class="required textInput"</c:if>></td>
			<td><input type="text" name="contents" class="textInput" ${c.applicableProcedure == 1 ? '':'readonly' }></td>
		</tr>
		<tr>
			<td>独任仲裁员</td>
			<td><input type="text" name="contents" ${c.applicableProcedure == 0 ? '':'readonly' } <c:if test="${c.applicableProcedure == 0 }">class="required textInput"</c:if>></td>
			<td><input type="text" name="contents" class="textInput" ${c.applicableProcedure == 0 ? '':'readonly' }></td>
		</tr>

		<tr>
			<td rowspan="4">被申请人选定情况</td>
			<td></td>
			<td>仲裁员姓名</td>
			<td>专业</td>
		</tr>
		<tr>
			<td>首席仲裁员</td>
			<td><input type="text" name="contents" ${c.applicableProcedure == 1 ? '':'readonly' } <c:if test="${c.applicableProcedure == 1 }">class="required textInput"</c:if>></td>
			<td><input type="text" name="contents" class="textInput" ${c.applicableProcedure == 1 ? '':'readonly' }></td>
		</tr>
		<tr>
			<td>仲裁员</td>
			<td><input type="text" name="contents" ${c.applicableProcedure == 1 ? '':'readonly' } <c:if test="${c.applicableProcedure == 1 }">class="required textInput"</c:if>></td>
			<td><input type="text" name="contents" class="textInput" ${c.applicableProcedure == 1 ? '':'readonly' }></td>
		</tr>
		<tr>
			<td>独任仲裁员</td>
			<td><input type="text" name="contents" ${c.applicableProcedure == 0 ? '':'readonly' } <c:if test="${c.applicableProcedure == 0 }">class="required textInput"</c:if>></td>
			<td><input type="text" name="contents" class="textInput" ${c.applicableProcedure == 0 ? '':'readonly' }></td>
		</tr>

	</table>
</div>
<div class="formBar">
	<ul>
		<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
		<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
		<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
	</ul>
</div>
</form>