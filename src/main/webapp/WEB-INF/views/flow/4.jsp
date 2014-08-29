<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="pageContent">
	<form method="post" action="${pageContext.request.contextPath }/flow/4/${c.id }" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>案件号：</label>
				${c.id }
			</p>
			<p>
				<label>案由：</label>
				${c.cause }
			</p>
			<p>
				<label>选择仲裁秘书：</label>
				<select name="uid" class="required combox">
					<option value="">请选择</option>
					<c:forEach var="user" items="${users }">
						<option value="${user.id }">${user.name }</option>
					</c:forEach>
				</select>
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