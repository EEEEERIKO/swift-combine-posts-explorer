# ⚡ Combine Posts Explorer

<p align="center">
  <img src="https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white" />
  <img src="https://img.shields.io/badge/SwiftUI-007AFF?style=for-the-badge&logo=swift&logoColor=white" />
  <img src="https://img.shields.io/badge/Combine-8A2BE2?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Architecture-MVVM-2EA44F?style=for-the-badge" />
</p>

<p align="center">
  <strong>Explore posts. Understand data streams. Build reactive applications.</strong>
</p>

<p align="center">
  A SwiftUI application built with Apple's Combine framework, demonstrating reactive networking, asynchronous data handling, and MVVM architecture.
</p>

---

## 🚀 About the Project

**Combine Posts Explorer** is an iOS application developed to explore Apple's Combine framework through a practical networking implementation.

The application fetches posts from the [JSONPlaceholder REST API](https://jsonplaceholder.typicode.com/posts), decodes the JSON response, and dynamically displays the results using SwiftUI.

Rather than relying on traditional completion handlers, this project uses Combine publishers and subscribers to create a reactive data flow between the networking layer, ViewModel, and user interface.

The project is part of my journey toward becoming an iOS Developer, focusing on understanding Apple's native technologies and building maintainable applications.

## ✨ Features

- 🌐 **REST API Integration** — Fetch posts from JSONPlaceholder.
- ⚡ **Reactive Networking** — Handle HTTP requests using Combine.
- 🔄 **Dynamic UI Updates** — Automatically reflect data changes through `@Published`.
- 🏗️ **MVVM Architecture** — Separate presentation logic from networking responsibilities.
- 📋 **Posts Explorer** — Display fetched posts using SwiftUI `List`.
- ⏳ **Loading State** — Provide visual feedback while fetching data.
- ⚠️ **Error Handling** — Handle network and decoding errors.
- 🔁 **Retry Support** — Allow users to retry failed requests.

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| Swift | Programming language |
| SwiftUI | Declarative user interface |
| Combine | Reactive programming and data streams |
| URLSession | HTTP networking |
| Codable / Decodable | JSON decoding |
| MVVM | Application architecture |
| Foundation | Core iOS functionality |

## 🧠 Combine in Practice

The main objective of this project is to understand how Combine can simplify asynchronous networking and data flow.

The networking layer implements a reactive pipeline:

```swift
URLSession.shared.dataTaskPublisher(for: url)
    .tryMap { data, response in
        guard let response = response as? HTTPURLResponse,
              (200...299).contains(response.statusCode) else {
            throw URLError(.badServerResponse)
        }

        return data
    }
    .decode(type: [Post].self, decoder: JSONDecoder())
    .eraseToAnyPublisher()
```

### Concepts demonstrated

- `dataTaskPublisher` — Create a publisher from an HTTP request.
- `tryMap` — Validate and transform the HTTP response.
- `decode` — Convert JSON data into Swift models.
- `receive(on:)` — Deliver downstream events on the main queue.
- `@Published` — Publish changes to observable properties.
- `sink` — Subscribe to publisher outputs and completion events.
- `AnyCancellable` — Manage subscription lifecycles.
- `ObservableObject` — Connect the ViewModel with SwiftUI.

## 🏛️ Architecture

The project follows the **Model-View-ViewModel (MVVM)** architectural pattern, with a dedicated service layer for networking.

```text
PostsExplorer/
│
├── App/
│   └── PostsExplorerApp.swift
│
├── Models/
│   └── Post.swift
│
├── Services/
│   ├── PostServiceProtocol.swift
│   └── PostService.swift
│
├── ViewModels/
│   └── PostsViewModel.swift
│
├── Views/
│   ├── PostsView.swift
│   └── Components/
│       └── PostRowView.swift
│
└── Resources/
```

### Data Flow

```text
JSONPlaceholder API
        |
        v
   PostService
        |
        v
 Combine Publisher
        |
        v
  PostsViewModel
        |
        v
  @Published State
        |
        v
    PostsView
        |
        v
   SwiftUI List
```

Each component has a clear responsibility, making the application easier to maintain, test, and extend.

## 📱 Screenshots

<p align="center">
  <i>Screenshots coming soon.</i>
</p>

<!-- Add your application screenshots here once available. -->

## 🌍 API

This project uses [JSONPlaceholder](https://jsonplaceholder.typicode.com/), a free fake REST API for testing and prototyping.

**Endpoint:**

`GET https://jsonplaceholder.typicode.com/posts`

The endpoint returns 100 posts containing:

- User ID
- Post ID
- Title
- Body

## ⚙️ Getting Started

### Requirements

- macOS
- Xcode
- Swift
- iOS Simulator or a compatible iOS device

### Installation

1. Clone the repository:

```bash
git clone https://github.com/EEEEERIKO/swift-combine-posts-explorer.git
```

2. Open the project in Xcode.

3. Select an iOS Simulator.

4. Build and run the application.

No API key or additional configuration is required.

## 🗺️ Roadmap

- [x] Create the SwiftUI application structure.
- [x] Implement the Post model.
- [x] Integrate JSONPlaceholder API.
- [x] Implement reactive networking with Combine.
- [x] Build the MVVM architecture.
- [x] Display posts using SwiftUI.
- [x] Implement loading and error states.
- [ ] Add unit tests for the service and ViewModel.
- [ ] Improve test coverage and dependency injection.

## 👨‍💻 Author

**Erik Valencia Cardona**

Computer Engineering Student | Aspiring iOS Developer

- GitHub: [@EEEEERIKO](https://github.com/EEEEERIKO)
- LinkedIn: [erikodev](https://www.linkedin.com/in/erikodev)

---

<p align="center">
  <strong>Built with Swift, Combine, and a passion for iOS development. ⚡</strong>
</p>
