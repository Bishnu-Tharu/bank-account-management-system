package in.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import in.sp.model.BankAccount;
import in.sp.service.GetAccountService;
import in.sp.service.TransactionService;

@Component
public class LoadAccount {
	private final GetAccountService service;
	private final TransactionService transactionService;

	@Autowired
	public LoadAccount(GetAccountService service, TransactionService transactionService) {
		this.service = service;
		this.transactionService = transactionService;
	}

	public ModelAndView loadAccount(String accountNumber, ModelAndView mav) {

		BankAccount account = service.getAccount(accountNumber);
		if (account == null) {
			mav.addObject("error", "Account not found");
			return mav;
		}

		mav.addObject("account", account);
		mav.addObject("transactions", transactionService.getTransactions(accountNumber));
		return mav;
	}
}
