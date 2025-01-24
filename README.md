# iStarWars  
**iStarWars iOS Project**  
Display Planets  

---------------

## Topics Demonstrated in This Application  
This project showcases the following technologies and architectural patterns:  
- **[Clean Architecture](https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3)**  
- **MVVM-C** - Model-View-ViewModel architecture, plus the Coordinator pattern  
- **[Makefile](https://makefiletutorial.com/) **
- **[Bundler](#bundler-for-dependency-management)**
- **[CocoaPods](https://cocoapods.org/)**  

---------------

## Environment  
- **Xcode**: 16.2  
- **Swift**: 5  

---------------

## Setup Prerequisites 💻  
To set up the project, follow these steps:  

1. Open Terminal and navigate to the project folder:  
   ```bash
   cd /path/to/iStarWars
   ```

2. Run the following command to set up the project:  
   ```bash
   make start
   ```

---------------

## Project Structure  
Here’s an overview of the folder and file structure for the **iStarWars** project:  

```
iStarWars/
├── iStarWars.entitlements
├── Readme.md
├── App/
│   ├── iStarWarApp.swift
├── Coordinator/
│   ├── AppCoordinator.swift
│   ├── NavigationPath.swift
│   ├── SceneConfigurator.swift
├── Modules/
│   ├── Planets/
│   │   ├── Coordinators/
│   │   │   ├── PlanetsCoordinator.swift
│   │   ├── Models/
│   │   │   ├── Planet.swift
│   │   │   ├── PlanetsResponse.swift
│   │   │   ├── Planet+Mock.swift
│   │   ├── Repositories/
│   │   │   ├── PlanetRespository.swift
│   │   │   ├── PlanetRepositoryProtocol.swift
│   │   ├── UseCases/
│   │   │   ├── FetchPlanetsUseCase.swift
│   │   │   ├── FetchPlanetDetailsUseCase.swift
│   │   ├── ViewModels/
│   │   │   ├── PlanetViewModel.swift
│   │   │   ├── FetchPlanetDetailsUseCase.swift
│   │   ├── Views/
│   │   │   ├── PlanetListView.swift
│   │   │   ├── PlanetRowView.swift
│   │   │   ├── PlanetDetailView.swift
├── Services/
│   ├── Network/
│   │   ├── APIClient.swift
│   │   ├── Endpoints.swift
│   ├── Storage/
│   │   ├── CacheManager.swift
├── Utilities/
│   ├── Constants.swift
│   ├── Environment.swift
│   ├── Errors/
│   │   ├── CustomError.swift
│   │   ├── DataError.swift
│   │   ├── NetworkError.swift
│   ├── Extensions/
│   │   ├── String+Extension.swift
│   ├── UI/
│   │   ├── View+Shimmer.swift
├── Resources/
│   ├── Assets.xcassets
│   ├── Fonts/
│   │   ├── Arabic
│   │   ├── English
│   ├── LaunchScreen.storyboard
Tests/
├── UnitTests/
│   ├── APIClientTests.swift
│   ├── EnvironmentTests.swift
│   ├── CachedManagerTests.swift
│   ├── MockURLProtocol.swift
│   ├── CustomErrorTests.swift
│   ├── NetwrokErrorTests.swift
│   ├── DataErrorTests.swift
│   ├── StringExtensionTests.swift
│   ├── EndpointsTests.swift
│   ├── iStarWarsTests.swift
├── UITests/
│   ├── PlanetListViewUITests.swift
```

---------------

## Key Features  
### 1. Modern Architecture  
- **MVVM-C**: Model-View-ViewModel architecture with Coordinators for navigation and separation of concerns.  
- **Dependency Injection**: Improves testability and modularity.  

### 2. Advanced UI/UX  
- **SwiftUI**: Used for building the UI with advanced animations and transitions.  
- **Shimmer Effects**: Added for loading states.  

### 3. State Management  
- **Combine**: Used for reactive programming and state management.  
- **Redux-like State Management**: Ensures a single source of truth.  

### 4. Networking  
- **Async/Await**: Modern networking with async/await.  
- **Caching**: Implemented with `URLCache` or Core Data for offline support.  

### 5. Testing  
- **Unit Tests**: For business logic and ViewModels.  
- **UI Tests**: For testing the user interface.  

### 6. Advanced Features  
- **Pagination**: Infinite scrolling for loading more planets.  
- **Search and Filtering**: Allows users to search and filter planets by name.  
- **Swift Charts/Lottie**: For data visualization and animations.  

### 7. DevOps  
- **CI/CD Pipeline**: Set up using GitHub Actions or Bitrise.  
- **Code Quality**: Enforced with SwiftLint and SwiftFormat.  

---------------

## Implementation Details  
### 1. MVVM-C Architecture  
- **Coordinator**: Handles navigation and flow control.  
- **ViewModel**: Manages business logic and state.  
- **View**: Displays the UI.  

### 2. Dependency Injection  
- Dependencies (e.g., `NetworkManager`) are passed to the ViewModel for better testability.  

### 3. Advanced UI/UX  
- **Shimmer Effects**: Added for loading states.  
- **Lottie Animations**: Used for a polished look.  

### 4. Async/Await Networking  
- The `NetworkManager` is updated to use async/await for modern networking.  

---------------

## Future Enhancements  
### 1. Pagination  
- Load more planets as the user scrolls to the bottom of the list.  

### 2. Search  
- Add a search bar to filter planets by name.  

### 3. Detail View  
- Create a `PlanetDetailView` to show more details about a selected planet.  

### 4. Error Handling  
- Improve error handling and display user-friendly messages.  

### 5. Splash Screen  
- Add a splash screen using `LaunchScreen.storyboard`.  

### 6. Code Quality  
- Use **SwiftLint** and **SwiftFormat** for code consistency.  

### 7. CI/CD Pipeline  
- Set up a CI/CD pipeline using **GitHub Actions** or **Bitrise**.  

---------------

## Error Handling  
### Key Features  
- **Custom Error Messages**: User-friendly messages based on error type (e.g., network error, invalid URL).  
- **Retry Mechanism**: Add a retry button for failed requests.  
- **Logging**: Log errors for debugging purposes.  

### Testing Error Scenarios  
- **Network Errors**: Disable the network connection or modify the API URL to simulate errors.  
- **Decoding Errors**: Modify the API response to return invalid JSON.  
- **Unknown Errors**: Introduce unexpected errors (e.g., force unwrap a nil value).  
```

---------------

### Bundler for Dependency Management  
We use **[Bundler](https://bundler.io/)** to manage Ruby gem dependencies.  

#### How to Install Bundler  
1. Open Terminal and run:  
   ```bash
   gem install bundler
   ```

2. For more information about Bundler, visit the [official documentation](https://bundler.io/).  

---------------
