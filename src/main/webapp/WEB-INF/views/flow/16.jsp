<%@ page language="java" pageEncoding="UTF-8"%>

<div style="padding: 20px;">
	<form action="${pageContext.request.contextPath }/flow/16/${c.id }" method="post" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this,dialogAjaxDone);">
		<div class="pageFormContent" layoutH="70">
			<p>
				<label>开庭笔录：</label>
				<input name="hearingRecord" type="file"  class="required"/>
			</p>
			<p>
				<label>裁决书：</label>
				<input name="award" type="file" class="required"/>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>