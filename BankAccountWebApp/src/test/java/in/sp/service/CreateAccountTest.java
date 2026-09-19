package in.sp.service;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;


import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import in.sp.dao.BankAcountDaoImpl;
import in.sp.model.Customer;

@ExtendWith(MockitoExtension.class)
public class CreateAccountTest {

	@Mock
	private BankAcountDaoImpl acountDaoImpl;

	@InjectMocks
	private CreateAccount account;

	@Test
	@Disabled
	@DisplayName("User Case")
	void createAccountWithUser() {
		Customer customer = new Customer();
		customer.setFirstName("Bishnu");
		customer.setLastName("Chaudhary");
		customer.setEmail("bishnu@gmail.com");
		customer.setPhone("9746378006");

		try {
			when(acountDaoImpl.createAccount(any(Customer.class))).thenReturn("AC10001");

			String accountNumber = account.createAccount(customer);

			Assertions.assertEquals("AC10001", accountNumber);

			verify(acountDaoImpl).createAccount(customer);

		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}


	@Test
	@Disabled
	@DisplayName("Null Case")
	void createAccountWithNull() {

		IllegalAccessException exception = Assertions.assertThrows(IllegalAccessException.class,
				() -> account.createAccount(null));

		String excepted = "Customer cannot be null";

		Assertions.assertEquals(excepted, exception.getMessage());

		verify(acountDaoImpl, never()).createAccount(any(Customer.class));

		System.out.println("\nThrow message : " + excepted);
		System.out.println("Message() : " + exception.getMessage());
		System.out.println("LocalizedMessage() : " + exception.getLocalizedMessage());
		System.out.println("StackTrace() : " + exception.getStackTrace());
		System.out.println("Class() : " + exception.getClass());
		System.out.println("Assertion eqauls: " + excepted.equals(exception.getMessage()));
		
	}
	
	@Test
	@Disabled
	@DisplayName("Full_Name null Case")
	void createAccountWithFistNameNull() {

		Customer customer = new Customer();
		customer.setFirstName(null);
		customer.setLastName("Chaudhary");
		customer.setEmail("bishnu@gmail.com");
		customer.setPhone("9746378006");
		
		
		IllegalArgumentException exception = Assertions.assertThrows(IllegalArgumentException.class,
				() -> account.createAccount(customer));

		String excepted = "First name is required";

		Assertions.assertEquals(excepted, exception.getMessage());

		verify(acountDaoImpl, never()).createAccount(any(Customer.class));

		System.out.println("Message() : " + exception.getMessage());
		System.out.println("Assertion eqauls: " + excepted.equals(exception.getMessage()));
		
	}
	
	@Test
	@Disabled
	@DisplayName("Full_Name blank Case")
	void createAccountWithFistNameBlank() {

		Customer customer = new Customer();
		customer.setFirstName("");
		customer.setLastName("Chaudhary");
		customer.setEmail("bishnu@gmail.com");
		customer.setPhone("9746378006");
		
		
		IllegalArgumentException exception = Assertions.assertThrows(IllegalArgumentException.class,
				() -> account.createAccount(customer));

		String excepted = "First name is required";

		Assertions.assertEquals(excepted, exception.getMessage());

		verify(acountDaoImpl, never()).createAccount(any(Customer.class));

		System.out.println("Message() : " + exception.getMessage());
		System.out.println("Assertion eqauls: " + excepted.equals(exception.getMessage()));
		
	}
	
	@Test
	@DisplayName("Email blank Case")
	void createAccountWithEmailBlank() {

		Customer customer = new Customer();
		customer.setFirstName("Bishnu");
		customer.setLastName("Chaudhary");
		customer.setEmail("");
		customer.setPhone("9746378006");
		
		
		IllegalArgumentException exception = Assertions.assertThrows(IllegalArgumentException.class,
				() -> account.createAccount(customer));

		String excepted = "Email is required";

		Assertions.assertEquals(excepted, exception.getMessage());

		verify(acountDaoImpl, never()).createAccount(any(Customer.class));

		System.out.println("Message() : " + exception.getMessage());
		System.out.println("Assertion eqauls: " + excepted.equals(exception.getMessage()));
		
	}

}
