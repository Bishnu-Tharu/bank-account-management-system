<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>BankFlow - Bank Account Management</title>

<style>

/* =========================
   RESET
========================= */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* =========================
   BODY
========================= */
body {
	font-family: Arial, sans-serif;
	min-height: 100vh;
	background: radial-gradient(circle at top left, #dbeafe, transparent 35%),
		radial-gradient(circle at bottom right, #f3e8ff, transparent 35%),
		linear-gradient(135deg, #f8fafc, #eef2ff);
	color: #172554;
	padding-bottom: 50px;
}

/* =========================
   NAVBAR
========================= */
.navbar {
	width: 92%;
	max-width: 1100px;
	margin: 25px auto;
	padding: 18px 25px;
	background: rgba(255, 255, 255, 0.88);
	border: 1px solid rgba(255, 255, 255, 0.7);
	border-radius: 18px;
	display: flex;
	align-items: center;
	justify-content: space-between;
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
	font-size: 14px;
	color: #64748b;
}

/* =========================
   MAIN CONTAINER
========================= */
.container {
	width: 92%;
	max-width: 1100px;
	margin: auto;
}

/* =========================
   HERO
========================= */
.hero {
	text-align: center;
	padding: 45px 20px 35px;
}

.badge {
	display: inline-block;
	padding: 8px 15px;
	border-radius: 30px;
	background: #eef2ff;
	color: #4f46e5;
	font-size: 13px;
	font-weight: bold;
	margin-bottom: 18px;
}

.hero h1 {
	font-size: 44px;
	line-height: 1.2;
	margin-bottom: 15px;
	color: #172554;
}

.hero h1 span {
	color: #4f46e5;
}

.hero p {
	max-width: 650px;
	margin: auto;
	color: #64748b;
	font-size: 17px;
	line-height: 1.7;
}

/* =========================
   MESSAGE
========================= */
.message {
	max-width: 850px;
	margin: 0 auto 25px;
}

.success {
	background: #dcfce7;
	color: #166534;
	padding: 15px;
	border-radius: 12px;
	text-align: center;
	font-weight: bold;
	border: 1px solid #bbf7d0;
}

.error {
	background: #fee2e2;
	color: #991b1b;
	padding: 15px;
	border-radius: 12px;
	text-align: center;
	font-weight: bold;
	border: 1px solid #fecaca;
}

/* =========================
   FORM GRID
========================= */
.form-grid {
	display: grid;
	grid-template-columns: 1.3fr 0.7fr;
	gap: 25px;
	align-items: stretch;
}

/* =========================
   CARD
========================= */
.card {
	background: rgba(255, 255, 255, 0.92);
	padding: 32px;
	border-radius: 22px;
	border: 1px solid rgba(226, 232, 240, 0.8);
	box-shadow: 0 15px 40px rgba(15, 23, 42, 0.08);
	transition: 0.3s;
}

.card:hover {
	transform: translateY(-3px);
	box-shadow: 0 20px 45px rgba(15, 23, 42, 0.11);
}

/* =========================
   CARD HEADER
========================= */
.card-header {
	display: flex;
	align-items: center;
	gap: 15px;
	margin-bottom: 25px;
}

.card-icon {
	width: 52px;
	height: 52px;
	border-radius: 14px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #eef2ff;
	color: #4f46e5;
	font-size: 24px;
}

.card-title h2 {
	font-size: 21px;
	margin-bottom: 5px;
}

.card-title p {
	color: #64748b;
	font-size: 13px;
}

/* =========================
   FORM
========================= */
.form-row {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 15px;
}

.form-group {
	margin-bottom: 17px;
}

label {
	display: block;
	margin-bottom: 7px;
	font-weight: bold;
	color: #334155;
	font-size: 14px;
}

input {
	width: 100%;
	padding: 13px 15px;
	border: 1px solid #cbd5e1;
	border-radius: 11px;
	font-size: 15px;
	outline: none;
	background: #f8fafc;
	transition: 0.2s;
}

input:focus {
	border-color: #6366f1;
	background: white;
	box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.12);
}

input::placeholder {
	color: #94a3b8;
}

/* =========================
   BUTTON
========================= */
button {
	width: 100%;
	margin-top: 8px;
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

button:hover {
	transform: translateY(-2px);
	box-shadow: 0 12px 22px rgba(79, 70, 229, 0.28);
}

/* =========================
   SEARCH CARD
========================= */
.search-card {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.search-info {
	background: #f8fafc;
	border-radius: 14px;
	padding: 18px;
	margin-bottom: 20px;
	border: 1px solid #e2e8f0;
}

.search-info-title {
	font-size: 13px;
	font-weight: bold;
	color: #4f46e5;
	margin-bottom: 7px;
}

.search-info p {
	color: #64748b;
	font-size: 13px;
	line-height: 1.5;
}

/* =========================
   QUICK FEATURES
========================= */
.quick-features {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 18px;
	margin-top: 25px;
}

.quick-card {
	background: rgba(255, 255, 255, 0.82);
	padding: 22px;
	border-radius: 17px;
	text-align: center;
	border: 1px solid rgba(226, 232, 240, 0.8);
	box-shadow: 0 8px 25px rgba(15, 23, 42, 0.06);
}

.quick-icon {
	width: 45px;
	height: 45px;
	margin: 0 auto 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 12px;
	background: #eef2ff;
	color: #4f46e5;
	font-size: 20px;
}

.quick-card h3 {
	font-size: 15px;
	margin-bottom: 6px;
}

.quick-card p {
	color: #64748b;
	font-size: 12px;
	line-height: 1.5;
}

/* =========================
   BOTTOM INFO
========================= */
.info-banner {
	margin-top: 25px;
	padding: 20px;
	background: linear-gradient(135deg, #eef2ff, #f5f3ff);
	border-radius: 16px;
	display: flex;
	justify-content: center;
	gap: 35px;
	flex-wrap: wrap;
	color: #475569;
	font-size: 13px;
}

.info-item {
	display: flex;
	align-items: center;
	gap: 7px;
}

.info-item span {
	color: #4f46e5;
	font-weight: bold;
}

/* =========================
   FOOTER
========================= */
.footer {
	text-align: center;
	color: #64748b;
	font-size: 13px;
	margin-top: 35px;
}

/* =========================
   TABLET
========================= */
@media ( max-width : 850px) {
	.form-grid {
		grid-template-columns: 1fr;
	}
	.hero h1 {
		font-size: 38px;
	}
}

/* =========================
   MOBILE
========================= */
@media ( max-width : 600px) {
	body {
		padding: 10px 0 40px;
	}
	.navbar {
		width: 94%;
		padding: 15px 18px;
	}
	.nav-title {
		display: none;
	}
	.container {
		width: 94%;
	}
	.hero {
		padding: 30px 10px;
	}
	.hero h1 {
		font-size: 31px;
	}
	.hero p {
		font-size: 15px;
	}
	.card {
		padding: 23px;
	}
	.form-row {
		grid-template-columns: 1fr;
		gap: 0;
	}
	.quick-features {
		grid-template-columns: 1fr;
	}
	.info-banner {
		gap: 15px;
		flex-direction: column;
		align-items: center;
	}
}
</style>

</head>

<body>

	<!-- =========================
     NAVBAR
========================= -->

	<div class="navbar">


		<div class="logo">BANKFLOW</div>

		<div class="nav-title">BankFlow Bank Account Management System</div>


	</div>

	<!-- =========================
     MAIN CONTAINER
========================= -->

	<div class="container">


		<!-- =========================
     HERO
========================= -->

		<div class="hero">

			<div class="badge">BankFlow BANKING SYSTEM</div>

			<h1>
				BankFlow <span>Banking</span> Management
			</h1>

			<p>Create customer accounts, find existing accounts and manage
				banking information through BankFlow management system.</p>

		</div>



		<!-- =========================
     SUCCESS / ERROR MESSAGE
========================= -->

		<div class="message">

			<%
			if (request.getAttribute("success") != null) {
			%>

			<div class="success">
				<%=request.getAttribute("success")%>
			</div>

			<%
			}
			%>


			<%
			if (request.getAttribute("error") != null) {
			%>

			<div class="error">
				<%=request.getAttribute("error")%>
			</div>

			<%
			}
			%>

		</div>



		<!-- =========================
     ACCOUNT FORMS
========================= -->

		<div class="form-grid">


			<!-- =========================
         CREATE ACCOUNT
    ========================= -->

			<div class="card">

				<div class="card-header">

					<div class="card-icon">+</div>

					<div class="card-title">

						<span style="color: red; font-weight: bold;"> ⚠ Feature
							Under Development </span> <br>
						<span style="color: #6c757d ; font-weight: bold;">
							This functionality is not yet complete and may cause unexpected
							errors. </span> <br><br>

						<h2>Create Account</h2>
						<p>Create a new customer bank account</p>

					</div>

				</div>


				<form action="createAccount" method="post">


					<div class="form-row">

						<div class="form-group">

							<label> First Name </label> <input type="text" name="firstName"
								placeholder="Enter first name" required>

						</div>


						<div class="form-group">

							<label> Last Name </label> <input type="text" name="lastName"
								placeholder="Enter last name" required>

						</div>

					</div>


					<div class="form-group">

						<label> Email </label> <input type="email" name="email"
							placeholder="Enter email address" required>

					</div>


					<div class="form-group">

						<label> Phone </label> <input type="text" name="phone"
							placeholder="Enter phone number" required>

					</div>


					<button type="submit">Create Account →</button>

				</form>

			</div>



			<!-- =========================
         FIND ACCOUNT
    ========================= -->

			<div class="card search-card">

				<div>

					<div class="card-header">

						<div class="card-icon">🔍</div>

						<div class="card-title">

							<h2>Find Account</h2>

							<p>Search an existing bank account</p>

						</div>

					</div>


					<div class="search-info">

						<div class="search-info-title">ACCOUNT SEARCH</div>

						<p>Enter the account number to view the associated account
							information.</p>

					</div>


					<form action="searchAccount" method="post">

						<div class="form-group">

							<label> Account Number </label> <input type="text"
								name="accountNumber" placeholder="ACC..." required>

						</div>


						<button type="submit">Find Account →</button>

					</form>

				</div>

			</div>


		</div>



		<!-- =========================
     QUICK FEATURES
========================= -->

		<div class="quick-features">


			<div class="quick-card">

				<div class="quick-icon">✓</div>

				<h3>Easy Management</h3>

				<p>Manage customer account information from one place.</p>

			</div>


			<div class="quick-card">

				<div class="quick-icon">🔍</div>

				<h3>Fast Search</h3>

				<p>Find an existing account using its account number.</p>

			</div>


			<div class="quick-card">

				<div class="quick-icon">🔒</div>

				<h3>Secure System</h3>

				<p>Keep account information organized within the system.</p>

			</div>


		</div>



		<!-- =========================
     INFORMATION BANNER
========================= -->

		<div class="info-banner">

			<div class="info-item">
				<span>✓</span> Account Management
			</div>

			<div class="info-item">
				<span>✓</span> Customer Records
			</div>

			<div class="info-item">
				<span>✓</span> Account Search
			</div>

			<div class="info-item">
				<span>✓</span> Spring MVC
			</div>

		</div>



		<!-- =========================
     FOOTER
========================= -->

		<div class="footer">BankFlow Bank Account Management System</div>


	</div>

</body>

</html>
