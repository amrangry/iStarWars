# iStarWars
iStarWars iOS Project

Display Planets

Topic demoestrate in this application
---
##### * [MakeFile](https://makefiletutorial.com/), [bundler](https://bundler.io/), [Cocoapods](https://cocoapods.org/)
##### * [Clean Architecture](https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3)
##### * MVVM-C - Model-View-ViewModel architecture, plus the Coordinator pattern

## Environment
---
```ruby
Xcode 16.2
```
```ruby
Swift 5
```

##  Setup Prerequisites   💻
* - You need to run makefile to setup the project by doing the following steps
---
```bash
* open terminal from finder
* $ cd ../Project folder 
* $ make start
```

- We use Bundler for gems dependancey managment 
 * 1- How to install bundler 
---
Getting Started
Getting started with bundler is easy! Open a terminal window and run this command:
```bash
$ gem install bundler
```
to read more about bundler please visit 

## Folder and File Structure for iStarWar



### Project Structure
```
iStarWar/
├── iStarWar.entitlements
├── Readme
├── App/
│   ├── iStarWarApp.swift
│   ├── AppCoordinator.swift
│   ├── SceneConfigurator.swift
├── Modules/
│   ├── Planets/
│   │   ├── Coordinators/
│   │   │   ├── PlanetsCoordinator.swift
│   │   ├── Models/
│   │   │   ├── Planet.swift
│   │   │   ├── PlanetsResponse.swift
│   │   ├── Repositories/
│   │   │   ├── PlanetRespository.swift
│   │   ├── UseCases/
│   │   │   ├── FetchPlanetsUseCase.swift
│   │   ├── ViewModels/
│   │   │   ├── PlanetViewModel.swift
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
│   ├── Errors/
│   │   ├── CustomError.swift
│   ├── Extensions/
│   │   ├── View+Shimmer.swift
│   │   ├── View+Animations.swift
│   ├── FontManager.swift
├── Resources/
│   ├── Assets.xcassets
│   ├── Fonts/
│   │   ├── Arabic
│   │   ├── English
│   ├── LaunchScreen.storyboard
Tests/
├── UnitTests/
│   ├── MockURLProtocol.swift
│   ├── APIClientTests.swift
│   ├── PlanetViewModelTests.swift
├── UITests/
│   ├── PlanetListViewUITests.swift

```

ViewModelControllable

Key Features to Showcase
1- Modern Architecture:
- Use MVVM-C (Model-View-ViewModel-Coordinator) for better navigation and separation of concerns.
- Implement dependency injection for better testability and modularity.

2- Advanced UI/UX:
- Use SwiftUI with advanced animations and transitions.
- Add a splash screen and loading states with shimmer effects.

3- State Management:
- Use Combine for reactive programming and state management.
- Implement Redux-like state management for a single source of truth.

4- Networking:
- Use async/await for modern networking.
- Add caching with URLCache or Core Data for offline support.

5- Testing:
- Write unit tests and UI tests to demonstrate your commitment to quality.

6- Advanced Features:
- Add pagination for infinite scrolling.
- Implement search and filtering.
- Use Swift Charts or Lottie for data visualization and animations.

7- DevOps:
- Add a CI/CD pipeline using GitHub Actions or Bitrise.
- Use SwiftLint and SwiftFormat for code quality.

### Implementation Details
1. MVVM-C Architecture
- Coordinator: Handles navigation and flow control.
- ViewModel: Manages business logic and state.
- View: Displays the UI.

2. Dependency Injection
- Pass dependencies (e.g., NetworkManager) to the ViewModel for better testability.

3. Advanced UI/UX
- Use shimmer effects for loading states.
- Add Lottie animations for a polished look.

4. Async/Await Networking
- Update NetworkManager to use async/await.

Future Enhancements
Pagination: Add pagination to load more planets as the user scrolls.

Search: Implement a search bar to filter planets by name.

Detail View: Create a PlanetDetailView to show more details about a selected planet.

Error Handling: Improve error handling and display user-friendly messages.



Add a splash screen using LaunchScreen.storyboard.

Use SwiftLint and SwiftFormat for code consistency.

Set up a CI/CD pipeline using GitHub Actions or Bitrise.


Error Handling:

Add a retry button when an error occurs.

Pagination:

Load more planets as the user scrolls to the bottom of the list.

Search:

Add a search bar to filter planets by name.

Custom Error Messages:

Provide user-friendly error messages based on the type of error (e.g., network error, invalid URL).

Retry Mechanism:

Add a retry button to allow users to retry failed requests.

Logging:

Log errors for debugging purposes.


Simulate Network Errors:

Disable the network connection or modify the API URL to simulate a network error.

Verify that the custom network error message is displayed.

Simulate Decoding Errors:

Modify the API response to return invalid JSON.

Verify that the custom decoding error message is displayed.

Simulate Unknown Errors:

Introduce an unexpected error (e.g., force unwrap a nil value).

Verify that the custom unknown error message is displayed.
