# Instagram Clone App

This is a **mobile application** built using **Flutter**, simulating core features of Instagram. It provides functionalities such as user authentication, posting images, following/unfollowing users, and viewing profiles.

---

## Features

- User Signup and Login with Firebase Authentication  
- Store and fetch user profiles and posts using **Cloud Firestore**  
- Follow and unfollow users, with real-time updates  
- View profile information including username, bio, followers, following, and posts  
- Upload images and create posts using Cloud Firestore integration  
- Responsive layout for mobile devices  

---

## Technologies Used

- **Flutter** – UI development framework  
- **Firebase Authentication** – User signup and login management  
- **Cloud Firestore** – Real-time NoSQL database for user data and posts  
- **Provider** – State management  
- **Cloudinary** – Image uploads  
- Dart programming language

---

## Project Structure

- Authentication methods handled in `auth_methods.dart`  
- Firestore interactions handled in `firestore_methods.dart`  
- User data modeled in `user.dart` and managed using `user_provider.dart`  
- Screens include `login_screen.dart`, `signup_screen.dart`, `profile_screen.dart`, etc.  
- Responsive layout is implemented but currently only supports mobile

---

## 📌 Notes

- The web version of the app is still under development and currently only displays placeholder content.  
- Editing profile details such as username, bio, and profile picture is not available in this version. 
