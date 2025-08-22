//
//  TodoView.swift
//  ConvexQuickStart
//
//  Created by BURN Mfg on 22/08/2025.
//

import SwiftUI
import SwiftData
import AlertToast
import ConvexMobile
import Clerk

let convex = ConvexClient(deploymentUrl: "https://insightful-warthog-310.convex.cloud")

struct TodoView: View {
    @Environment(Clerk.self) private var clerk
    
    @State private var todos: [Todo] = []
    @State private var showError: Bool = false
    @State private var toastMessage: String?
    
    @State private var showingAddAlert = false
    @State private var allCompleted = false
    @State private var newTodoText = ""
    
    var body: some View {
        let user = clerk.user
        
        NavigationStack {
            List {
                ForEach($todos, id: \._id) { $todo in
                    Toggle(isOn: Binding(
                        get: { todo.isCompleted },
                        set: { newValue in
                            todo.isCompleted = newValue
                            Task {
                                do {
                                    try await convex.mutation("tasks:complete", with: [
                                        "id": todo._id,
                                        "isCompleted": newValue
                                    ])
                                } catch {
                                    toastMessage = "Failed to update task. Please try again"
                                    showError = true
                                }
                            }
                        }
                    )) {
                        Text(todo.text)
                    }
                    .toggleStyle(CheckboxToggleStyle())
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let todo = todos[index]
                        Task {
                            do {
                                try await convex.mutation("tasks:remove", with: [
                                    "id": todo._id
                                ])
                            } catch {
                                toastMessage = "Failed to delete task. Please try again"
                                showError = true
                            }
                        }
                    }
                }
            }
            .overlay {
                if todos.isEmpty {
                    GeometryReader { geo in
                        VStack(spacing: 8) {
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 48))
                                .foregroundColor(.gray)
                            Text("You have no tasks yet")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Text("Tap + to add your first one")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                    }
                }
            }
            .task {
                for await todos: [Todo] in convex.subscribe(to: "tasks:get")
                    .replaceError(with: []).values
                {
                    self.todos = todos
                }
            }
            .padding(.top, 8)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Left side greeting
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 1) {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.secondary)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        HStack(alignment: .lastTextBaseline, spacing: 1) {
                            Text("Hello,")
                                .font(.system(size: 18, weight: .bold))
                            
                            Text(user?.firstName ?? "Anon")
                                .font(.system(size: 13, weight: .regular))
                        }
                    }
                }
                
                // Right side actions
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    // Add button
                    Button {
                        showingAddAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                    // Ellipsis menu (toggle, delete, logout)
                    Menu {
                        // Toggle All
                        Button {
                            Task {
                                do {
                                    try await convex.mutation("tasks:toggleAll", with: [
                                        "isCompleted": !allCompleted
                                    ])
                                    
                                    allCompleted = !allCompleted
                                } catch {
                                    showError = true
                                }
                            }
                        } label: {
                            Label("Mark All \(allCompleted ? "Complete": "Pending")", systemImage: "checkmark.circle")
                        }
                        
                        // Delete All
                        Button(role: .destructive) {
                            Task {
                                do {
                                    try await convex.mutation("tasks:removeAll")
                                } catch {
                                    toastMessage = "Failed to delete all tasks."
                                    showError = true
                                }
                            }
                        } label: {
                            Label("Delete All", systemImage: "trash")
                        }
                        
                        // Logout (only if user logged in)
                        if user != nil {
                            Button(role: .destructive) {
                                Task { try? await clerk.signOut() }
                            } label: {
                                Label("Logout", systemImage: "rectangle.portrait.and.arrow.forward")
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            .alert("New Todo", isPresented: $showingAddAlert) {
                TextField("Enter todo", text: $newTodoText)
                Button("Add") {
                    let text = newTodoText.trimmingCharacters(in: .whitespaces)
                    if !text.isEmpty {
                        Task {
                            do {
                                try await convex.mutation("tasks:add", with: [
                                    "text": text
                                ])
                                newTodoText = ""
                                allCompleted = false
                            } catch {
                                toastMessage = "Failed to add task. Please try again"
                                showError = true
                            }
                        }
                    }
                }
                Button("Cancel", role: .cancel) {
                    newTodoText = ""
                }
            }
            .toast(isPresenting: $showError, duration: 3.0) {
                AlertToast(
                    displayMode: .banner(.pop),
                    type: .systemImage("exclamationmark.triangle.fill", .red),
                    title: toastMessage ?? "Update failed",
                    style: .style(
                        titleFont: .system(size: 13, weight: .bold)
                    ))
            }
        }
    }
}

#Preview {
    TodoView()
}

// We're using the name Todo instead of Task to avoid clashing with
// Swift's builtin Task type.
struct Todo: Decodable {
    let _id: String
    let text: String
    var isCompleted: Bool
}

// custom checkbox
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}
