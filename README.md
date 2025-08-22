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
   touch .env.local
   echo "CONVEX_DEPLOYMENT=<convex-deployment>" >> .env.local
   echo "CONVEX_URL=<convex-url>" >> .env.local
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

## Screenshots

### Light Mode

</br>
Sign In
</br>
<img src="https://github.com/user-attachments/assets/4b32e1aa-aa80-4053-a670-7a76623e1e93" alt="sign_in" width="350" style="max-height: 500px; object-fit: contain;" />
</br>

Sign Up
</br>
<img src="https://github.com/user-attachments/assets/f28826cf-01ef-4aa4-9f15-e2092e70720e" alt="sign_up" width="350" style="max-height: 500px; object-fit: contain;" />
</br>

Create New
</br>
<img src="https://github.com/user-attachments/assets/d4cfc37d-d041-410b-bd68-d692dcbc413a" alt="create_new" width="350" style="max-height: 500px; object-fit: contain;" />
</br>

Empty State
</br>
<img src="https://github.com/user-attachments/assets/cf64c615-6628-4044-ae36-87da4afb1cf8" alt="home_empty" width="350" style="max-height: 500px; object-fit: contain;" />
</br>

Non-Empty State
</br>
<img src="https://github.com/user-attachments/assets/3ea16a17-94ec-4b9f-b94a-cecf458873c2" alt="home_not_empty" width="350" style="max-height: 500px; object-fit: contain;" />
</br>

Slide To Delete
</br>
<img src="https://github.com/user-attachments/assets/b0c4c835-6b55-43ea-bd8d-b1ae77b1c6fa" alt="slide_to delete" width="350" style="max-height: 500px; object-fit: contain;" />
</br>

Context Menu
</br>
<img src="https://github.com/user-attachments/assets/ee2fff7d-2844-45cd-a33d-d5c028e2cdc0" alt="context_menu" width="350" style="max-height: 500px; object-fit: contain;" />
</br>

### Dark Mode

Sign In
</br>
<img src="https://github.com/user-attachments/assets/276946ab-7373-4e77-abd4-7b1e5cc5f850" alt="sign_in" width="350" style="max-height: 500px; object-fit: contain;" />
</br>

Sign Up
</br>
<img src="https://github.com/user-attachments/assets/093eb845-506a-4215-a43b-3e7379273746" alt="sign_up" width="350" style="max-height: 500px; object-fit: contain;" />
</br>

Create New
</br>
<img src="https://github.com/user-attachments/assets/a4a5cb57-b4a6-4021-a7bc-c7bb68d11bae" alt="create_new" width="350" style="max-height: 500px; object-fit: contain;" />
</br>

Empty State
</br>
<img src="https://github.com/user-attachments/assets/79125cea-3f5f-4290-9cc9-6e4e6333cab4" alt="home_empty" width="350" style="max-height: 500px; object-fit: contain;" />
</br>

Non-Empty State
</br>
<img src="https://github.com/user-attachments/assets/2f175a8d-5aba-4840-8d27-a37e8bef30c8" alt="home_not_empty" width="350" style="max-height: 500px; object-fit: contain;" />
</br>

Slide To Delete
</br>
<img src="https://github.com/user-attachments/assets/0a878c0c-63c9-4c86-9d33-9e93da0f4837" alt="slide_to_delete" width="350" style="max-height: 500px; object-fit: contain;" />
</br>

Context Menu
</br>
<img src="https://github.com/user-attachments/assets/ab110590-542c-4467-bd73-d6f1bca00667" alt="context_menu" width="350" style="max-height: 500px; object-fit: contain;" />
</br>
