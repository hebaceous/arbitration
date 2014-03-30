<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="pageContent">
	<form method="post" action="${pageContext.request.contextPath }/arbitrator/cost/${detail.id }" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>案件号：</label>
				${fn:split(detail.id,"-")[0] }安仲案字${fn:split(detail.id,"-")[1] }号
			</p>
			<p>
				<label>仲裁员：</label>
				${detail.name }
			</p>
			<p>
				<label>职务：</label>
				${detail.post }
			</p>
			<p>
				<label>应付费用：</label>
				<input name="accruedCharges" value="${detail.accruedCharges }" type="text" class="digits textInput">
			</p>
			<p>
				<label>已交费用：</label>
				<input name="paidCharges" value="${detail.paidCharges }" type="text" class="digits textInput">
			</p>
			<p>
				<label>备注：</label>
				<textarea name="description" rows="3" cols="40">${detail.description }</textarea>
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