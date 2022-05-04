package com.example.miniproject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeCont {
	
	public HomeCont() {
		System.out.println("HomeController Start_..");
		
	};
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView welcome_page() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hello");
		return mav;
	}
}
