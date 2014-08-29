<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript">
$(function() {
	$("select[name='aid']").bind("change",function(){
		var id = $(this).val();
		$.post("${pageContext.request.contextPath }/applicant/ajax/"+id,null,function(data){
			$("input[name='address']").val(data.address);
		});
	});
})
</script>

<form method="post" action="${pageContext.request.contextPath }/flow/5/${c.id }" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">

<div layoutH="56">
	<table class="print_receipt">
		<tr>
			<th class="th1"></th>
			<th class="th2"></th>
			<th class="th3"></th>
			<th class="th4"></th>
		</tr>
		<tr class="title"><td colspan="4">安阳仲裁委员会送达回证</td></tr>
		<tr>
			<td>案由</td>
			<td>${c.cause }</td>
			<td>案号</td>
			<td>${fn:split(c.id,"-")[0] }安仲案字${fn:split(c.id,"-")[1] }号</td>
		</tr>
		<tr>
			<td>受送达人</td>
			<td colspan="3">
				<select name="aid" class="required combox">
					<option value="">请选择</option>
					<c:forEach var="applicant" items="${applicants }">
						<option value="${applicant.id }">${applicant.name }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>送达地址</td>
			<td colspan="3"><input type="text" name="address" value="" class="required textInput"></td>
		</tr>
		<tr>
			<td>送达方式</td>
			<td colspan="3">
				<select name="mode" class="required combox">
					<option value="">请选择</option>
					<c:forEach var="mode" items="${serviceModes }">
						<option value="${mode }">${mode }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>送达文书名称及签收</td>
			<td colspan="2">
				<label><input type="checkbox" name="files" value="a"/>1、仲裁申请书副本</label><br/>
				<label><input type="checkbox" name="files" value="b"/>2、反请求申请书副本</label><br/>
				<span><input type="checkbox" name="files" value="c"/>3、（<input type="text" name="contents" class="textInput" size="5">）安裁（<input type="text" name="contents" class="textInput" size="5">）字第（<input type="text" name="contents" class="textInput" size="5">）号通知书</span><br/>
				<span><input type="checkbox" name="files" value="d"/>4、（<input type="text" name="contents" class="textInput" size="5">）安裁（<input type="text" name="contents" class="textInput" size="5">）字第（<input type="text" name="contents" class="textInput" size="5">）号通知书</span><br/>
				<label><input type="checkbox" name="files" value="e"/>5、《安阳仲裁委员会仲裁规则》</label><br/>
				<label><input type="checkbox" name="files" value="f"/>6、《安阳仲裁委员会仲裁员名册》</label><br/>
				<label><input type="checkbox" name="files" value="g"/>7、《当事人提交材料须知》</label><br/>
				<label><input type="checkbox" name="files" value="h"/>8、《证据提交清单》</label><br/>
				<label><input type="checkbox" name="files" value="i"/>9、《授权委托书》</label><br/>
				<label><input type="checkbox" name="files" value="j"/>10、《法定代表人证明书》</label><br/>
				<label><input type="checkbox" name="files" value="k"/>11、《仲裁员选定书》</label><br/>
				<span><input type="checkbox" name="files" value="l"/>12、（<input type="text" name="contents" class="textInput" size="5">）安仲（<input type="text" name="contents" class="textInput" size="5">）字第（<input type="text" name="contents" class="textInput" size="5">）号调解书/裁决书/决定书</span><br/>
				<label><input type="checkbox" name="files" value="m"/>13、延期通知书</label><br/>
				<label><input type="checkbox" name="files" value="n"/>14、仲裁员仲裁庭案件通知书</label><br/>
				<label><input type="checkbox" name="files" value="o"/>15、答辩书</label><br/>
				<label><input type="checkbox" name="files" value="p"/>16、《安阳仲裁委员会仲裁风险责任告知书》</label><br/>
				<label><input type="checkbox" name="files" value="q"/>17、《仲裁案件当事人意见征询表》</label><br/>
			</td>
			<td>
				上述送达文书和证据材料共
				&nbsp;&nbsp;&nbsp;&nbsp;
				件，于
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				收到。
				<br/>受送达人或代收人（签名或盖章）：
			</td>
		</tr>
		<tr>
			<td>不能送达原因或拒收理由</td>
			<td colspan="3">
				<!-- <textarea rows="3" cols="100" name="reason" class="textInput"></textarea> -->
			</td>
		</tr>
		<tr>
			<td>签发人</td>
			<td>
				${c.user.name }
			</td>
			<td>送达人</td>
			<td><input name="processServer" type="text" class="required textInput"></td>
		</tr>
		<tr>
			<td>备注</td>
			<td colspan="3">
				<textarea rows="3" cols="100" name="description" class="textInput"></textarea>
			</td>
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