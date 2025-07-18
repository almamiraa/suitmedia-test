# Suitmedia Testcase 2025 - Mobile App Developer

| Nama              | NRP        | University |
| ----------------- | ---------- | ---------- |
| Alma Amira Dewani | 5027221054 | ITS        |

A simple Flutter application that demonstrates:

- Palindrome checker
- Welcome screen with username input
- User selection from an API (ReqRes.in) with infinite scroll and pull-to-refresh
- Clean UI based on Figma wireframes

---

## ✨ Features

1. **🔁 Home Screen (Palindrome Checker)**

   - User inputs a word.
   - App checks whether it’s a palindrome.
   - Displays a top notification if the input is empty or to show the result.

2. **🏠 Home Screen (Username Input)**

   - User is prompted to enter their name upon opening the app.
   - Cannot proceed without entering a name (input is validated).
   - A pop-up alert appears if the input is empty when submitting.
   - Once a name is entered, the user is navigated to the Welcome screen.

3. **👋 Welcome Screen**

   - Displays a welcome message along with the user's name.
   - Includes a button to proceed to the User Selection screen.

4. **👤 User Selection Screen**
   - Fetches user list from ReqRes API.
   - Uses infinite scroll (`page`, `per_page` support).
   - Pull-to-refresh functionality.
   - Displays empty state if no users are returned.
   - Clean and minimal layout displaying user avatar, name, and email

---

## 📸 Screenshots

### Home Screen 📱

 <p align="center">
  <img src="/assets/readme/home.jpg" alt="home" width="30%" style="margin: 10px;" />
</p>

### Palindrome Checker ☑️

<p align="center">
  <img src="/assets/readme/input-pali.jpg" alt="Input Palindrome" width="30%" />
  <img src="/assets/readme/cek-pali.jpg" alt="Cek Palindrome" width="30%" style="margin: 0 10px;" />
  <img src="/assets/readme/warn1.jpg" alt="Warning" width="30%" />
</p>

### Welcome Screen 💻

<p align="center">
  <img src="/assets/readme/input-name.jpg" alt="Input name" width="22%" style="margin:5px;" />
  <img src="/assets/readme/second1.jpg" alt="Cek name" width="22%" style="margin:5px;" />
  <img src="/assets/readme/second2.jpg" alt="Result" width="22%" style="margin:5px;" />
  <img src="/assets/readme/warn2.jpg" alt="Warning" width="22%" style="margin:5px;" />
</p>

### User List 👥

<p align="center">
  <img src="/assets/readme/third.jpg" alt="third screen" width="45%" style="margin-right:10px;" />
  <img src="/assets/readme/no-users.jpg" alt="no users" width="45%" />
</p>

---

## 🛠️ Tech Stack

- **Flutter** (State management using `Provider`)
- **Dart**
- `http` for API calls
- `cached_network_image` for avatar caching
- Custom UI widgets for modularity

---

## 🚀 Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/almamiraa/suitmedia-test.git
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the App

```bash
flutter run
```
