<%@ page import="in.sp.model.Customer"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="in.sp.model.Transaction"%>
<%@ page import="in.sp.model.BankAccount"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>BankFlow - Account Details</title>

<style>

/* =====================================================
   RESET
===================================================== */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* =====================================================
   BODY
===================================================== */
body {
	font-family: Arial, sans-serif;
	min-height: 100vh;
	background: radial-gradient(circle at top left, #dbeafe, transparent 32%),
		radial-gradient(circle at bottom right, #f3e8ff, transparent 32%),
		linear-gradient(135deg, #f8fafc, #eef2ff);
	color: #172554;
	padding: 25px 15px 50px;
}

/* =====================================================
   MAIN CONTAINER
===================================================== */
.container {
	width: 100%;
	max-width: 1100px;
	margin: auto;
}

/* =====================================================
   NAVBAR
===================================================== */
.navbar {
	background: rgba(255, 255, 255, 0.88);
	border: 1px solid rgba(255, 255, 255, 0.7);
	border-radius: 18px;
	padding: 18px 25px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
	box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
	backdrop-filter: blur(12px);
}

.logo {
	font-size: 22px;
	font-weight: bold;
	color: #4f46e5;
	letter-spacing: 1px;
}

.nav-title {
	color: #64748b;
	font-size: 14px;
}

/* =====================================================
   PAGE HEADER
===================================================== */
.page-header {
	margin-bottom: 25px;
}

.page-header .badge {
	display: inline-block;
	background: #eef2ff;
	color: #4f46e5;
	padding: 7px 13px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: bold;
	margin-bottom: 12px;
}

.page-header h1 {
	font-size: 36px;
	color: #172554;
	margin-bottom: 8px;
}

.page-header p {
	color: #64748b;
	font-size: 15px;
}

/* =====================================================
   SUCCESS / ERROR
===================================================== */
.success {
	background: #dcfce7;
	color: #166534;
	padding: 14px 18px;
	margin-bottom: 20px;
	border-radius: 12px;
	border: 1px solid #bbf7d0;
	font-weight: bold;
	text-align: center;
}

.error {
	background: #fee2e2;
	color: #991b1b;
	padding: 14px 18px;
	margin-bottom: 20px;
	border-radius: 12px;
	border: 1px solid #fecaca;
	font-weight: bold;
	text-align: center;
}

/* =====================================================
   ACCOUNT CARD
===================================================== */
.account-card {
	background: rgba(255, 255, 255, 0.93);
	border-radius: 24px;
	padding: 32px;
	margin-bottom: 25px;
	box-shadow: 0 15px 40px rgba(15, 23, 42, 0.08);
	border: 1px solid rgba(226, 232, 240, 0.8);
}

/* =====================================================
   ACCOUNT TOP
===================================================== */
.account-top {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	padding-bottom: 25px;
	margin-bottom: 25px;
	border-bottom: 1px solid #e2e8f0;
}

.account-number-label {
	color: #64748b;
	font-size: 12px;
	font-weight: bold;
	letter-spacing: 1px;
	margin-bottom: 7px;
}

.account-number {
	font-size: 24px;
	font-weight: bold;
	color: #172554;
}

.balance-box {
	text-align: right;
}

.balance-label {
	color: #64748b;
	font-size: 12px;
	font-weight: bold;
	margin-bottom: 6px;
}

.balance {
	font-size: 30px;
	font-weight: bold;
	color: #4f46e5;
}

/* =====================================================
   ACCOUNT INFORMATION
===================================================== */
.account-info {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 18px;
}

.info-item {
	background: #f8fafc;
	padding: 18px;
	border-radius: 14px;
	border: 1px solid #e2e8f0;
}

.info-label {
	display: block;
	color: #64748b;
	font-size: 12px;
	font-weight: bold;
	margin-bottom: 7px;
	text-transform: uppercase;
}

.info-value {
	color: #1e293b;
	font-size: 16px;
	font-weight: 600;
	word-break: break-word;
}

/* =====================================================
   STATUS
===================================================== */
.status {
	display: inline-flex;
	align-items: center;
	gap: 7px;
	padding: 6px 12px;
	background: #dcfce7;
	color: #166534;
	border-radius: 20px;
	font-size: 13px;
	font-weight: bold;
}

.status-dot {
	width: 8px;
	height: 8px;
	background: #22c55e;
	border-radius: 50%;
}

/* =====================================================
   OPERATIONS
===================================================== */
.operations {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 25px;
	margin-bottom: 25px;
}

/* =====================================================
   OPERATION CARD
===================================================== */
.operation-card {
	background: rgba(255, 255, 255, 0.93);
	border-radius: 22px;
	padding: 30px;
	box-shadow: 0 12px 35px rgba(15, 23, 42, 0.07);
	border: 1px solid rgba(226, 232, 240, 0.8);
}

.operation-header {
	display: flex;
	align-items: center;
	gap: 13px;
	margin-bottom: 22px;
}

.operation-icon {
	width: 48px;
	height: 48px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 13px;
	background: #eef2ff;
	color: #4f46e5;
	font-size: 22px;
}

.operation-header h2 {
	font-size: 20px;
	color: #172554;
}

.operation-header p {
	color: #64748b;
	font-size: 12px;
	margin-top: 4px;
}

/* =====================================================
   FORM
===================================================== */
label {
	display: block;
	margin-bottom: 8px;
	font-size: 14px;
	font-weight: bold;
	color: #334155;
}

input[type="number"] {
	width: 100%;
	padding: 14px 15px;
	border: 1px solid #cbd5e1;
	border-radius: 11px;
	font-size: 15px;
	outline: none;
	background: #f8fafc;
	transition: 0.2s;
}

input[type="number"]:focus {
	border-color: #6366f1;
	background: white;
	box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.12);
}

input[type="number"]::placeholder {
	color: #94a3b8;
}

/* =====================================================
   OPERATION BUTTON
===================================================== */
.operation-button {
	width: 100%;
	margin-top: 18px;
	padding: 14px;
	border: none;
	border-radius: 11px;
	background: linear-gradient(135deg, #4f46e5, #6366f1);
	color: white;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.3s;
	box-shadow: 0 8px 18px rgba(79, 70, 229, 0.20);
}

.operation-button:hover {
	transform: translateY(-2px);
	box-shadow: 0 12px 22px rgba(79, 70, 229, 0.28);
}

/* =====================================================
   TRANSACTION CARD
===================================================== */
.transaction-card {
	background: rgba(255, 255, 255, 0.93);
	border-radius: 22px;
	padding: 30px;
	box-shadow: 0 12px 35px rgba(15, 23, 42, 0.07);
	border: 1px solid rgba(226, 232, 240, 0.8);
	margin-bottom: 25px;
}

/* =====================================================
   TRANSACTION HEADER
===================================================== */
.transaction-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.transaction-title {
	display: flex;
	align-items: center;
	gap: 13px;
}

.transaction-icon {
	width: 46px;
	height: 46px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #eef2ff;
	color: #4f46e5;
	border-radius: 12px;
	font-size: 21px;
}

.transaction-header h2 {
	font-size: 20px;
}

.transaction-count {
	color: #64748b;
	font-size: 13px;
}

/* =====================================================
   TABLE
===================================================== */
.table-wrapper {
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	min-width: 650px;
}

thead th {
	background: #f8fafc;
	color: #64748b;
	padding: 14px;
	text-align: left;
	font-size: 12px;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	border-bottom: 1px solid #e2e8f0;
}

tbody td {
	padding: 15px 14px;
	border-bottom: 1px solid #e2e8f0;
	color: #334155;
	font-size: 14px;
}

tbody tr {
	transition: 0.2s;
}

tbody tr:hover {
	background: #f8fafc;
}

/* =====================================================
   TRANSACTION TYPE
===================================================== */
.transaction-type {
	display: inline-block;
	padding: 6px 11px;
	border-radius: 20px;
	background: #eef2ff;
	color: #4f46e5;
	font-size: 12px;
	font-weight: bold;
}

/* =====================================================
   EMPTY TRANSACTION
===================================================== */
.empty {
	text-align: center;
	padding: 40px 20px;
	color: #64748b;
}

.empty-icon {
	font-size: 35px;
	margin-bottom: 10px;
}

/* =====================================================
   BACK BUTTON
===================================================== */
.back-form {
	margin-top: 5px;
}

.back {
	display: inline-block;
	background: #172554;
	color: white;
	padding: 13px 24px;
	border-radius: 11px;
	font-size: 14px;
	font-weight: bold;
	transition: 0.3s;
}

.back:hover {
	background: #1e3a8a;
	transform: translateY(-2px);
}

/* =====================================================
   FOOTER
===================================================== */
.footer {
	text-align: center;
	color: #64748b;
	font-size: 13px;
	margin-top: 35px;
}

/* =====================================================
   TABLET
===================================================== */
@media ( max-width : 800px) {
	.operations {
		grid-template-columns: 1fr;
	}
	.account-top {
		flex-direction: column;
		gap: 20px;
	}
	.balance-box {
		text-align: left;
	}
}

/* =====================================================
   MOBILE
===================================================== */
@media ( max-width : 600px) {
	body {
		padding: 15px 10px 40px;
	}
	.navbar {
		width: 100%;
		padding: 15px 18px;
	}
	.nav-title {
		display: none;
	}
	.page-header h1 {
		font-size: 30px;
	}
	.account-card, .operation-card, .transaction-card {
		padding: 22px;
		border-radius: 18px;
	}
	.account-info {
		grid-template-columns: 1fr;
	}
	.account-number {
		font-size: 20px;
	}
	.balance {
		font-size: 26px;
	}
}
</style>

</head>

<body>

	<div class="container">


		<!-- =================================================
     NAVBAR
================================================= -->

		<div class="navbar">

			<div class="logo">BANKFLOW</div>

			<div class="nav-title">BankFlow Bank Account Management System</div>

		</div>



		<!-- =================================================
     PAGE HEADER
================================================= -->

		<div class="page-header">

			<div class="badge">BankFlow ACCOUNT MANAGEMENT</div>

			<h1>Account Details</h1>

			<p>View account information, manage balance and review
				transaction activity.</p>

		</div>



		<!-- =================================================
     SUCCESS MESSAGE
================================================= -->

		<%
if (request.getAttribute("success") != null) {
%>

		<div class="success">

			<%= request.getAttribute("success") %>

		</div>

		<%
}
%>



		<!-- =================================================
     ERROR MESSAGE
================================================= -->

		<%
if (request.getAttribute("error") != null) {
%>

		<div class="error">

			<%= request.getAttribute("error") %>

		</div>

		<%
}
%>



		<!-- =================================================
     ACCOUNT INFORMATION
================================================= -->

		<%
BankAccount account =
        (BankAccount) request.getAttribute("account");

if (account != null) {

    Customer customer = account.getCustomer();
%>


		<div class="account-card">


			<!-- ACCOUNT TOP -->

			<div class="account-top">


				<div>

					<div class="account-number-label">ACCOUNT NUMBER</div>

					<div class="account-number">

						<%= account.getAccountNumber() %>

					</div>

				</div>


				<div class="balance-box">

					<div class="balance-label">CURRENT BALANCE</div>

					<div class="balance">

						Rs.
						<%= account.getBalance() %>

					</div>

				</div>


			</div>



			<!-- ACCOUNT INFORMATION GRID -->

			<div class="account-info">


				<!-- CUSTOMER -->

				<div class="info-item">

					<span class="info-label"> Customer </span> <span class="info-value">

						<%= customer.getFirstName() + " "
                    + customer.getLastName() %>

					</span>

				</div>


				<!-- EMAIL -->

				<div class="info-item">

					<span class="info-label"> Email </span> <span class="info-value">

						<%= customer.getEmail() %>

					</span>

				</div>


				<!-- PHONE -->

				<div class="info-item">

					<span class="info-label"> Phone Number </span> <span
						class="info-value"> <%= customer.getPhone() %>

					</span>

				</div>


				<!-- STATUS -->

				<div class="info-item">

					<span class="info-label"> Account Status </span> <span
						class="status"> <span class="status-dot"></span> <%= account.getStatus() %>

					</span>

				</div>


			</div>


		</div>


		<%
}
%>



		<!-- =================================================
     DEPOSIT & WITHDRAW
================================================= -->

		<div class="operations">


			<%
    BankAccount accounting =
            (BankAccount) request.getAttribute("account");

    if (accounting != null) {
    %>


			<!-- =================================================
         DEPOSIT
    ================================================= -->

			<div class="operation-card">


				<div class="operation-header">

					<div class="operation-icon">+</div>

					<div>

						<h2>Deposit Money</h2>

						<p>Add funds to this account</p>

					</div>

				</div>


				<form action="deposit" method="post">


					<input type="hidden" name="accountNumber"
						value="<%= accounting.getAccountNumber() %>"> <label>
						Deposit Amount </label> <input type="number" name="balance" step="0.01"
						min="0.01" placeholder="Enter amount" required>


					<button type="submit" class="operation-button">Deposit
						Money →</button>


				</form>


			</div>



			<!-- =================================================
         WITHDRAW
    ================================================= -->

			<div class="operation-card">


				<div class="operation-header">

					<div class="operation-icon">−</div>

					<div>

						<h2>Withdraw Money</h2>

						<p>Withdraw funds from this account</p>

					</div>

				</div>


				<form action="withdraw" method="post">


					<input type="hidden" name="accountNumber"
						value="<%= accounting.getAccountNumber() %>"> <label>
						Withdrawal Amount </label> <input type="number" name="balance" step="0.01"
						min="0.01" placeholder="Enter amount" required>


					<button type="submit" class="operation-button">Withdraw
						Money →</button>


				</form>


			</div>


			<%
    }
    %>


		</div>



		<!-- =================================================
     TRANSACTION HISTORY
================================================= -->

		<div class="transaction-card">


			<div class="transaction-header">


				<div class="transaction-title">

					<div class="transaction-icon">↗</div>

					<div>

						<h2>Transaction Activity</h2>

						<div class="transaction-count">Account transaction history</div>

					</div>

				</div>


			</div>



			<%

    List<Transaction> transactions =
        (List<Transaction>)
        request.getAttribute("transactions");


    if (transactions != null && !transactions.isEmpty()) {

    %>


			<div class="table-wrapper">


				<table>


					<thead>

						<tr>

							<th>ID</th>

							<th>Type</th>

							<th>Amount</th>

							<th>Balance After</th>

							<th>Date</th>

						</tr>

					</thead>


					<tbody>


						<%

            for (Transaction transaction : transactions) {

            %>


						<tr>

							<td><%= transaction.getTransactionId() %></td>


							<td><span class="transaction-type"> <%= transaction.getTransactionType() %>

							</span></td>


							<td>Rs. <%= transaction.getAmount() %>
							</td>


							<td>Rs. <%= transaction.getBalanceAfter() %>
							</td>


							<td><%= transaction.getTransactionDate() %></td>

						</tr>


						<%

            }

            %>


					</tbody>


				</table>


			</div>


			<%

    } else {

    %>


			<div class="empty">

				<div class="empty-icon">📋</div>

				<p>No transactions found for this account.</p>

			</div>


			<%

    }

    %>


		</div>



		<!-- =================================================
     BACK TO HOME
================================================= -->

		<form action="backtohome" method="GET" class="back-form">

			<button type="submit" class="back">← Back to Home</button>

		</form>



		<!-- =================================================
     FOOTER
================================================= -->

		<div class="footer">BankFlow Bank Account Management System 

		</div>


	</div>

</body>

</html>
