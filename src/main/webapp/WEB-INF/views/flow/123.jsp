<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<div class="pageContent">
	<form method="post" action="${pageContext.request.contextPath }/flow/123/${c.id }/${user.id }" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>案件号：</label>
				${fn:split(c.id,"-")[0] }安仲裁字${fn:split(c.id,"-")[1] }号
			</p>
			<p>
				<label>案由：</label>
				${c.cause }
			</p>
			<c:if test="${c.status > 1 }">
				<p>
					<label>立案科意见：</label>
					${fn:split(c.responsiblePersonOpinion,",")[0] }
					<p style="text-align: right;">${fn:split(c.responsiblePersonOpinion,",")[1] }
					<p style="text-align: right;">${fn:split(c.responsiblePersonOpinion,",")[2] }
				</p>
				<c:if test="${c.status > 2 }">
					<p>
						<label>副主任意见：</label>
						${fn:split(c.departmentOpinion,",")[0] }
						<p style="text-align: right;">${fn:split(c.departmentOpinion,",")[1] }
						<p style="text-align: right;">${fn:split(c.departmentOpinion,",")[2] }
					</p>
				</c:if>
			</c:if>
			<p>
				<label>是否同意：</label>
				<select name="agree" class="required combox">
					<!-- <option value="">请选择</option> -->
					<option value="true" selected="selected">同意</option>
					<option value="false">不同意</option>
				</select>
			</p>
			<p>
				<label>意见：</label>
				<c:if test="${c.status eq 1 }">
					<textarea name="opinion" class="textInput" rows="3" cols="27">已阅，符合仲裁法第二十一条规定，建议立案。</textarea>
				</c:if>
				<c:if test="${c.status eq 2 }">
					<textarea name="opinion" class="textInput" rows="3" cols="27">已阅，符合仲裁法第二十一条规定，拟同意立案。</textarea>
				</c:if>
				<c:if test="${c.status eq 3 }">
					<textarea name="opinion" class="textInput" rows="3" cols="27">同意立案。</textarea>
				</c:if>
			</p>

		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>