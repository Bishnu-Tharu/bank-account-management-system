package in.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import in.sp.model.BankAccount;
import in.sp.service.WithDrawService;

@Controller
public class WithDrawContoller {

	private final WithDrawService service;
	private final LoadAccount loadAccount;

	@Autowired
	public WithDrawContoller(WithDrawService service, LoadAccount loadAccount) {
		this.service = service;
		this.loadAccount = loadAccount;
	}

	@PostMapping("/withdraw")
	public ModelAndView deposit(@ModelAttribute BankAccount account) {
		ModelAndView modelAndView = new ModelAndView("account");
		try {
			service.withdraw(account.getAccountNumber(), account.getBalance());
			modelAndView.addObject("success", "WithDrawal successfull");
		} catch (Exception e) {
			modelAndView.addObject("error", e.getMessage());
		}
		return loadAccount.loadAccount(account.getAccountNumber(), modelAndView);
	}
}
