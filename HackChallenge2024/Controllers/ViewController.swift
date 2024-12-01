//
//  ViewController.swift
//  HackChallenge
//
//  Created by Ruby P on 11/30/24.
//

import SwiftUI

struct ViewController: View {
    let classItem: ClassItem

    @State private var firstPrelimResources: [(link: String, topic: String)] = [("https://youtu.be/example1", "Sorting Algorithms")]
    @State private var secondPrelimResources: [(link: String, topic: String)] = [("https://youtu.be/example3", "Dynamic Programming")]
    @State private var finalPrelimResources: [(link: String, topic: String)] = [("https://youtu.be/example4", "Graph Traversals")]

    @State private var expandedTopic: String? // Tracks the currently expanded topic

    @State private var newResourceLink: String = ""
    @State private var newResourceTopic: String = ""
    @State private var selectedPrelim: String = "First Prelim" // Tracks selected prelim for adding a resource

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.yellow, Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)

            ScrollView {
                VStack(spacing: 20) {
                    // Prerequisite Label and Horizontal Scroll
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Prerequisite Classes")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(classItem.prerequisites, id: \.self) { prerequisite in
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.white)
                                        Text(prerequisite)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    .background(Color.purple.opacity(0.8))
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 100)
                    }

                    // Divider
                    Divider().background(Color.black)

                    // Class Schedule and Description
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Schedule")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text(classItem.schedule)
                            .font(.body)
                            .foregroundColor(.black.opacity(0.9))
                        Text("Description")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text(classItem.description)
                            .font(.body)
                            .foregroundColor(.black.opacity(0.9))
                    }
                    .padding(.horizontal)

                    // Divider
                    Divider().background(Color.white)

                    // Prelim Resources Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Prelim Resources")
                            .font(.headline)
                            .foregroundColor(.black)

                        // First Prelim Section
                        ResourceSectionWithTopics(
                            title: "First Prelim",
                            resources: $firstPrelimResources,
                            expandedTopic: $expandedTopic
                        )

                        // Second Prelim Section
                        ResourceSectionWithTopics(
                            title: "Second Prelim",
                            resources: $secondPrelimResources,
                            expandedTopic: $expandedTopic
                        )

                        // Final Prelim Section
                        ResourceSectionWithTopics(
                            title: "Final Prelim",
                            resources: $finalPrelimResources,
                            expandedTopic: $expandedTopic
                        )

                        // Add New Resource Section
                        VStack(alignment: .leading) {
                            Text("Add a New Resource")
                                .font(.headline)
                                .foregroundColor(.black)

                            TextField("Enter resource link", text: $newResourceLink)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.bottom, 8)

                            TextField("Enter topic for this link", text: $newResourceTopic)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.bottom, 8)

                            Picker("Select Prelim", selection: $selectedPrelim) {
                                Text("First Prelim").tag("First Prelim")
                                Text("Second Prelim").tag("Second Prelim")
                                Text("Final Prelim").tag("Final Prelim")
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.bottom, 8)

                            Button(action: addResource) {
                                Text("Add Resource")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    }
                    .padding(.horizontal)

                    // Divider
                    Divider().background(Color.white)
                }
            }
        }
    }

    private func addResource() {
        guard !newResourceLink.isEmpty, !newResourceTopic.isEmpty else { return }

        let newResource = (link: newResourceLink, topic: newResourceTopic)

        switch selectedPrelim {
        case "First Prelim":
            firstPrelimResources.append(newResource)
        case "Second Prelim":
            secondPrelimResources.append(newResource)
        case "Final Prelim":
            finalPrelimResources.append(newResource)
        default:
            break
        }

        newResourceLink = "" // Clear the input field
        newResourceTopic = "" // Clear the topic field
    }
}

struct ResourceSectionWithTopics: View {
    let title: String
    @Binding var resources: [(link: String, topic: String)]
    @Binding var expandedTopic: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(resources, id: \.topic) { resource in
                        Button(action: {
                            expandedTopic = (expandedTopic == resource.topic) ? nil : resource.topic
                        }) {
                            Text(resource.topic)
                                .padding()
                                .background(Color.blue.opacity(0.8))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.horizontal)
            }

            if let topic = expandedTopic {
                ForEach(resources.filter { $0.topic == topic }, id: \.link) { resource in
                    VStack(alignment: .leading) {
                        Text(resource.link)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .foregroundColor(.black)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
