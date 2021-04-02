package com.mycompany.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.vo.PaymentVO;

@Controller
public class PaymentController {

	/*@Resource(name = "paymentService")
  	private PaymentSerivce Service;*/
	
	@RequestMapping(value="/addPayment.do")
	public ModelAndView insertPayment(@RequestParam(required=false) PaymentVO paymentVO) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("paymentVO", paymentVO);
		mav.setViewName("payment/Payment");
		return mav;
	}
	
	
}
