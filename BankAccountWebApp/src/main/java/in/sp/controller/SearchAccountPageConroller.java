package in.sp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SearchAccountPageConroller {

	@GetMapping("/searchAccount")
	public String searchAccountPage() {
		return "home";
	}
}
