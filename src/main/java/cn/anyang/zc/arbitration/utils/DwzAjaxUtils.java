package cn.anyang.zc.arbitration.utils;

import cn.anyang.zc.arbitration.model.DwzAjaxModel;

public class DwzAjaxUtils {

	public static DwzAjaxModel ok() {
		DwzAjaxModel dwzAjaxReturn = new DwzAjaxModel();
		dwzAjaxReturn.setStatusCode(200);
		dwzAjaxReturn.setMessage("操作成功");
		return dwzAjaxReturn;
	}

	public static DwzAjaxModel ok_closeCurrent(){
		DwzAjaxModel model = DwzAjaxUtils.ok();
		model.setCallbackType("closeCurrent");
		return model;
	}

	public static DwzAjaxModel error() {
		DwzAjaxModel dwzAjaxReturn = new DwzAjaxModel();
		dwzAjaxReturn.setStatusCode(300);
		dwzAjaxReturn.setMessage("操作失败");
		return dwzAjaxReturn;
	}

	public static DwzAjaxModel timeout() {
		DwzAjaxModel dwzAjaxReturn = new DwzAjaxModel();
		dwzAjaxReturn.setStatusCode(301);
		dwzAjaxReturn.setMessage("会话超时");
		return dwzAjaxReturn;
	}

}