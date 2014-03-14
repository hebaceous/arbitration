<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript">
$(function() {
	var text = $("textarea[name=opinion]").val();
	$("select[name=agree]").unbind("change").bind("change",function(){
		if($("select[name=agree] option:selected").val() == "false"){
			$("textarea[name=opinion]").val("");
		} else {
			$("textarea[name=opinion]").val(text);
		}
	});
});
</script>

<form method="post" action="${pageContext.request.contextPath }/flow/181920/${c.id }/${user.id }" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">

<div layoutH="30">
	<table class="print_award">
		<tr>
			<th class="th1"></th>
			<th class="th2"></th>
			<th class="th3"></th>
		</tr>
		<tr class="title"><td colspan="3">安阳仲裁委员会</td></tr>
		<tr class="title">
			<td colspan="3">${awardTypes[award.type] }书签发单</td>
		</tr>
		<tr>
			<td colspan="3" class="right">
				${fn:split(award.id,"-")[0] }安仲${fn:substring(awardTypes[award.type],0,1) }字第${fn:split(award.id,"-")[1] }号
			</td>
		</tr>
		<tr>
			<td>案由：</td>
			<td colspan="2">${award.cause }</td>
		</tr>
		<tr>
			<td>申请人：</td>
			<td colspan="2">${award.applicant }</td>
		</tr>
		<tr>
			<td>被申请人：</td>
			<td colspan="2">${award.respondent }</td>
		</tr>
		<tr>
			<td>受案日期：</td>
			<td colspan="2"><fmt:formatDate value="${award.caseDate }" pattern="yyyy年MM月dd日"/></td>
		</tr>
		<tr>
			<td>承办人：</td>
			<td colspan="2">${award.undertaker }</td>
		</tr>
		<tr>
			<td>审核人：</td>
			<c:if test="${c.status == 18 }">
				<td>
					<select name="agree" class="required combox">
						<!-- <option value="">请选择</option> -->
						<option value="true" selected="selected">同意</option>
						<option value="false">不同意</option>
					</select>
					(是否同意)
				</td>
				<td>意见：<textarea name="opinion" cols="40" rows="3"></textarea></td>
			</c:if>
			<c:if test="${c.status != 18 }">
				<td colspan="2">
					${fn:split(award.auditor,",")[0] }
					<p>${fn:split(award.auditor,",")[1] }
					<p>${fn:split(award.auditor,",")[2] }
				</td>
			</c:if>
		</tr>
		<tr>
			<td>秘书长：</td>
			<c:if test="${c.status == 19 }">
				<td>
					<select name="agree" class="required combox">
						<!-- <option value="">请选择</option> -->
						<option value="true" selected="selected">同意</option>
						<option value="false">不同意</option>
					</select>
					(是否同意)
				</td>
				<td>意见：<textarea name="opinion" cols="40" rows="3"></textarea></td>
			</c:if>
			<c:if test="${c.status != 19 }">
				<td colspan="2">
					${fn:split(award.secretaryGeneral,",")[0] }
					<p>${fn:split(award.secretaryGeneral,",")[1] }
					<p>${fn:split(award.secretaryGeneral,",")[2] }
				</td>
			</c:if>
		</tr>
		<tr>
			<td>主任：</td>
			<c:if test="${c.status == 20 }">
				<td>
					<select name="agree" class="required combox">
						<!-- <option value="">请选择</option> -->
						<option value="true" selected="selected">同意</option>
						<option value="false">不同意</option>
					</select>
					(是否同意)
				</td>
				<td>意见：<textarea name="opinion" cols="40" rows="3"></textarea></td>
			</c:if>
			<c:if test="${c.status != 20 }">
				<td colspan="2">
					${fn:split(award.director,",")[0] }
					<p>${fn:split(award.director,",")[1] }
					<p>${fn:split(award.director,",")[2] }
				</td>
			</c:if>
		</tr>
		<tr>
			<td>仲裁秘书：${award.secretary }</td>
			<td>初审：${award.firstTrial }</td>
			<td>印数：${award.printing }份</td>
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