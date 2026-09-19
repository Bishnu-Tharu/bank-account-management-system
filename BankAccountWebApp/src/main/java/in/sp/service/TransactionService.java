package in.sp.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.sp.dao.BankAccountDao;
import in.sp.model.Transaction;

@Service
public class TransactionService {

	private final BankAccountDao accountDao;

	public TransactionService(BankAccountDao accountDao) {
		this.accountDao = accountDao;
	}
	
	@Transactional
	public List<Transaction> getTransactions(String accountNumber){
		return accountDao.geTransactions(accountNumber);
	}
	
}
