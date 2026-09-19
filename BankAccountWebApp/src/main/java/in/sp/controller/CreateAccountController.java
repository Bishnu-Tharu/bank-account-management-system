package in.sp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;


import in.sp.model.Customer;
import in.sp.service.CreateAccount;

@Controller
public class CreateAccountController {

	private final CreateAccount account;

	public CreateAccountController(CreateAccount account) {
		this.account = account;
	}

	@PostMapping("/createAccount")
	public ModelAndView createAccount(@ModelAttribute Customer customer) throws IllegalAccessException {
		ModelAndView mavAndView = new ModelAndView("home");
		String accountNUmber = account.createAccount(customer);
		try {
			mavAndView.addObject("success", "Account created successfully. Account Number: " + accountNUmber);
			return mavAndView;
		} catch (Exception e) {
			mavAndView.addObject("error", e.getMessage());
		}
		return mavAndView;
	}
}
