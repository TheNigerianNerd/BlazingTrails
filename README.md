Here is a `README.md` file for the **Blazing Trails** project, based on the architecture, features, and setup instructions described in *Blazor in Action*.

---

# Blazing Trails

Blazing Trails is a full-stack web application designed for hikers to discover, add, and manage trail routes. Built using **Blazor WebAssembly**, it serves as the primary project for demonstrating modern, component-based UI development with C# and .NET.

## 🚀 Features

**Interactive Trail Map:** Integration with JavaScript libraries (Leaflet) to allow users to define waypoints and view trail routes.

**Dynamic Component System:** Uses a highly reusable component model, including trail cards, layout switchers, and custom form inputs.
 
**Advanced Routing:** Implements client-side routing with support for query strings and page parameters to filter and search trails.
 
**Robust Forms & Validation:** Custom-built forms utilizing Fluent Validation to handle trail data and image uploads.
 
**State Management:** Implements an in-memory state store and browser local storage for persistent features like "Favorite Trails".
 
**Authentication & Authorization:** Secure user access integrated with **Auth0**, featuring role-based logic to protect sensitive routes and API endpoints.
 
**Automated Testing:** Comprehensive test suite using **bUnit** for testing rendered markup, event handlers, and component logic.

## 🛠️ Architecture

The project is organized as a **Hosted Blazor WebAssembly** solution:

**Client (`BlazingTrails.Client`):** The Blazor WebAssembly frontend containing the UI components and client-side logic.

**Server (`BlazingTrails.Api`):** An ASP.NET Core Web API backend that serves the application and handles data persistence.
 
**Shared (`BlazingTrails.Shared`):** A .NET class library containing DTOs (Data Transfer Objects) and shared logic used by both the Client and Server.
 
**Component Library (`BlazingTrails.ComponentLibrary`):** A Razor Class Library (RCL) for sharing reusable UI components.

## 🔧 Getting Started

### Prerequisites

[.NET 6 SDK]() 


* Visual Studio 2022, VS Code, or JetBrains Rider 



### Setup

1. **Clone the repository:**
```bash
git clone https://github.com/chrissainty/blazor-in-action

```


2. **Navigate to the API project:**
```bash
cd BlazingTrails.Api

```


3. **Restore and run the application:**
```bash
dotnet run

```


*Note: The API project is configured to serve the Blazor framework files and fallback to `index.html` for client-side routing.*

## 🧪 Testing

Run the component tests using the .NET CLI:

```bash
dotnet test

```

The project uses **bUnit** to emulate user interactions and verify rendered output.

---

This project was developed as part of the "Blazor in Action" guide by Chris Sainty.
