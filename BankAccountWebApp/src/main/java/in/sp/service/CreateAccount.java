package in.sp.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.sp.dao.BankAcountDaoImpl;
import in.sp.model.Customer;

@Service
public class CreateAccount {

	private final BankAcountDaoImpl accountDao;

	public CreateAccount(BankAcountDaoImpl accountDao) {
		this.accountDao = accountDao;
	}

	@Transactional
	public String createAccount(Customer customer) throws IllegalAccessException {

		if (customer == null) {
			throw new IllegalAccessException("Customer cannot be null");
		}

		if (customer.getFirstName() == null || customer.getFirstName().isBlank()) {

			throw new IllegalArgumentException("First name is required");
		}

		if (customer.getEmail() == null || customer.getEmail().isBlank()) {

			throw new IllegalArgumentException("Email is required");
		}

		if (customer.getPhone() == null || customer.getPhone().isBlank()) {

			throw new IllegalArgumentException("Phone is required");
		}

		return accountDao.createAccount(customer);
	}
}
