package in.sp.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.sp.dao.BankAccountDao;
import in.sp.model.BankAccount;

@Service
public class WithDrawService {

	private final BankAccountDao accountDao;

	public WithDrawService(BankAccountDao accountDao) {
		this.accountDao = accountDao;
	}

	@Transactional
	public void withdraw(String accountNumber, double amount) {
		if (accountNumber == null || accountNumber.isBlank()) {

			throw new IllegalArgumentException("Account number is required");
		}

		if (amount <= 0) {

			throw new IllegalArgumentException("Withdraw amount must be greater than zero");
		}

		BankAccount account = accountDao.getAccount(accountNumber);

		if (account == null) {

			throw new IllegalArgumentException("Account not found");
		}

		if (amount > account.getBalance()) {

			throw new IllegalArgumentException("Insufficient balance");

		}
		
		accountDao.withdraw(accountNumber, amount);
	}
}