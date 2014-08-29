<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript">
function awardTypeChange(object) {
	var value = $(object).find('option:selected').text().charAt(0);
	$("#awardType").html(value);
}
</script>

<form method="post" action="${pageContext.request.contextPath }/flow/17/${c.id }" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">

<div layoutH="30">
	<table class="print_award">
		<tr>
			<th class="th1"></th>
			<th class="th2"></th>
			<th class="th3"></th>
		</tr>
		<tr class="title"><td colspan="3">安阳仲裁委员会</td></tr>
		<tr class="title">
			<td colspan="3">
				<select name="type" class="required" onchange="awardTypeChange(this);">
					<option value="">请选择</option>
					<option value="0">裁决</option>
					<option value="1">调解</option>
					<option value="2">决定</option>
				</select>
				书签发单
			</td>
		</tr>
		<tr>
			<td colspan="3" class="right">
				${fn:split(c.id,"-")[0] }安仲<span id="awardType"> </span>字第${fn:split(c.id,"-")[1] }号
			</td>
		</tr>
		<tr>
			<td>案由：</td>
			<td colspan="2">${c.cause }</td>
		</tr>
		<tr>
			<td>申请人：</td>
			<td colspan="2">${names[0] }</td>
		</tr>
		<tr>
			<td>被申请人：</td>
			<td colspan="2">${names[1] }</td>
		</tr>
		<tr>
			<td>受案日期：</td>
			<td colspan="2"><fmt:formatDate value="${c.registerDate }" pattern="yyyy年MM月dd日"/></td>
		</tr>
		<tr>
			<td>承办人：</td>
			<td colspan="2"><input type="text" name="undertaker" class="required textInput" size="40"></td>
		</tr>
		<tr>
			<td>审核人：</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td>秘书长：</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td>主任：</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td>仲裁秘书：</td>
			<td>初审：<input type="text" name="firstTrial" class="required textInput"></td>
			<td>印数：
				<select name="printing" class="required">
					<option value="">请选择</option>
				<% for(int i=1; i<=20; i++){ %>
					<option value="<%=i %>"><%=i %></option>
				<% } %>
				</select>
			份</td>
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