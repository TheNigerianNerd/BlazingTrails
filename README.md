# 🏞️ BlazingTrails

**BlazingTrails** is an app built in Blazor using C#12 and .NET8 while reading *Blazor in Action* — a hands-on guide to mastering component-based web development with **.NET** and **C#** by Chris Saintly.  
This project demonstrates practical skills across the entire Blazor stack — from UI components and routing to authentication, state management, and testing.

---

## 🚀 Overview

BlazingTrails is a **single-page application (SPA)** for discovering and sharing hiking trails.  
Developed incrementally through 11 chapters of *Blazor in Action*, it serves as both:
- A **learning tool** for developers exploring Blazor, and  
- A **portfolio project** that showcases modern .NET web practices.

---

## 🧠 What You’ll Learn

This app covers the key concepts every Blazor developer should master:

| Area | Concepts & Features |
|------|----------------------|
| **UI Components** | Reusable Razor components, parent-child communication, lifecycle methods |
| **Routing** | Client-side navigation, route parameters, and programmatic redirects |
| **Forms & Validation** | Built-in form components, custom form inputs, validation messages |
| **Templated Components** | Generic, reusable templates for flexible UI layouts |
| **JavaScript Interop** | Calling JS from C# and vice versa to extend functionality |
| **Authentication** | Secure login using **Auth0** (OAuth2 / OIDC) |
| **State Management** | In-memory state container and LocalStorage persistence |
| **Testing** | Component testing using **bUnit** for markup, events, and interop |

---

## 🧰 Tech Stack

- **Framework:** Blazor WebAssembly (.NET 8 / C# 12)  
- **Frontend:** Razor Components, Bootstrap 5, CSS  
- **Auth:** Auth0 Integration  
- **Testing:** bUnit (Component Unit Testing)  
- **Build Tools:** Visual Studio 2022 / VS Code, .NET CLI  
- **Optional API Layer:** ASP.NET Core Web API (for persistence)  

---

⚙️ Getting Started
Prerequisites

    .NET 8 SDK (Required to build the app locally)

    Docker Desktop (Recommended for consistent, idempotent builds)

Clone & Run

For the most reliable and consistent environment, which ensures that Node.js, NPM, and Sass compilation run correctly (idempotency), use the provided Dockerfile.

    Clone the repository:

git clone [https://github.com/](https://github.com/)<your-username>/BlazingTrails.git
cd BlazingTrails/BlazingTrails.Client

    Build the Docker Image:
    This command executes the multi-stage build, compiling the Blazor app, running the SASS targets, and packaging the result into a lightweight Nginx image.

docker build -t blazingtrails-app .

    Run the Container:
    Create a container named blazingtrails-container and map the container's port 80 (Nginx) to your host's port 8080.

docker run -d -p 8080:80 --name blazingtrails-container blazingtrails-app

Then open the app in your browser at http://localhost:8080.

Local Development (Fast Iteration): If you are actively coding and want hot-reload, stop the container and use:

dotnet watch --project BlazingTrails.Client


🧭 Why It Matters

This project shows mastery of:

Modern C# web UI development using Blazor

Full-stack .NET 6 integration

Secure, tested, and maintainable architecture

Component-driven design similar to React/Vue but entirely in C#

Perfect for showcasing to recruiters, teams, or learners evaluating real-world Blazor implementation.

🧑‍💻 Author

Oche “The Nigerian Nerd” Edache
.NET Developer | Software Engineer | Creator of Combat Culture Africa

🔗 GitHub: @TheNigerianNerd

🔗 LinkedIn: linkedin.com/in/oedache

📄 License

This project is licensed under the MIT License — feel free to fork, learn, and build upon it.

“By the end of Blazor in Action, you won’t just understand Blazor — you’ll have built something real.”
— BlazingTrails
