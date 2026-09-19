package in.sp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import in.sp.model.BankAccount;
import in.sp.model.Customer;

public class RowMapperBankAccount implements RowMapper<BankAccount> {

	@Override
	public BankAccount mapRow(ResultSet rs, int rowNum) throws SQLException {
		BankAccount account = new BankAccount();
		Customer customer = new Customer();

		customer.setFirstName(rs.getString("first_name"));
		customer.setLastName(rs.getString("last_name"));
		customer.setEmail(rs.getString("email"));
		customer.setPhone(rs.getString("phone"));
		
		account.setAccountId(rs.getInt("account_id"));
		account.setCustomerId(rs.getInt("customer_id"));
		account.setAccountNumber(rs.getString("account_number"));
		account.setBalance(rs.getDouble("balance"));
		account.setStatus(rs.getString("status"));
		
		account.setCustomer(customer);

		return account;
	}

}
