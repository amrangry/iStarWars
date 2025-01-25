# iStarWars  
<p align="center">
  <img src ="https://github.com/amrangry/iStarWars/blob/main/logo.png?raw=true"/>
</p>

* **[Overview](#overview)**
* **[Project Goals](#project-goals)**
* **[What’s Inside? (Technologies Used)](#What’s-Inside?-(Technologies-Used))**
* **[Screenshots](#screenshots)**
* **[How to Get Started!](#How-to-Get-Started)**
* **[Setup Prerequisites](#setup-prerequisites)**
   * [Environment](#Environment)
   * [Bundler for Dependency Management](#Bundler-for-Dependency-Management)
* **[Project Structure](#Project-Structure)**
* **[What’s Next?](#What’s-Next?)**
* **[Author](#Author)**
* **[Contributing](#Contributing-🤘)**
* **[Code of Conduct](#Code-of-Conduct)**
* **[License](#License)**

---------------
## **Overview**  

The **iStarWars iOS Project** is a fun little app that fetches and displays a list of planets
from the [Star Wars API (SWAPI)](https://swapi.dev/api).
It’s built to show off some cool iOS development techniques while keeping things clean and easy to understand.  

---------------
## **Project Goals**  

This project is designed to demonstrate best practices in iOS development, making it an excellent resource for learning and reference.

- Demonstrate **Clean Architecture** and **MVVM** in a real-world iOS app.  
- Showcase the use of **Combine** and **Async/Await** for modern iOS development.  
- Provide a reference for implementing **Unit Testing** in Swift.  
- Highlight the power of **SwiftUI** for building dynamic and responsive UIs.  

---------------

## **What’s Inside? (Technologies Used)**

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
## **Screenshots**

```ruby
A picture says a thousand words
```

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
## **Setup Prerequisites** 💻 

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
## **Project Structure**

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
## **What’s Next?**

Here are some ideas for future improvements:  
- [x] **Pagination**: Load more planets as the user scrolls to the bottom of the list. 
- [x] **Search and Filtering**: Allows users to search and filter planets by name. 
- [x] **localize Error Messages**: User-friendly messages based on error type (e.g., network error, invalid URL).
- [x] **Font manager**: Use font , color design.
- [x] **CI/CD Pipeline**: Set up using GitHub Actions or Bitrise.  
- [x] **Retry Mechanism**: Add a retry button for failed requests.  
- [x] **Logging**: Log errors for debugging purposes. 

--------------- 
## **Author**

<div align="center">
  <img src="https://avatars.githubusercontent.com/u/2900952?s=400&u=41c504ca200e2f92638fc630e8361da78296b35c&v=4" width="180" alt="Amr Ahmed Elghadban"/>

  **Amr Ahmed Elghadban (AmrAngry)**

[![Email](https://img.shields.io/badge/Email-Contact%20Me-red?logo=gmail)](mailto:amr.elghadban@gmail.com) [![WhatsApp](https://img.shields.io/badge/GitHub-Profile-blue?logo=whatsapp)](https://api.whatsapp.com/send/?phone=00971543233227&text=Hi%20&app_absent=0) [![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-blue?logo=linkedin)](https://www.linkedin.com/in/amrelghadban/)

[![GitHub](https://img.shields.io/badge/GitHub-Profile-blue?logo=github)](https://github.com/amrangry) [![StackOverflow](https://img.shields.io/badge/StackOverflow-Profile-orange?logo=stackoverflow)](https://stackoverflow.com/users/1316779/amrangry)

[![Twitter (formerly Twitter)](https://img.shields.io/badge/Twitter-Profile-blue?logo=twitter)](https://x.com/intent/follow?screen_name=amr_elghadban) [![Facebook](https://img.shields.io/badge/Facebook-Profile-blue?logo=facebook)](https://facebook.com/amr.elghadban) [![Website](https://img.shields.io/badge/Website-Visit%20Me-blue?logo=globe)](https://amrangry.github.io/)
       <div align="center" >
	       <a href = "https://www.buymeacoffee.com/amrangry">
		    <img src = "https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=&slug=your-username&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff"/>
                </a>
       </div>
  <!--  [![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Support%20Me-yellow?logo=buymeacoffee)](https://www.buymeacoffee.com/amrangry) -->
  <!--  [Email](mailto:amr.elghadban@gmail.com?subject=I%20checked%20your%20GitHub%20repo!): [amr.elghadban@gmail.com](mailto:amr.elghadban@gmail.com) -->
  <!-- [![Linkedin](https://img.shields.io/badge/Lets%20Connect%20via-LinkedIn-blue)](https://www.linkedin.com/in/amrelghadban/) -->
  <!-- [![X (formerly Twitter) Follow](https://img.shields.io/twitter/follow/amr_elghadban)](https://x.com/intent/follow?screen_name=amr_elghadban) -->
  
</div>

## **Contributing 🤘**

All your feedback and help to improve this project is very welcome. 
Please create issues for your bugs, ideas and enhancement requests, or better yet, contribute directly by creating a PR. 😎

When reporting an issue, please add a detailed instruction, and if possible a code snippet or test that can be used as a reproducer of your problem. 💥

When creating a pull request, please adhere to the current coding style where possible, and create tests with your code so it keeps providing an awesome test coverage level 💪


## **Code of Conduct**

I’m here to share my knowledge and findings as I work every day to improve our apps/demos for the community.

This is a space where we work together, openly and safely, as kind and considerate human beings.

We grow by giving and receiving positive, constructive feedback.
 
Let’s keep learning and building, one step at a time.


## **License**

<details>
<summary><strong>MIT License</strong></summary>
<p>
iStarWars is distributed under the MIT License.  
For more information, see the <a href="https://github.com/amrangry/iStarWars/blob/master/LICENSE" target="_blank">LICENSE</a> file.  

&copy; 2025 Amr Elghadban  
All rights reserved.
</p>
</details>
