# iStarWars  
<p align="center">
  <img src ="https://github.com/amrangry/iStarWars/blob/main/logo.png?raw=true"/>
</p>

## **iStarWars iOS Project**  

The **iStarWars iOS Project** is a fun little app that fetches and displays a list of planets from the [Star Wars API (SWAPI)](https://swapi.dev/api).
It’s built to show off some cool iOS development techniques while keeping things clean and easy to understand.  

---------------
### **Project Goals**  
- Demonstrate **Clean Architecture** and **MVVM** in a real-world iOS app.  
- Showcase the use of **Combine** and **Async/Await** for modern iOS development.  
- Provide a reference for implementing **Unit Testing** in Swift.  
- Highlight the power of **SwiftUI** for building dynamic and responsive UIs.  

This project is designed to demonstrate best practices in iOS development, making it an excellent resource for learning and reference.
---------------
### **What’s Inside? (Technologies Used) **  
- **Planet List**: Fetches and shows a list of planets from the Star Wars universe. 
- **Swift**: The primary programming language for iOS development.
- **SwiftUI**: A declarative framework for building dynamic UI, making it dynamic and responsive user interfaces.  
  
- **Clean Code**: The app is structured using 
 - **Clean Architecture** Separates the app into distinct layers (Presentation, Domain, and Data) for better scalability and testability, separates concerns  
    and
 - **MVVM-C**: Model-View-ViewModel architecture with Coordinators for navigation and separation of concerns that ensures a clear separation between the UI, business logic, and data layers.   
- **Modern Tools**: 
  - Uses **Combine**: Used for reactive programming and state management, enabling seamless data flow and updates.
  - And **Async/Await**: Modern concurrency techniques for efficient and readable asynchronous code.
- **Caching**: Implemented with `URLCache` for offline support.  
- **Testing**: Comes with **Unit Tests** to make sure everything works as expected.  
- **[CocoaPods](https://cocoapods.org/)**: For dependency management (e.g., SwiftLint). 
- **[Makefile](https://makefiletutorial.com/)**
- **[Bundler](#bundler-for-dependency-management)**

---------------
## Screenshots
<p align="center">
  <img src="https://github.com/amrangry/iStarWars/blob/main/media/movie.gif?raw=true" width="30%" />
</p>

<div align="center">
  <table>
    <tr>
      <td><img src="https://github.com/amrangry/iStarWars/blob/main/media/splash.png?raw=true" width="100%" /></td>
      <td><img src="https://github.com/amrangry/iStarWars/blob/main/media/planet_list.png?raw=true" width="100%" /></td>
    </tr>
    <tr>
      <td align="center">Splash Screen</td>
      <td align="center">Planet List</td>
    </tr>
  </table>
</div>

---------------
### **How to Get Started**  
1. Clone the repo.  
2. Open it in [Xcode](#Environment) check [Prerequisites](#setup-prerequisites).  
3. Run the app to see the list of planets.  
4. Explore the code to see how everything fits together.

---------------
##**Setup Prerequisites** 💻 
### Environment  
- **Xcode**: 16.2  
- **Swift**: 5 

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
### Bundler for Dependency Management  
We use **[Bundler](https://bundler.io/)** to manage Ruby gem dependencies.  

#### How to Install Bundler  
1. Open Terminal and run:  
   ```bash
   gem install bundler
   ```
2. For more information about Bundler, visit the [official documentation](https://bundler.io/).  

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
### **What’s Next?**  
Here are some ideas for future improvements:  
- **Pagination**: Load more planets as the user scrolls to the bottom of the list. 
- **Search and Filtering**: Allows users to search and filter planets by name. 
- **localize Error Messages**: User-friendly messages based on error type (e.g., network error, invalid URL).
- **Font manager**: Use font , color design.
- **CI/CD Pipeline**: Set up using GitHub Actions or Bitrise.  
- **Retry Mechanism**: Add a retry button for failed requests.  
- **Logging**: Log errors for debugging purposes. 

---------------

## Author

AmrAngry, <a href="amr.elghadban@gmail.com">amr.elghadban@gmail.com</a>

[![Twitter Follow](https://img.shields.io/twitter/follow/amr_elghadban?style=social)](https://twitter.com/intent/follow?screen_name=amr_elghadban)

[![Linkedin](https://img.shields.io/badge/Lets%20Connect%20via-LinkedIn-blue)](https://www.linkedin.com/in/amrelghadban/)


## License

iStarWars is available under the MIT license. See the [LICENSE](https://github.com/amrangry/iStarWars/blob/master/LICENSE) file for more info.
