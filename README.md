# Tickr

Tickr is a simple and elegant task management application for iOS built entirely with SwiftUI and SwiftData. It demonstrates a modern approach to iOS development, focusing on a clean architecture and a great user experience.

## Features

-   **Create, Read, Update, and Delete (CRUD) Tasks:** Easily manage your to-do list with full CRUD functionality.
-   **SwiftData Integration:** Utilizes Apple's SwiftData framework for robust and efficient local data persistence.
-   **Clean Architecture:** Built using the MVVM-C (Model-View-ViewModel-Coordinator) pattern for clear separation of concerns and scalability.
-   **Modern SwiftUI Views:** A fully declarative UI built with SwiftUI.
-   **Haptic Feedback:** Custom `HapticButton` and `HapticManager` enhance user interactions with tactile feedback.
-   **Custom UI Components:** Reusable view modifiers and components for a consistent and clean design.

## Project Structure

The project is organized using a feature-based architecture, promoting modularity and maintainability.

```
Tickr/
├── App/                # Main application entry point
├── Coordinator/        # Handles navigation and view routing (MVVM-C)
├── Core/               # Shared utilities, extensions, and UI components
│   ├── Components/
│   ├── Extensions/
│   └── Utils/
├── Data/               # Data layer including Models and Services
│   ├── Models/         # SwiftData models (e.g., TaskItem)
│   └── Services/       # Service layer to interact with SwiftData
└── Features/           # Individual feature modules
    └── Tasks/          # The main task management feature
        ├── TaskViewModel.swift
        └── Views/      # SwiftUI views for the Tasks feature
```

## Architecture: MVVM-C

Tickr is built using the **Model-View-ViewModel-Coordinator** pattern.

-   **Model (`TaskItem.swift`):** Represents the data structure of a task, defined as a SwiftData `@Model`.
-   **View (`TaskListView`, `AddTaskView`, etc.):** The SwiftUI views that make up the user interface. They are lightweight and primarily responsible for presenting the data from the ViewModel.
-   **ViewModel (`TaskViewModel.swift`):** Manages the state and business logic for the views. It communicates with the `TaskService` to fetch and manipulate data.
-   **Coordinator (`Coordinator.swift`):** Manages the navigation flow of the application. It creates and presents views, decoupling them from one another.

## Core Components

-   **`TaskService.swift`:** An actor that abstracts all SwiftData operations (fetch, add, update, delete), ensuring that data logic is centralized and can be easily managed.
-   **`Coordinator.swift`:** A central router that uses `NavigationPath` to manage the app's navigation stack, making it easy to push and pop views.
-   **`HapticButton.swift`:** A custom wrapper around the standard SwiftUI `Button` that provides haptic feedback upon interaction, improving the user experience.
-   **View Modifiers (`ViewModifier+Extension.swift`):** Custom view modifiers like `actionButtonStyle` and `cardTextFieldStyle` are used to apply consistent styling across the application.

## Getting Started

To run the project locally, follow these steps:

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/hatk0/Tickr.git
    ```
2.  **Open the project:**
    Navigate to the cloned directory and open `Tickr.xcodeproj` in Xcode.

3.  **Build and Run:**
    Select a simulator or a physical device (running iOS 17.0 or later) and run the project.

## Requirements

-   Xcode 15.0 or later
-   iOS 17.0 or later
