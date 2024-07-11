# Places App

## Overview

The Places App is a sample application, using a list of locations to open the wikipedia app with a deeplink and demonstrating best practices for building robust and maintainable iOS apps using MVVM (Model-View-ViewModel) architecture and a layered repository pattern.

## Architecture

### MVVM (Model-View-ViewModel)

- **Model:** Represents the data of the application which in this case is our repository setup.
- **View:** Responsible for displaying the data and interacting with the user.
- **ViewModel:** Acts as an intermediary between the Model and the View, preparing and transforming data for display and handling user interactions.

### Repository Pattern

The repository pattern provides an abstraction layer over data sources, making it easier to switch between different data access implementations (e.g., network, database) without affecting the rest of the application.

The repository in this app is composed of four separate packages:

1. **Models:** Defines protocols for the data models used by other packages. This ensures consistency and testability.

2. **Network:** Handles network requests using URLSession and deserializes JSON data into Swift structs conforming to the protocols defined in the `Models` package.

3. **Caches:** Provides caching functionality with invalidation logic. Data retrieved from the network can be stored in a local database (in this case UserDefaults but we can define other concrete implementations and switch it over) and retrieved when fresh, reducing network requests and improving performance.

4. **Repository:** Assembles the network and cache services into a cohesive data flow. It provides a simple interface for the ViewModel to fetch data, abstracting away the complexities of networking, caching, and data transformation. 

## Key Features

- **MVVM Architecture:**  Promotes code separation and testability.
- **Repository Pattern:** Enables flexible data access and easy swapping of data sources.
- **Modular Design:** Divided into well-defined packages (`Models`, `Network`, `Caches`, `Repository`) for improved maintainability and scalability. 
- **Testability:** Each package is thoroughly tested with unit tests, and the `Repository` package includes tests for the integrated data flow.

## Future Improvements

- **Additional Test Coverage:** While the app has a good test suite, there are some minor edge cases and scenarios that could benefit from additional test coverage.

## Getting Started

1. Clone the repository.
2. Navigate to the project directory
3. Open the `.xcworkspace` file in Xcode.
4. Build and run the app on a simulator or device. 
