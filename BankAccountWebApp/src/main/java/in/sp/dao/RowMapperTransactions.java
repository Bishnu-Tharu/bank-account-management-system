package in.sp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import in.sp.model.Transaction;

public class RowMapperTransactions implements RowMapper<Transaction>{

	@Override
	public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Transaction transaction = new Transaction();
		transaction.setTransactionId(rs.getInt("transaction_id"));
		transaction.setAccountId(rs.getInt("account_id"));
		transaction.setTransactionType(rs.getNString("transaction_type"));
		transaction.setAmount(rs.getDouble("amount"));
		transaction.setBalanceAfter(rs.getDouble("balance_after"));
		transaction.setTransactionDate(rs.getTimestamp("transaction_date"));
		
		return transaction;
	}

}
