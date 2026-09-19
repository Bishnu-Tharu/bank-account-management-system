<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>BankFlow - Banking Management System</title>

<style>

/* =========================
   GLOBAL
========================= */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	min-height: 100vh;
	background: linear-gradient(135deg, #dbeafe, #ede9fe, #fce7f3);
	color: #1e293b;
	padding-bottom: 70px;
}

a {
	text-decoration: none;
}

/* =========================
   NAVBAR
========================= */
.navbar {
	width: 92%;
	max-width: 1200px;
	margin: 25px auto;
	padding: 18px 25px;
	background: rgba(255, 255, 255, 0.85);
	border-radius: 18px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
	backdrop-filter: blur(10px);
}

.logo {
	font-size: 22px;
	font-weight: bold;
	color: #2563eb;
	letter-spacing: 1px;
}

.nav-text {
	color: #64748b;
	font-size: 14px;
}

/* =========================
   HERO
========================= */
.hero {
	width: 92%;
	max-width: 1200px;
	margin: 30px auto;
	background: rgba(255, 255, 255, 0.86);
	border-radius: 28px;
	padding: 60px;
	display: grid;
	grid-template-columns: 1.1fr 0.9fr;
	gap: 50px;
	align-items: center;
	box-shadow: 0 20px 50px rgba(0, 0, 0, 0.10);
	backdrop-filter: blur(10px);
}

.hero-content {
	padding: 10px;
}

.badge {
	display: inline-block;
	background: #eff6ff;
	color: #2563eb;
	padding: 8px 14px;
	border-radius: 20px;
	font-size: 13px;
	font-weight: bold;
	margin-bottom: 20px;
}

.hero h1 {
	font-size: 50px;
	line-height: 1.15;
	margin-bottom: 20px;
}

.hero h1 span {
	color: #2563eb;
}

.hero-description {
	color: #64748b;
	font-size: 17px;
	line-height: 1.7;
	max-width: 600px;
	margin-bottom: 30px;
}

.button {
	display: inline-block;
	background: #2563eb;
	color: white;
	padding: 15px 30px;
	border-radius: 10px;
	font-size: 16px;
	font-weight: bold;
	transition: 0.3s;
}

.button:hover {
	background: #1d4ed8;
	transform: translateY(-2px);
}

/* =========================
   HERO VISUAL
========================= */
.bank-card {
	background: linear-gradient(135deg, #2563eb, #4f46e5);
	min-height: 280px;
	border-radius: 25px;
	padding: 30px;
	color: white;
	box-shadow: 0 20px 40px rgba(37, 99, 235, 0.25);
	position: relative;
	overflow: hidden;
}

.bank-card::before {
	content: "";
	position: absolute;
	width: 220px;
	height: 220px;
	border-radius: 50%;
	background: rgba(255, 255, 255, 0.10);
	right: -70px;
	top: -70px;
}

.bank-card-title {
	font-size: 14px;
	opacity: 0.85;
}

.bank-card-balance {
	font-size: 34px;
	font-weight: bold;
	margin-top: 55px;
}

.bank-card-number {
	margin-top: 35px;
	font-size: 16px;
	letter-spacing: 2px;
}

/* =========================
   SECTION
========================= */
.section {
	width: 92%;
	max-width: 1200px;
	margin: 60px auto;
}

.section-heading {
	text-align: center;
	margin-bottom: 30px;
}

.section-heading h2 {
	font-size: 32px;
	margin-bottom: 10px;
}

.section-heading p {
	color: #64748b;
	font-size: 15px;
}

/* =========================
   FEATURE GRID
========================= */
.features {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 18px;
}

.feature {
	background: rgba(255, 255, 255, 0.90);
	padding: 25px;
	border-radius: 18px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.07);
	transition: 0.3s;
}

.feature:hover {
	transform: translateY(-6px);
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.10);
}

.icon {
	width: 52px;
	height: 52px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #eff6ff;
	color: #2563eb;
	border-radius: 14px;
	font-size: 23px;
	margin-bottom: 18px;
}

.feature h3 {
	font-size: 17px;
	margin-bottom: 9px;
}

.feature p {
	color: #64748b;
	font-size: 13px;
	line-height: 1.6;
}

/* =========================
   SECURITY SECTION
========================= */
.security-box {
	background: rgba(255, 255, 255, 0.90);
	border-radius: 22px;
	padding: 35px;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.07);
}

.security-item {
	text-align: center;
}

.security-icon {
	font-size: 30px;
	margin-bottom: 12px;
}

.security-item h3 {
	font-size: 16px;
	margin-bottom: 7px;
}

.security-item p {
	color: #64748b;
	font-size: 13px;
	line-height: 1.5;
}

/* =========================
   MANAGEMENT
========================= */
.management-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}

.management-card {
	background: rgba(255, 255, 255, 0.90);
	padding: 28px;
	border-radius: 18px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.07);
	transition: 0.3s;
}

.management-card:hover {
	transform: translateY(-5px);
}

.management-card h3 {
	margin-bottom: 10px;
	font-size: 18px;
}

.management-card p {
	color: #64748b;
	font-size: 14px;
	line-height: 1.6;
}

/* =========================
   MODERN FEATURES
========================= */
.modern-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}

.modern-card {
	background: rgba(255, 255, 255, 0.90);
	padding: 28px;
	border-radius: 18px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.07);
	transition: 0.3s;
}

.modern-card:hover {
	transform: translateY(-5px);
}

.modern-number {
	color: #2563eb;
	font-size: 13px;
	font-weight: bold;
	margin-bottom: 12px;
}

.modern-card h3 {
	font-size: 18px;
	margin-bottom: 10px;
}

.modern-card p {
	color: #64748b;
	font-size: 14px;
	line-height: 1.6;
}

/* =========================
   CTA
========================= */
.cta {
	width: 92%;
	max-width: 1200px;
	margin: 60px auto;
	background: linear-gradient(135deg, #2563eb, #4f46e5);
	color: white;
	padding: 45px;
	border-radius: 25px;
	text-align: center;
	box-shadow: 0 20px 40px rgba(37, 99, 235, 0.20);
}

.cta h2 {
	font-size: 30px;
	margin-bottom: 12px;
}

.cta p {
	opacity: 0.9;
	margin-bottom: 25px;
}

.cta-button {
	display: inline-block;
	background: white;
	color: #2563eb;
	padding: 13px 28px;
	border-radius: 10px;
	font-weight: bold;
	transition: 0.3s;
}

.cta-button:hover {
	transform: translateY(-2px);
}

/* =========================
   FOOTER
========================= */
.footer {
	text-align: center;
	color: #64748b;
	font-size: 13px;
	margin-top: 40px;
}

/* =========================
   RESPONSIVE
========================= */
@media ( max-width : 1000px) {
	.hero {
		grid-template-columns: 1fr;
		padding: 40px;
	}
	.features {
		grid-template-columns: repeat(2, 1fr);
	}
	.security-box {
		grid-template-columns: repeat(2, 1fr);
	}
	.management-grid {
		grid-template-columns: repeat(2, 1fr);
	}
	.modern-grid {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 600px) {
	.navbar {
		width: 94%;
	}
	.hero {
		width: 94%;
		padding: 25px;
	}
	.hero h1 {
		font-size: 36px;
	}
	.hero-description {
		font-size: 15px;
	}
	.features {
		grid-template-columns: 1fr;
	}
	.security-box {
		grid-template-columns: 1fr;
	}
	.management-grid {
		grid-template-columns: 1fr;
	}
	.modern-grid {
		grid-template-columns: 1fr;
	}
	.section {
		width: 94%;
	}
	.cta {
		width: 94%;
		padding: 35px 20px;
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

		<div class="nav-text">Bank Account Management System</div>

	</div>

	<!-- =========================
     HERO SECTION
========================= -->

	<div class="hero">

		<div class="hero-content">

			<div class="badge">MODERN BANKING MANAGEMENT</div>

			<h1>
				BankFlow <span>Banking</span> Management
			</h1>

			<p class="hero-description">Manage bank accounts, deposits,
				withdrawals and transaction history from one BankFlow banking
				management system.</p>

			<!-- EXISTING ACCESS - UNCHANGED -->

			<a href="index" class="button"> Get Started → </a>

		</div>


		<!-- BANK CARD VISUAL -->

		<div class="bank-card">

			<div class="bank-card-title">BANKFLOW ACCOUNT</div>

			<div class="bank-card-balance">Account Overview</div>

			<div class="bank-card-number">•••• &nbsp; •••• &nbsp; ••••
				&nbsp; BANK</div>

		</div>

	</div>

	<!-- =========================
     CORE FEATURES
========================= -->

	<div class="section">


		<div class="section-heading">

			<h2>Core Banking Features</h2>

			<p>Everything needed for BankFlow bank account management.</p>

		</div>


		<div class="features">


			<div class="feature">

				<div class="icon">$</div>

				<h3>Account Management</h3>

				<p>Create and manage customer bank accounts easily.</p>

			</div>


			<div class="feature">

				<div class="icon">+</div>

				<h3>Easy Deposits</h3>

				<p>Deposit money and automatically update the account balance.</p>

			</div>


			<div class="feature">

				<div class="icon">−</div>

				<h3>Quick Withdrawals</h3>

				<p>Withdraw funds while checking the available account balance.
				</p>

			</div>


			<div class="feature">

				<div class="icon">↗</div>

				<h3>Transaction History</h3>

				<p>View deposits and withdrawals with updated balances.</p>

			</div>


			<div class="feature">

				<div class="icon">👤</div>

				<h3>Customer Management</h3>

				<p>Manage customer profiles and account information in one
					place.</p>

			</div>


			<div class="feature">

				<div class="icon">💰</div>

				<h3>Real-Time Balance</h3>

				<p>View the latest available account balance quickly.</p>

			</div>


			<div class="feature">

				<div class="icon">⇄</div>

				<h3>Fund Transfer</h3>

				<p>Transfer funds between supported bank accounts.</p>

			</div>


			<div class="feature">

				<div class="icon">📄</div>

				<h3>Account Statement</h3>

				<p>View account activity and transaction details.</p>

			</div>


		</div>

	</div>

	<!-- =========================
     MODERN FEATURES
========================= -->

	<div class="section">


		<div class="section-heading">

			<h2>Modern Banking Features</h2>

			<p>Designed for a clean and organized banking experience.</p>

		</div>


		<div class="modern-grid">


			<div class="modern-card">

				<div class="modern-number">01</div>

				<h3>Instant Transaction Updates</h3>

				<p>Keep account information updated after every banking
					transaction.</p>

			</div>


			<div class="modern-card">

				<div class="modern-number">02</div>

				<h3>Transaction Search</h3>

				<p>Quickly search and filter transaction records using available
					account information.</p>

			</div>


			<div class="modern-card">

				<div class="modern-number">03</div>

				<h3>Transaction Reference</h3>

				<p>Identify individual transactions using unique transaction
					reference information.</p>

			</div>


			<div class="modern-card">

				<div class="modern-number">04</div>

				<h3>Account Activity</h3>

				<p>Monitor recent deposits, withdrawals and account activities
					from one place.</p>

			</div>


			<div class="modern-card">

				<div class="modern-number">05</div>

				<h3>Balance Summary</h3>

				<p>Get a quick overview of account balances and transaction
					activities.</p>

			</div>


			<div class="modern-card">

				<div class="modern-number">06</div>

				<h3>Dashboard Analytics</h3>

				<p>Present important banking information in a simple and
					organized dashboard.</p>

			</div>


		</div>

	</div>

	<!-- =========================
     SECURITY
========================= -->

	<div class="section">

		<div class="section-heading">

			<h2>Security & Control</h2>

			<p>Features for organized and controlled banking management.</p>

		</div>


		<div class="security-box">


			<div class="security-item">

				<div class="security-icon">🔒</div>

				<h3>Secure Account Access</h3>

				<p>Protect access to account information.</p>

			</div>


			<div class="security-item">

				<div class="security-icon">🛡</div>

				<h3>Transaction Validation</h3>

				<p>Validate transactions before processing.</p>

			</div>


			<div class="security-item">

				<div class="security-icon">👥</div>

				<h3>Role-Based Access</h3>

				<p>Support different levels of system access.</p>

			</div>


			<div class="security-item">

				<div class="security-icon">🔎</div>

				<h3>Activity Monitoring</h3>

				<p>Keep track of important account activities.</p>

			</div>


		</div>


	</div>

	<!-- =========================
     MANAGEMENT
========================= -->

	<div class="section">


		<div class="section-heading">

			<h2>Management Tools</h2>

			<p>Organize customers, accounts and banking information.</p>

		</div>


		<div class="management-grid">


			<div class="management-card">

				<h3>Customer Management</h3>

				<p>Manage customer details and associated bank account
					information from a centralized system.</p>

			</div>


			<div class="management-card">

				<h3>Account Status</h3>

				<p>Monitor account status and maintain organized account
					information.</p>

			</div>


			<div class="management-card">

				<h3>Transaction Reports</h3>

				<p>Display useful summaries of deposits, withdrawals and other
					account activities.</p>

			</div>


			<div class="management-card">

				<h3>Search & Filter</h3>

				<p>Find customers, accounts and transaction information quickly.
				</p>

			</div>


			<div class="management-card">

				<h3>Data Management</h3>

				<p>Keep banking information structured and organized.</p>

			</div>


			<div class="management-card">

				<h3>Account Statements</h3>

				<p>Review account transactions and balance changes in a
					structured format.</p>

			</div>


		</div>

	</div>

	<!-- =========================
     CALL TO ACTION
========================= -->

	<div class="cta">


		<h2>Manage Your Banking System Easily</h2>

		<p>Access account management and banking operations from one
			place.</p>

		<!-- EXISTING ACCESS - UNCHANGED -->

		<a href="index" class="cta-button"> Get Started → </a>

	</div>

	<!-- =========================
     FOOTER
========================= -->

	<div class="footer">Bank Account Management System </div>

</body>

</html>
