<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
$(function() {
	if("${c.status }" == 10){
		var $inputs = $("table.print_arbitrator input[name=contents]");
		//console.info($inputs);
		if("${c.applicableProcedure }" == 0){	//简易程序
			if($($inputs[4]).val().trim() == $($inputs[10]).val().trim()){
				$($inputs[18]).val($($inputs[4]).val().trim());
				$($inputs[19]).val($($inputs[5]).val().trim());
				//意见
				$("textarea[name=opinion]").text("鉴于案件及当事人选定情况，建议由 " + $($inputs[18]).val().trim() + " 为独任仲裁员审理此案。");
			}
			//更改独任仲裁员意见
			$($inputs[18]).unbind("blur").bind("blur",function(){
				$("textarea[name=opinion]").text("鉴于案件及当事人选定情况，建议由 " + $($inputs[18]).val().trim() + " 为独任仲裁员审理此案。");
			});
		} else if ("${c.applicableProcedure }" == 1){	//普通程序
			$($inputs[14]).val($($inputs[2]).val().trim());
			$($inputs[15]).val($($inputs[3]).val().trim());
			$($inputs[16]).val($($inputs[8]).val().trim());
			$($inputs[17]).val($($inputs[9]).val().trim());
			if($($inputs[0]).val().trim() == $($inputs[6]).val().trim()){
				$($inputs[12]).val($($inputs[0]).val().trim());
				$($inputs[13]).val($($inputs[1]).val().trim());
				//意见
				$("textarea[name=opinion]").text("鉴于案件及当事人选定情况，建议由 " + $($inputs[12]).val().trim() + " 为首席仲裁员，" + $($inputs[14]).val().trim() +"，" + $($inputs[16]).val().trim() + " 为仲裁员组成仲裁庭审理此案。");
			}
			//更改仲裁员意见
			$($inputs[12]).unbind("blur").bind("blur",function(){
				$("textarea[name=opinion]").text("鉴于案件及当事人选定情况，建议由 " + $($inputs[12]).val().trim() + " 为首席仲裁员，" + $($inputs[14]).val().trim() +"，" + $($inputs[16]).val().trim() + " 为仲裁员组成仲裁庭审理此案。");
			});
			$($inputs[14]).unbind("blur").bind("blur",function(){
				$("textarea[name=opinion]").text("鉴于案件及当事人选定情况，建议由 " + $($inputs[12]).val().trim() + " 为首席仲裁员，" + $($inputs[14]).val().trim() +"，" + $($inputs[16]).val().trim() + " 为仲裁员组成仲裁庭审理此案。");
			});
			$($inputs[16]).unbind("blur").bind("blur",function(){
				$("textarea[name=opinion]").text("鉴于案件及当事人选定情况，建议由 " + $($inputs[12]).val().trim() + " 为首席仲裁员，" + $($inputs[14]).val().trim() +"，" + $($inputs[16]).val().trim() + " 为仲裁员组成仲裁庭审理此案。");
			});
		}
	}
});
</script>
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

<form method="post" action="${pageContext.request.contextPath }/flow/101112/${c.id }/${user.id }" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">

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
				仲裁秘书：${arbitrator.secretary }&nbsp;&nbsp;&nbsp;&nbsp;
				<fmt:formatDate value="${arbitrator.date }" pattern="yyyy年MM月dd日"/>
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
			<td><input type="text" name="contents" class="textInput" readonly="readonly" value="${fn:split(arbitrator.contents, ',')[0] }"></td>
			<td><input type="text" name="contents" class="textInput" readonly="readonly" value="${fn:split(arbitrator.contents, ',')[1] }"></td>
		</tr>
		<tr>
			<td>仲裁员</td>
			<td><input type="text" name="contents" class="textInput" readonly="readonly" value="${fn:split(arbitrator.contents, ',')[2] }"></td>
			<td><input type="text" name="contents" class="textInput" readonly="readonly" value="${fn:split(arbitrator.contents, ',')[3] }"></td>
		</tr>
		<tr>
			<td>独任仲裁员</td>
			<td><input type="text" name="contents" class="textInput" readonly="readonly" value="${fn:split(arbitrator.contents, ',')[4] }"></td>
			<td><input type="text" name="contents" class="textInput" readonly="readonly" value="${fn:split(arbitrator.contents, ',')[5] }"></td>
		</tr>

		<tr>
			<td rowspan="4">被申请人选定情况</td>
			<td></td>
			<td>仲裁员姓名</td>
			<td>专业</td>
		</tr>
		<tr>
			<td>首席仲裁员</td>
			<td><input type="text" name="contents" class="textInput" readonly="readonly" value="${fn:split(arbitrator.contents, ',')[6] }"></td>
			<td><input type="text" name="contents" class="textInput" readonly="readonly" value="${fn:split(arbitrator.contents, ',')[7] }"></td>
		</tr>
		<tr>
			<td>仲裁员</td>
			<td><input type="text" name="contents" class="textInput" readonly="readonly" value="${fn:split(arbitrator.contents, ',')[8] }"></td>
			<td><input type="text" name="contents" class="textInput" readonly="readonly" value="${fn:split(arbitrator.contents, ',')[9] }"></td>
		</tr>
		<tr>
			<td>独任仲裁员</td>
			<td><input type="text" name="contents" class="textInput" readonly="readonly" value="${fn:split(arbitrator.contents, ',')[10] }"></td>
			<td><input type="text" name="contents" class="textInput" readonly="readonly" value="${fn:split(arbitrator.contents, ',')[11] }"></td>
		</tr>
		<tr>
			<td rowspan="5">仲裁委指定情况</td>
			<td></td>
			<td>仲裁员姓名</td>
			<td>专业</td>
		</tr>
		<tr>
			<td>首席仲裁员</td>
			<td><input type="text" name="contents" ${c.status == 10 && c.applicableProcedure == 1 ? '' : 'readonly' } value="${fn:split(arbitrator.contents, ',')[12] }" <c:if test="${c.status == 10 && c.applicableProcedure == 1 }">class="required textInput"</c:if>></td>
			<td><input type="text" name="contents" class="textInput" ${c.status == 10 && c.applicableProcedure == 1 ? '' : 'readonly' } value="${fn:split(arbitrator.contents, ',')[13] }"></td>
		</tr>
		<tr>
			<td>仲裁员</td>
			<td><input type="text" name="contents" ${c.status == 10 && c.applicableProcedure == 1 ? '' : 'readonly' } value="${fn:split(arbitrator.contents, ',')[14] }" <c:if test="${c.status == 10 && c.applicableProcedure == 1 }">class="required textInput"</c:if>></td>
			<td><input type="text" name="contents" class="textInput" ${c.status == 10 && c.applicableProcedure == 1 ? '' : 'readonly' } value="${fn:split(arbitrator.contents, ',')[15] }"></td>
		</tr>
		<tr>
			<td>仲裁员</td>
			<td><input type="text" name="contents" ${c.status == 10 && c.applicableProcedure == 1 ? '' : 'readonly' } value="${fn:split(arbitrator.contents, ',')[16] }" <c:if test="${c.status == 10 && c.applicableProcedure == 1 }">class="required textInput"</c:if>></td>
			<td><input type="text" name="contents" class="textInput" ${c.status == 10 && c.applicableProcedure == 1 ? '' : 'readonly' } value="${fn:split(arbitrator.contents, ',')[17] }"></td>
		</tr>
		<tr>
			<td>独任仲裁员</td>
			<td><input type="text" name="contents" ${c.status == 10 && c.applicableProcedure == 0 ? '' : 'readonly' } value="${fn:split(arbitrator.contents, ',')[18] }" <c:if test="${c.status == 10 && c.applicableProcedure == 0 }">class="required textInput"</c:if>></td>
			<td><input type="text" name="contents" class="textInput" ${c.status == 10 && c.applicableProcedure == 0 ? '' : 'readonly' } value="${fn:split(arbitrator.contents, ',')[19] }"></td>
		</tr>
		<c:if test="${c.status > 10 }">
			<tr>
				<td>部门意见</td>
				<td colspan="3">
				${fn:split(arbitrator.departmentOpinion,",")[0] }
				<p style="text-align: right;">${fn:split(arbitrator.departmentOpinion,",")[1] }
				<p style="text-align: right;">${fn:split(arbitrator.departmentOpinion,",")[2] }
				</td>
			</tr>
			<c:if test="${c.status > 11 }">
				<tr>
					<td>中心主任审批</td>
					<td colspan="3">
					${fn:split(arbitrator.centerDirectorOpinion,",")[0] }
					<p style="text-align: right;">${fn:split(arbitrator.centerDirectorOpinion,",")[1] }
					<p style="text-align: right;">${fn:split(arbitrator.centerDirectorOpinion,",")[2] }
					</td>
				</tr>
			</c:if>
		</c:if>
		<tr>
			<td>是否同意</td>
			<td>
				<select name="agree" class="required combox">
					<!-- <option value="">请选择</option> -->
					<option value="true" selected="selected">同意</option>
					<option value="false">不同意</option>
				</select>
			</td>
			<td colspan="2">
			<%-- <textarea name="opinion" class="textInput" rows="3" cols="60">
				鉴于案件及当事人选定情况，建议由&nbsp;&nbsp;
				<c:if test="${c.applicableProcedure == 0 }">为独任仲裁员审理此案。</c:if>
				<c:if test="${c.applicableProcedure == 1 }">为首席仲裁员，&nbsp;&nbsp;，&nbsp;&nbsp;为仲裁员组成仲裁庭审理此案。</c:if>
			</textarea> --%>
			<c:if test="${c.status == 10 }">
				<textarea name="opinion" class="textInput" rows="3" cols="60"></textarea>
			</c:if>
			<c:if test="${c.status == 11 }">
				<textarea name="opinion" class="textInput" rows="3" cols="60">拟同意；请仲裁委主任审批。</textarea>
			</c:if>
			<c:if test="${c.status == 12 }">
				<textarea name="opinion" class="textInput" rows="3" cols="60">同意。</textarea>
			</c:if>
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