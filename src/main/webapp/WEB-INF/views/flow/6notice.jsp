<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="pageContent">
	<form method="post" action="${pageContext.request.contextPath }/flow/6notice/${receipt.id }" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>案号：</label>
				${fn:split(receipt.id,"-")[0] }安仲案字${fn:split(receipt.id,"-")[1] }号
			</p>
			<p>
				<label>受送达人：</label> ${receipt.addressee }
			</p>
			<p>
				<label>开庭时间：</label>
				<%-- FlowController[525行] --%>
				<input type="text" name="courtDate" class="date required" dateFmt="yyyy年MM月dd日 HH点mm分" readonly="readonly">
				<a class="inputDateButton" href="javascript:;">选择</a>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li>
					<div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div>
				</li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>