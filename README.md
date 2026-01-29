Incubyte Salary Management Kata (Flutter)
📱 Overview

This project is a Flutter implementation of the Incubyte Salary Management Kata, developed as part of the engineering hiring process.

The application provides a complete Employee Management System with full CRUD functionality, persistent storage using SQLite, a clean layered architecture, and a responsive UI built with Flutter.

The codebase follows Test-Driven Development (TDD) practices and reflects a production-ready approach to application design, testing, and maintainability.

✨ Features

Create, Read, Update, and Delete employees

Persistent local storage using SQLite

Employee fields:

Full Name

Job Title

Country

Salary

Employee list displayed as cards

Edit and delete actions per employee

Add employee via modal form

Error handling and loading states

Clean, scalable architecture

🧱 Architecture

The project follows a feature-based layered architecture, as required.

lib/
├── features/
│   └── app/
│       ├── core/
│       │   └── router/
│       ├── data/
│       │   ├── models/
│       │   ├── services/
│       │   └── repositories/
│       └── presentation/
│           ├── state/
│           └── ui/
└── main.dart


Layers
Data Layer

Models: Pure Dart models

Services: SQLite database access

Repository: Single source of truth for data operations

Presentation Layer

State Management: Manages UI state and business logic

UI: Flutter widgets that consume state only

Implementation Flow
Models → Services → Repository → State Management → UI


This flow is strictly followed across all features.

🧪 Testing (TDD)

This project was built using Test-Driven Development (TDD).

TDD Workflow

Write a failing test (Red)

Implement the minimum code to pass (Green)

Refactor while keeping tests green

Tests Included

Model tests

Repository tests

State management tests

SQLite service tests (isolated & deterministic)

The commit history reflects the red → green → refactor cycle with incremental commits.

🤖 AI Usage & Implementation Details

AI tools were intentionally used to improve development speed while maintaining code quality.

How AI Was Used

Scaffolding initial folder structure

Generating boilerplate code for:

Models

SQLite services

Repositories

State management

Drafting unit test cases

Architectural guidance and best practices

Error handling and edge-case validation

Human Oversight

All AI-generated code was:

Reviewed

Refactored

Aligned with TDD principles

Adapted to project requirements

AI was used as a productivity tool, not as a replacement for engineering judgment.

I have attached my chat history please check

link -> https://chatgpt.com/share/697b9b4f-f16c-8000-9904-4c1c25da00ef

🖼️ Screenshots

Add screenshots inside a /screenshots folder and reference them here.

link -> https://drive.google.com/drive/folders/10jwWK_lPBp8FaWE5MyNm9NQDqnCg0f8N?usp=drive_link

	
	
🚀 Getting Started
Prerequisites

Flutter SDK

Dart

Android Studio / VS Code

Run the App
flutter pub get
flutter run

Run Tests
flutter test

🛠️ Tech Stack

Flutter

Dart

SQLite (sqflite)

Provider / ChangeNotifier (state management)

Path package

Flutter Test

📌 Notes

The application is fully offline-first.

Database versioning is supported.

The architecture is scalable and easy to extend.

Code style and structure follow production best practices.