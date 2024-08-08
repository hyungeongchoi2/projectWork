package com.com.com;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeCon {
	
	@RequestMapping("/")
	public String home() {
		
		return "home";
	}
}
