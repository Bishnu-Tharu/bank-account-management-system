package in.sp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/index")
	public String Home() {
		return "home";
	}
	
	@GetMapping("/backtohome")
	public String backtohome() {
		return "home";
	}
}
