<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="pageContent">
	<form method="post" action="${pageContext.request.contextPath }/user/insert" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>真实姓名：</label>
				<input name="name" type="text" class="required"/>
			</p>
			<p>
				<label>用户角色：</label>
				<select name="rid" class="required combox">
					<option value="" selected>请选择</option>
					<c:forEach var="role" items="${roles }">
						<option value="${role.id }">${role.name }</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>用 户 名：</label>
				<input name="username" type="text" class="required" remote="${pageContext.request.contextPath }/user/checkUsername"/><!-- <span id="message"></span> -->
			</p>
			<p>
				<label>密    码：</label>
				<input name="password" type="text" class="required"/>
			</p>
			<p>
				<label>备    注：</label>
				<textarea name="description" rows="4" cols="30"></textarea>
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