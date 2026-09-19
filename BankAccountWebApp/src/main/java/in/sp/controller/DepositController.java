package in.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import in.sp.model.BankAccount;
import in.sp.service.DepositService;

@Controller
public class DepositController {

	private final DepositService service;
	private final LoadAccount loadAccount;
	
	@Autowired
	public DepositController(DepositService service, LoadAccount loadAccount) {
		this.service = service;
		this.loadAccount = loadAccount;
	}


	@PostMapping("/deposit")
	public ModelAndView deposit(@ModelAttribute BankAccount account) {
		ModelAndView modelAndView = new ModelAndView("account");
		try {
			service.deposit(account.getAccountNumber(), account.getBalance());
			modelAndView.addObject("success", "Deposit successfull");
		} catch (Exception e) {
			modelAndView.addObject("error", e.getMessage());
		}
		return loadAccount.loadAccount(account.getAccountNumber(), modelAndView);
	}
}
