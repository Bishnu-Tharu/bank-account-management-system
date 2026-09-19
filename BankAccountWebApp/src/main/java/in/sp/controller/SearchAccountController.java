package in.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import in.sp.model.BankAccount;
import in.sp.service.GetAccountService;
import in.sp.service.TransactionService;

@Controller
public class SearchAccountController {

	private final TransactionService transactionService;
	private final GetAccountService getAccountService;

	@Autowired
	public SearchAccountController(TransactionService transactionService, GetAccountService getAccountService) {
		this.transactionService = transactionService;
		this.getAccountService = getAccountService;
	}


	@PostMapping("/searchAccount")
	public ModelAndView searchAccount(@ModelAttribute BankAccount account) {

		try {
			ModelAndView modelAndView = new ModelAndView("account");
			modelAndView.addObject("account", getAccountService.getAccount(account.getAccountNumber()));
			modelAndView.addObject("transactions", transactionService.getTransactions(account.getAccountNumber()));
			return modelAndView;
		} catch (Exception e) {
			ModelAndView modelAndView = new ModelAndView("home");
			modelAndView.addObject("error", "Account not found");
			return modelAndView;
		}

	}
}
