#Flutter Clean Architecture App with Node.js Backend
This project demonstrates a Flutter application following Clean Architecture principles, SOLID design guidelines, and BLoC state management. The backend is developed in Node.js and temporarily deployed on the Render platform.

Features
Get All Beneficiaries: Fetch a list of beneficiaries from the backend.
Add Beneficiary: Add a new beneficiary to the backend.
Perform Top-up: Perform a top-up operation for a selected beneficiary.
Project Structure
This application adheres to Clean Architecture to ensure scalability, testability, and maintainability.

Folder Structure
bash
Copy code
lib/
├── core/
│   ├── domain/         # Core business entities and interfaces
│   ├── infrastructure/ # Shared services like API, database connections, etc.
│   └── di/             # Dependency injection (e.g., GetIt)
├── feature/
│   ├── beneficiary/    # Beneficiary feature (presentation, domain, data layers)
│   ├── topup/          # Top-up feature (presentation, domain, data layers)
│   └── user/           # User feature (presentation, domain, data layers)

Technology Stack
Frontend
Flutter: Cross-platform UI framework.
BLoC State Management: Decoupled UI logic with streams for reactivity.
Clean Architecture: Divides application layers for better testability and scalability.
Backend
Node.js: Backend runtime for handling API requests.
Render Platform: Temporary deployment for backend services.
API Endpoints lisAllBeneficiaries , addBeneficiary , performTopUp
Base URL: https://fwallet-s78e.onrender.com

Description: Performs a top-up for the selected beneficiary.
BLoC State Management
Implementation Overview
Each feature is managed by a dedicated BLoC for state management:

BeneficiaryBloc: Handles events like fetching beneficiaries or adding a new one.
TopUpBloc: Manages top-up logic and interactions with the backend.
UserBloc: Deals with user-specific operations.
Common States
Loading: Indicates an ongoing operation.
Error: Handles failures with error messages.
Success: Emits data upon successful operations.
Event-to-State Workflow
Event: User actions or triggers (e.g., button clicks).
State: UI updates based on the current BLoC state.
How to Run the Project
Prerequisites
Install Flutter and ensure it's set up correctly.
Install Node.js (for running the backend locally if needed).
Backend Setup
Clone the Node.js backend repository: https://github.com/subair71/fwallet.git
bash
git clone 
cd backend
npm install
Start the server:
bash
Copy code
npm start
The server will run on http://localhost:3000 (or your configured port).
Frontend Setup
Clone this repository:
bash
Copy code
git clone 
cd flutter_app
Install dependencies:
bash
Copy code
flutter pub get
Run the app:
bash
Copy code
flutter run
Deployment
Backend
The backend is deployed temporarily on the Render platform. Configure the backend's base URL in your Flutter app to point to the Render deployment.

Frontend
You can deploy the Flutter app to Android, iOS, or Web platforms.
