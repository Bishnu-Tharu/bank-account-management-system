package in.sp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import in.sp.model.BankAccount;
import in.sp.model.Customer;
import in.sp.model.Transaction;

@Repository
public class BankAcountDaoImpl implements BankAccountDao {

	private final NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public BankAcountDaoImpl(NamedParameterJdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	// ================= CREATE ACCOUNT =================

	@Override
	public String createAccount(Customer customer) {

		Map<String, Object> params = new HashMap<>();

		params.put("key_firstName", customer.getFirstName());
		params.put("key_lastName", customer.getLastName());
		params.put("key_email", customer.getEmail());
		params.put("key_phone", customer.getPhone());

		String customerSql = "INSERT INTO customers " + "(first_name, last_name, email, phone) "
				+ "VALUES (:key_firstName, :key_lastName, :key_email, :key_phone)";

		jdbcTemplate.update(customerSql, params);

		Integer customerId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", new HashMap<>(), Integer.class);

		String accountNumber = "ACC" + System.currentTimeMillis();

		Map<String, Object> paramsBankAccount = new HashMap<>();

		paramsBankAccount.put("key_customerId", customerId);
		paramsBankAccount.put("key_accountNumber", accountNumber);
		paramsBankAccount.put("key_balance", 0.0);
		paramsBankAccount.put("key_status", "EMPTY");

		String bankAccountSql = "INSERT INTO bank_accounts " + "(customer_id, account_number, balance, status) "
				+ "VALUES (:key_customerId, :key_accountNumber, " + ":key_balance, :key_status)";

		jdbcTemplate.update(bankAccountSql, paramsBankAccount);

		return accountNumber;
	}

	// ================= GET ACCOUNT =================

	@Override
	public BankAccount getAccount(String accountNumber) {

		Map<String, Object> params = new HashMap<>();

		params.put("key_accountNumber", accountNumber);

		String sql = "SELECT cu.first_name, cu.last_name, cu.email, cu.phone, "
				+ "bc.account_id, bc.customer_id, bc.account_number, " + "bc.balance, bc.status "
				+ "FROM bank_accounts AS bc " + "JOIN customers cu " + "ON bc.customer_id = cu.customer_id "
				+ "WHERE bc.account_number = :key_accountNumber";

		try {

			return jdbcTemplate.queryForObject(sql, params, new RowMapperBankAccount());

		} catch (EmptyResultDataAccessException e) {

			return null;
		}
	}

	// ================= DEPOSIT =================

	@Override
	public void deposit(String accountNumber, double amount) {

		BankAccount account = getAccount(accountNumber);

		if (account == null) {
			throw new IllegalArgumentException("Account not found");
		}

		double newBalance = account.getBalance() + amount;

		String status = getStatus(newBalance);

		// Update balance and status
		Map<String, Object> params = new HashMap<>();

		params.put("key_newBalance", newBalance);
		params.put("key_status", status);
		params.put("key_accountNumber", accountNumber);

		String updateSql = "UPDATE bank_accounts " + "SET balance = :key_newBalance, " + "status = :key_status "
				+ "WHERE account_number = :key_accountNumber";

		// IMPORTANT: UPDATE uses update()
		jdbcTemplate.update(updateSql, params);

		// Insert transaction
		Map<String, Object> paramsTransaction = new HashMap<>();

		paramsTransaction.put("key_accountId", account.getAccountId());
		paramsTransaction.put("key_transactionType", "DEPOSIT");
		paramsTransaction.put("key_amount", amount);
		paramsTransaction.put("key_balanceAfter", newBalance);

		String transactionSql = "INSERT INTO transactions " + "(account_id, transaction_type, amount, balance_after) "
				+ "VALUES (:key_accountId, :key_transactionType, " + ":key_amount, :key_balanceAfter)";

		// IMPORTANT: INSERT uses update()
		jdbcTemplate.update(transactionSql, paramsTransaction);
	}

	// ================= WITHDRAW =================

	@Override
	public void withdraw(String accountNumber, double amount) {

		BankAccount account = getAccount(accountNumber);

		if (account == null) {
			throw new IllegalArgumentException("Account not found");
		}

		if (account.getBalance() < amount) {
			throw new IllegalArgumentException("Insufficient balance");
		}

		double newBalance = account.getBalance() - amount;

		String status = getStatus(newBalance);

		// Update balance and status
		Map<String, Object> params = new HashMap<>();

		params.put("key_newBalance", newBalance);
		params.put("key_status", status);
		params.put("key_accountNumber", accountNumber);

		String updateSql = "UPDATE bank_accounts " + "SET balance = :key_newBalance, " + "status = :key_status "
				+ "WHERE account_number = :key_accountNumber";

		// IMPORTANT: UPDATE uses update()
		jdbcTemplate.update(updateSql, params);

		// Insert transaction
		Map<String, Object> paramsTransaction = new HashMap<>();

		paramsTransaction.put("key_accountId", account.getAccountId());
		paramsTransaction.put("key_transactionType", "WITHDRAW");
		paramsTransaction.put("key_amount", amount);
		paramsTransaction.put("key_balanceAfter", newBalance);

		String transactionSql = "INSERT INTO transactions " + "(account_id, transaction_type, amount, balance_after) "
				+ "VALUES (:key_accountId, :key_transactionType, " + ":key_amount, :key_balanceAfter)";

		// IMPORTANT: INSERT uses update()
		jdbcTemplate.update(transactionSql, paramsTransaction);
	}

	// ================= GET TRANSACTIONS =================

	@Override
	public List<Transaction> geTransactions(String accountNumber) {

		Map<String, Object> params = new HashMap<>();

		params.put("key_accountNumber", accountNumber);

		String sql = "SELECT t.transaction_id, " + "t.account_id, " + "t.transaction_type, " + "t.amount, "
				+ "t.balance_after, " + "t.transaction_date " + "FROM transactions t " + "JOIN bank_accounts a "
				+ "ON t.account_id = a.account_id " + "WHERE a.account_number = :key_accountNumber "
				+ "ORDER BY t.transaction_date DESC";

		// SELECT multiple rows → query()
		return jdbcTemplate.query(sql, params, new RowMapperTransactions());
	}

	// ================= ACCOUNT STATUS =================

	public String getStatus(double amount) {

		if (Double.compare(amount, 0.0) == 0) {

			return "EMPTY";

		} else if (amount < 1000) {

			return "LOW BALANCE";

		} else if (amount > 100000) {

			return "HIGH BALANCE";

		} else {

			return "NORMAL";
		}
	}
}