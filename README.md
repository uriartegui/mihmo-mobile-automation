📱 miHmo Mobile Automation

Automated mobile testing project using Robot Framework + Appium for the miHmo Android application.

🚀 Technologies Used

Python

Robot Framework

Appium

AppiumLibrary

Android (UiAutomator2)

📂 Project Structure
miHmo/
│
├── resources/
│   └── keywords.robot
│
├── tests/
│   └── login_tests.robot
│
├── requirements.txt
└── README.md

⚙️ Setup Instructions
1️⃣ Install Python dependencies
python -m pip install -r requirements.txt

2️⃣ Start Appium server
appium

3️⃣ Connect Android device
adb devices

▶️ How To Run Tests

Run the full test suite:

python -m robot tests


The test will:

Open the app

Ask for CPF and password (popup)

Perform login

Handle optional screens

Validate successful login

Close the app

🔐 Login Flow

The automated login flow works as follows:

Open App
Starts the mobile application.

Click Login Button
Navigates to the login screen.

Ask For Credentials
Opens a popup requesting CPF and password before the test begins.

Login With Credentials
Fills CPF and password fields and performs login.

Handle Daily Feeling Screen
Handles the optional "Daily Feeling" screen that may appear after login.

Close App
Closes the application after validation.

🧠 Smart Handling

The automation includes:

Automatic permission handling

Optional screen handling (Daily Feeling)

Optional tutorial modal handling

Dynamic validation of the Home screen

No hardcoded user credentials

🏁 Login Validation

Successful login is validated by checking the presence of:

"Olá" (Welcome message)


The validation ignores:

Current date

Logged user name

Account variations

This makes the test stable and reusable.

🛠 Best Practices Used

Explicit waits (no unnecessary sleeps)

Dynamic locators

Optional screen detection

Clean keyword structure

Reusable login flow

📌 Notes

Credentials are requested before the test starts.

The automation waits for user input before proceeding.

The project is designed for manual-triggered automated execution.

Suitable for local execution and dedicated test machines.

👨‍💻 Author

QA Mobile Automation Project
Built using Robot Framework + Appium.