# Development Plan for Rainbow Reach App

## **Day 1: Project Setup**

### **Objectives:**

1. Set up the Flutter development environment.
2. Create a scalable project structure.
3. Implement basic navigation and routing.

### **Tasks:**

- Install the Flutter SDK and ensure it works with Android Studio/Xcode.
- Initialize a new Flutter project using:
  ```bash
  flutter create rainbow_reach_app
  ```
- Install dependencies:
  - State Management: `provider` or `riverpod`
  - API Integration: `http`
  - Localization: `intl`, `flutter_localizations`
  - Charts: `fl_chart`
  - Carousel: `carousel_slider`
- Define the folder structure:
  ```
  lib/
  ├── components/     # Reusable widgets (e.g., buttons, cards, forms)
  ├── models/         # Data models (User, NGO, Recommendations, etc.)
  ├── screens/        # Screens (Login, Dashboard, Home, etc.)
  ├── services/       # API and mock data logic
  ├── providers/      # State management (using Provider or Riverpod)
  ├── utils/          # Utility functions (e.g., constants, helpers)
  └── main.dart       # Entry point of the app
  ```
- Implement navigation:
  - Use `go_router` or `Navigator 2.0` for routing.
  - Create placeholders for all screens: Home, Login, User Dashboard, NGO Dashboard.

### **Deliverables:**

- Flutter project initialized with dependencies.
- Placeholder screens navigable using basic routes.

---

## **Day 2: Home Page and Public Views**

### **Objectives:**

1. Design and implement the Home Page.
2. Add static public views like About Us, NGOs Registered, and Insights.

### **Tasks:**

- Build the Home Page layout:
  - Use `BottomNavigationBar` for tabs: About Us, NGOs Registered, Insights.
  - Add a carousel using `carousel_slider` for success stories and milestones.
  - Include CTA buttons (`Join Now`, `Learn More`) with `ElevatedButton`.
- About Us Tab:
  - Add static content for vision, mission, and contact details.
  - Use `ListView` for scrolling.
- NGOs Registered Tab:
  - Display a list of NGOs with mock data (thumbnails, activities, and coverage areas).
  - Use `ListTile` for individual NGO entries.
- Insights Tab:
  - Add static charts with sample statistics (e.g., TG card coverage, job access).
  - Use `fl_chart` for pie/bar charts.

### **Deliverables:**

- Fully functional Home Page with navigation between tabs.
- Static content for About Us, NGOs Registered, and Insights.

---

## **Day 3: Login Flow**

### **Objectives:**

1. Build the login system with OTP validation.
2. Implement role-based navigation for Individual Users and NGO Leaders.

### **Tasks:**

- Design the login screen using `TextFormField` for phone number input and OTP.
- Mock OTP validation using a simple API response with the `http` package.
- Add role selection after login:
  - Individual User → Navigate to User Dashboard.
  - NGO Leader → Navigate to NGO Dashboard.
- Store the user role and authentication status using `Provider` or `Riverpod`.

### **Deliverables:**

- OTP-based login with mock API.
- Role-based navigation to respective dashboards.

---

## **Day 4: User Dashboard**

### **Objectives:**

1. Implement core features of the User Dashboard.
2. Integrate Profile, Recommendations, and Updates tabs with mock data.

### **Tasks:**

- **Profile Tab:**
  - Display user details in a card layout using `ListTile`.
  - Add an edit button with a form to update profile fields.
- **Recommendations Tab:**
  - Fetch and display mock job and training program data using `FutureBuilder`.
  - Add interaction buttons (`Apply`, `Interested`, `Not Interested`).
- **Updates Tab:**
  - Create a social media-style feed with user stories using `ListView`.
  - Include prompts for user progress updates like:
    - "What new skill are you learning?"
    - "What job have you applied for?"

### **Deliverables:**

- Fully functional User Dashboard with mock data and interactivity.

---

## **Day 5: NGO Dashboard**

### **Objectives:**

1. Build the NGO Leader Dashboard with key features.
2. Focus on user management and activity logging.

### **Tasks:**

- **Network Tab:**
  - Display a list of registered users using `ListView.builder`.
  - Expand user profiles using a `ModalBottomSheet`.
- **Activity Tab:**
  - Add a form for logging activities (title, description, photos).
  - Display a list of past activities.
- **Insights Tab:**
  - Use `fl_chart` to visualize demographic data (e.g., age, occupation).
  - Display mock TG card coverage and other statistics.

### **Deliverables:**

- NGO Dashboard with Network, Activities, and Insights tabs.

---

## **Day 6: Multilingual Support and Testing**

### **Objectives:**

1. Add multilingual support.
2. Perform functional and UI testing.

### **Tasks:**

- Integrate `intl` and `flutter_localizations`:
  - Add support for English, Hindi, Kannada, and Bengali.
  - Create `.arb` files for each language.
- Test navigation and flows:
  - Login flow and role-based redirection.
  - Dashboard functionality for both users and NGO leaders.
  - Public tabs (About Us, NGOs Registered, Insights).
- Fix UI bugs and ensure responsiveness across devices.

### **Deliverables:**

- Multilingual support integrated.
- Bugs identified and fixed.

---

## **Day 7: Final Touches and APK Build**

### **Objectives:**

1. Polish the app with animations and accessibility improvements.
2. Build and deliver the APK.

### **Tasks:**

- Add animations:
  - Use `Hero` widgets for transitions.
  - Add subtle animations to buttons and lists.
- Ensure accessibility:
  - Large, clear fonts.
  - Responsive design for different screen sizes.
- Build the APK:
  - Run `flutter build apk`.
  - Test the APK on physical devices and emulators.
- Final Testing:
  - Share the APK for user feedback.

### **Deliverables:**

- Production-ready APK file.

---

### **Post-Launch Recommendations:**

- Integrate a real API for production.
- Add analytics to track user engagement.
- Plan for regular updates based on user feedback.

---

This plan ensures structured development with clear milestones for each day. Let me know if you'd like to begin with the **Day 1 setup** or need further clarification!
