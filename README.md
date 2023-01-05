# ShowMania

ShowMania is a simple application to search TV Shows. 

# Overview

There are two screens in the app. The first screen consists of a list view and a search view. Search view can be used for searching desired TV shows. By clicking on show item user can see the details of that show. The detail screen includes short descriptions, ratings, language, genre and other information of a specific show.

The App is built with MVVM Architecture with Apple's new declarative SwiftUI.
 
The API ​http://www.tvmaze.com/api​ is used to get the list of shows. Network calls are implemented using URLSession with async wait pattern. There is also an ImageLoader to load images from URLs asynchronously.

The App is built with protocol-oriented design pattern so that it can be extended for Unit testing. It is also built following the SOLID design principle.

## Framework, Architecture, Pattern
- Swift <br/>
- SwiftUI <br/>
- MVVM<br/>
- Combine<br/>
- Protocol Oriented Programming <br/>
- @MainActor<br/>
- ViewModifier<br/>
- Asyc/Await<br/>
- Enum<br/> 

