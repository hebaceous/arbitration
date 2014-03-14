<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
var $fieldset = null;
var $fieldset1 = null;
$(function() {
	$fieldset = $("div.applicant fieldset:eq(1)");
	$fieldset1 = $("div.applicant fieldset:eq(3)");

	$("#agreement").unbind("change").bind("change",function(){
		if($(this).val() == "已有"){
			$("#linkman").hide();
		} else if($(this).val() == "补充"){
			$("#linkman").show();
		}
	});
	$("select[name=type]").unbind("change").bind("change",function(){
		$("input[name=cause]").val($("select[name=type] :selected").text());
		if($("select[name=type] :selected").val() == 8){	//其它
			$("#typeName").show();
			$("input[name=cause]").val("");
		} else {
			$("#typeName").hide();
		}
	});
	$("input[name=typeName]").unbind("blur").bind("blur",function(){
		$("input[name=cause]").val($(this).val());
	});
	$("input[name=money]").unbind("blur").bind("blur",function(){
		var $money = $(this).val();
		var $acceptCharges = $("input[name=acceptCharges]");
		var $handlingCharges = $("input[name=handlingCharges]");
		if($money <= 1000){
			$acceptCharges.val(80);
		} else if($money > 1000 && $money <= 50000){
			$acceptCharges.val(parseInt($money*0.04 + 40));
		} else if($money > 50000 && $money <= 100000){
			$acceptCharges.val(parseInt($money*0.03 + 540));
		} else if($money > 100000 && $money <= 200000){
			$acceptCharges.val(parseInt($money*0.02 + 1540));
		} else if($money > 200000 && $money <= 500000){
			$acceptCharges.val(parseInt($money*0.015 + 2540));
		} else if($money > 500000 && $money <= 1000000){
			$acceptCharges.val(parseInt($money*0.01 + 5040));
		} else if($money > 1000000){
			$acceptCharges.val(parseInt($money*0.005 + 10040));
		}
		if($money <= 1000){
			$handlingCharges.val(300);
		} else if($money > 1000 && $money <= 20000){
			$handlingCharges.val(500);
		} else if($money > 20000 && $money <= 50000){
			$handlingCharges.val(700);
		} else if($money > 50000){
			$handlingCharges.val(parseInt($acceptCharges.val()*0.3));
		}
		$("#total").val(parseInt($acceptCharges.val()) + parseInt($handlingCharges.val()));
	});
});
function addApplicant(object) {
	$(object).parents("div.applicant").append("<fieldset>" + $fieldset.html() + "</fieldset>");
}
function addApplicant1(object) {
	$(object).parents("div.applicant").append("<fieldset>" + $fieldset1.html() + "</fieldset>");
}
function removeApplicant(object) {
	$(object).parents("fieldset").remove();
}
function applicantType(object) {
	var $fieldset = $(object).parents("fieldset");
	var $organizationDL = $fieldset.children("dl:eq(2)");	//单位、组织
	var $nameDL = $fieldset.children("dl:eq(3)");	//姓名、法定代表人
	var $postDL = $fieldset.children("dl:eq(4)");	//职务
	var $sexDL = $fieldset.children("dl:eq(5)");	//性别
	var $identityCardDL = $fieldset.children("dl:eq(6)");	//身份证号
	var $addressDL = $fieldset.children("dl:eq(8)");	//地址、住所地
	if($(object).val() == 0){	//公民
		$organizationDL.hide();
		$postDL.hide();
		$nameDL.show();
		$sexDL.show();
		$identityCardDL.show();
		$nameDL.children("dt").text("姓名：");
		$addressDL.children("dt").text("地址：");
	} else if($(object).val() == 1){	//法人
		$sexDL.hide();
		$identityCardDL.hide();
		$organizationDL.show();
		$postDL.show();
		$organizationDL.children("dt").text("单位名称：");
		$nameDL.children("dt").text("法定代表人：");
		$addressDL.children("dt").text("住所地：");
	} else if($(object).val() == 2){	//其它组织
		$sexDL.hide();
		$identityCardDL.hide();
		$organizationDL.show();
		$postDL.show();
		$organizationDL.children("dt").text("组织名称：");
	}
}

/**
 * 检测案件
 */
$("#id").unbind("blur").bind("blur",function(){
	var $message = $("#message");
	$.ajax({
		url : "${pageContext.request.contextPath }/case/checkCaseId",
		data : { id:$(this).val().trim() },
		type : 'post',
		success : function(data) {
			if(data){
				$message.html("案件号可以使用！");
				$message.css("color", "blue");
			} else if(!data) {
				$message.html("案件号已经存在！");
				$message.css("color", "red");
			} else if(data.statusCode == "300") {
				$message.html("系统出错！");
				$message.css("color", "red");
			}
		},
		error : function() {
			$message.html("系统出错！");
			$message.css("color", "red");
		}
	});
});

</script>

<div class="pageContent">
<form method="post" action="${pageContext.request.contextPath }/flow/0/${user.id}" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);;">
	<div class="pageFormContent" layoutH="56">
	<div class="applicant">
		<fieldset>
			<legend>申请人信息</legend>
			<dl>
				<dt>添加申请人</dt>
				<dd><div class="button"><div class="buttonContent"><button type="button" onclick="addApplicant(this);">点击添加申请人</button></div></div></dd>
			</dl>
		</fieldset>
		<fieldset>
			<input type="hidden" name="applicants.isApplicant" value="true">
			<legend>申请人</legend>
			<dl>
				<dt>申请人类型：</dt>
				<dd>
					<select name="applicants.type" onchange="applicantType(this);">
						<c:forEach var="type" varStatus="status" items="${applicantTypes }" >
							<option value="${status.index }">${type }</option>
						</c:forEach>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>删除此申请人：</dt>
				<dd><div class="button"><div class="buttonContent"><button type="button" onclick="removeApplicant(this);">点击删除</button></div></div></dd>
			</dl>
			<div class="divider"></div>
			<dl style="display: none;">	<%-- dl eq(2) --%>
				<dt>单位名称：</dt>
				<dd><input name="applicants.organization" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>姓名：</dt>	<%-- dl eq(3) --%>
				<dd><input name="applicants.name" class="textInput required" type="text"/></dd>
			</dl>
			<dl style="display: none;">	<%-- dl eq(4) --%>
				<dt>职务：</dt>
				<dd><input name="applicants.post" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>性别：</dt>	<%-- dl eq(5) --%>
				<dd>
					<select name="applicants.sex">
						<option value="">请选择</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>身份证号：</dt>	<%-- dl eq(6) --%>
				<dd><input name="applicants.identityCard" class="textInput" type="text"/></dd>
			</dl>
			<!-- <dl>
				<dt>年龄：</dt>
				<dd><input name="applicants.age" class="digits textInput" type="text"/></dd>
			</dl> -->
			<dl>
				<dt>联系方式：</dt>
				<dd><input name="applicants.phone" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>地址：</dt>	<%-- dl eq(8) --%>
				<dd><input name="applicants.address" class="textInput" type="text"/></dd>
			</dl>
			<div class="divider"></div>
			<dl>
				<dt>主要发言人：</dt>
				<dd><input name="applicants.proxy_spokesman" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>代理人：</dt>
				<dd><input name="applicants.proxy_proxy1" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>代理人：</dt>
				<dd><input name="applicants.proxy_proxy2" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>单位：</dt>
				<dd><input name="applicants.proxy_organization" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>联系方式：</dt>
				<dd><input name="applicants.proxy_contact" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>代理权限：</dt>
				<dd>
					<select name="applicants.proxy_power">
						<option value="">请选择</option>
						<option value="特别授权">特别授权</option>
						<option value="特别授权">一般代理</option>
					</select>
				</dd>
			</dl>
		</fieldset>
	</div>
	<div class="applicant">
		<fieldset>
			<legend>被申请人信息</legend>
			<dl>
				<dt>添加被申请人</dt>
				<dd><div class="button"><div class="buttonContent"><button type="button" onclick="addApplicant1(this);">点击添加被申请人</button></div></div></dd>
			</dl>
		</fieldset>
		<fieldset>
			<input type="hidden" name="applicants.isApplicant" value="false">
			<legend>被申请人</legend>
			<dl>
				<dt>被申请人类型：</dt>
				<dd>
					<select name="applicants.type" onchange="applicantType(this);">
						<c:forEach var="type" varStatus="status" items="${applicantTypes }" >
							<option value="${status.index }">${type }</option>
						</c:forEach>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>删除此被申请人：</dt>
				<dd><div class="button"><div class="buttonContent"><button type="button" onclick="removeApplicant(this);">点击删除</button></div></div></dd>
			</dl>
			<div class="divider"></div>
			<dl style="display: none;">
				<dt>单位名称：</dt>
				<dd><input name="applicants.organization" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>姓名：</dt>
				<dd><input name="applicants.name" class="textInput required" type="text"/></dd>
			</dl>
			<dl style="display: none;">
				<dt>职务：</dt>
				<dd><input name="applicants.post" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>性别：</dt>
				<dd>
					<select name="applicants.sex">
						<option value="">请选择</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>身份证号：</dt>	<%-- dl eq(6) --%>
				<dd><input name="applicants.identityCard" class="textInput" type="text"/></dd>
			</dl>
			<!-- <dl>
				<dt>年龄：</dt>
				<dd><input name="applicants.age" class="digits textInput" type="text"/></dd>
			</dl> -->
			<dl>
				<dt>联系方式：</dt>
				<dd><input name="applicants.phone" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>地址：</dt>
				<dd><input name="applicants.address" class="textInput" type="text"/></dd>
			</dl>
			<div class="divider"></div>
			<dl>
				<dt>主要发言人：</dt>
				<dd><input name="applicants.proxy_spokesman" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>代理人：</dt>
				<dd><input name="applicants.proxy_proxy1" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>代理人：</dt>
				<dd><input name="applicants.proxy_proxy2" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>单位：</dt>
				<dd><input name="applicants.proxy_organization" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>联系方式：</dt>
				<dd><input name="applicants.proxy_contact" class="textInput" type="text"/></dd>
			</dl>
			<dl>
				<dt>代理权限：</dt>
				<dd>
					<select name="applicants.proxy_power">
						<option value="">请选择</option>
						<option value="特别授权">特别授权</option>
						<option value="特别授权">一般代理</option>
					</select>
				</dd>
			</dl>
		</fieldset>
	</div>
		<fieldset>
				<legend>案件信息</legend>
				<dl>
					<dt>案件号：</dt>
					<dd>
						<input id="id" name="id" class="textInput required" type="text" size="10"/><span id="message" style="margin-left: 10px;"></span>
						<%-- <input name="id" class="required" remote="${pageContext.request.contextPath }/case/checkCaseId" type="text" size="10"/> --%>
					</dd>
				</dl>
				<dl>
					<dt>仲裁协议：</dt>
					<dd>
						<select id="agreement" class="combox">
							<option value="已有">已有</option>
							<option value="补充">补充</option>
						</select>
						<span id="linkman" style="display: none;"><input name="agreement" type="text" size="10"/>（联系人）</span>
					</dd>
				</dl>
				<dl>
					<dt>案件类型：</dt>
					<dd>
						<select name="type" class="required combox">
							<option value="">请选择</option>
							<c:forEach var="type" items="${caseTypes }" varStatus="status">
								<option value="${status.index }">${type }</option>
							</c:forEach>
						</select>
						<span id="typeName" style="display: none;"><input name="typeName" type="text" size="20"/></span>
					</dd>
				</dl>
				<dl>
					<dt>案由：</dt>
					<dd><input name="cause" class="required" type="text"/></dd>
				</dl>
				<dl>
					<dt>仲裁申请日期：</dt>
					<dd><input type="text" name="date" class="required date" readonly="readonly"/><a class="inputDateButton" href="javascript:;">选择</a></dd>
				</dl>
				<dl class="nowrap">
					<dt>仲裁请求事项：</dt>
					<dd><textarea name="request" cols="80" rows="5" class="required"></textarea></dd>
				</dl>
				<div class="divider"></div>
				<dl>
					<dt>争议金额：</dt>
					<dd><input name="money" class="required digits" type="text" alt="请输入数字"/></dd>
				</dl>
				<dl>
					<dt>适用程序：</dt>
					<dd>
						<select name="applicableProcedure" class="required combox">
							<option value="">请选择</option>
							<c:forEach var="procedure" varStatus="status" items="${caseProcedures }">
								<option value="${status.index }">${procedure }</option>
							</c:forEach>
						</select>
					</dd>
				</dl>
				<dl>
					<dt>受理费：</dt>
					<dd><input name="acceptCharges" readonly="readonly" type="text"/></dd>
				</dl>
				<dl>
					<dt>处理费：</dt>
					<dd><input name="handlingCharges" readonly="readonly" type="text"/></dd>
				</dl>
				<dl>
					<dt>仲裁费合计：</dt>
					<dd><input id="total" name="arbitrationCharges" readonly="readonly" type="text"/></dd>
				</dl>
				<dl>
					<dt>实交费用：</dt>
					<dd><input name="paidCharges" class="required digits" type="text" alt="请输入数字"/></dd>
				</dl>
				<dl>
					<dt>是否减免：</dt>
					<dd>
						<select name="isRelief" class="required combox">
							<option value="">请选择</option>
							<option value="true">是</option>
							<option value="false">否</option>
						</select>
					</dd>
				</dl>
			</fieldset>
		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>