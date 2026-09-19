package in.sp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import in.sp.model.BankAccount;
import in.sp.model.Customer;
import in.sp.model.Transaction;

@Repository
public interface BankAccountDao {

	String createAccount(Customer customer);

	BankAccount getAccount(String accountNumber);

	void deposit(String accountNumber, double amount);

	void withdraw(String accountNumber, double amount);

	List<Transaction> geTransactions(String accountNumber);

}
