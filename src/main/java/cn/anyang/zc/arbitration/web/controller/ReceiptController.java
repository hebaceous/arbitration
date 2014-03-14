package cn.anyang.zc.arbitration.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.anyang.zc.arbitration.domain.Receipt;
import cn.anyang.zc.arbitration.service.ReceiptService;

@Controller
@RequestMapping("/receipt")
public class ReceiptController {

	@Autowired
	private ReceiptService receiptService;

	/**
	 * 获取回证详情
	 */
	@RequestMapping(value="/{id}",method=RequestMethod.GET)
	public String receiptDetail(@PathVariable String id, Model model) {
		Receipt receipt = this.receiptService.get(id);
		model.addAttribute("receipt", receipt);
		return "receipt/receiptDetail";
	}

}
