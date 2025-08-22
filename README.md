# Convex + Clerk iOS QuickStart

A sample iOS app demonstrating real-time data sync with [Convex DB](https://www.convex.dev/) and authentication via [Clerk](https://clerk.com/). Built with SwiftUI.

## Features

- User authentication (Sign Up, Sign In) via Clerk
- Real-time Todo list using Convex DB
- Modular SwiftUI views
- Sample backend functions in TypeScript

## Project Structure

```
ConvexQuickStart/         # iOS SwiftUI app
ConvexQuickStartTests/    # Unit tests
ConvexQuickStartUITests/  # UI tests
convex/                   # Convex backend (TypeScript)
sampleData.jsonl          # Sample data
```

## Getting Started

### Prerequisites

- Xcode 14+
- Node.js & npm
- Convex account ([sign up](https://dashboard.convex.dev/))
- Clerk account ([sign up](https://clerk.com/))

### Setup

1. **Clone the repo**
	```sh
	git clone <repo-url>
	cd ConvexQuickStart
	```

2. **Convex Backend**
	- Install Convex CLI: `npm install -g convex@latest`
	- Initialize Convex: `convex init`
	- Deploy backend: `convex deploy`
	- Update Convex URL in the iOS app

3. **Clerk Setup**
	- Create a Clerk project
	- Get your Clerk publishable key and add it to the app

4. **Run the iOS App**
	- Open `ConvexQuickStart.xcodeproj` in Xcode
	- Build and run

## Usage

- Sign up or sign in
- Add/edit/delete todo items (real-time sync)

## Backend

- Functions: `convex/tasks.ts`
- Data models: `convex/_generated/`

## Testing

- Unit: `ConvexQuickStartTests/`
- UI: `ConvexQuickStartUITests/`

## Resources

- [Convex Docs](https://docs.convex.dev/)
- [Clerk Docs](https://clerk.com/docs)
- [SwiftUI Docs](https://developer.apple.com/documentation/swiftui)
