package in.sp.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.sp.dao.BankAcountDaoImpl;

@Service
public class DepositService {

	private final BankAcountDaoImpl accountDao;

	public DepositService(BankAcountDaoImpl accountDao) {
		this.accountDao = accountDao;
	}

	@Transactional
	public void deposit(String accountNumber, double amount) {
		if (accountNumber == null || accountNumber.isBlank()) {

			throw new IllegalArgumentException("Account number is required");
		}

		if (amount <= 0) {

			throw new IllegalArgumentException("Deposit amount must be greater than zero");
		}

		accountDao.deposit(accountNumber, amount);
	}
}
