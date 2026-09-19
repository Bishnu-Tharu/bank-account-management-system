package in.sp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.sp.dao.BankAcountDaoImpl;
import in.sp.model.BankAccount;

@Service
public class GetAccountService {

	private final BankAcountDaoImpl accountDao;

	@Autowired
	public GetAccountService(BankAcountDaoImpl accountDao) {
		this.accountDao = accountDao;
	}
	
	@Transactional
	public BankAccount getAccount(String accounNumber) {
		if (accounNumber == null || accounNumber.isBlank()) {
			return null;
		}

		return accountDao.getAccount(accounNumber);
	}
}
