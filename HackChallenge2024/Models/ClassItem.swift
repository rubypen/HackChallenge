//
//  ClassItem.swift
//  HackChallenge
//
//  Created by Ruby P on 11/30/24.
//

import Foundation

struct ClassItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let schedule: String
    let prerequisites: [String]
}

// Dummy Data
// Sample Data
let sampleClasses = [
    ClassItem(
        name: "CS4820 - Algorithms",
        description: "Learn the fundamentals of algorithms and their applications. Taught by Dr. Eva Tardos.",
        schedule: "MWF 9:05 AM - 9:55 AM",
        prerequisites: ["3110", "2800"]
    ),
    ClassItem(
        name: "CS3110 - Data Structures and Functional Programming",
        description: "Advanced programming course that emphasizes functional programming techniques and data structures. Programming topics include recursive and higher-order procedures, models of programming language evaluation and compilation, type systems, and polymorphism. Data structures and algorithms covered include graph algorithms, balanced trees, memory heaps, and garbage collection. Also covers techniques for analyzing program performance and correctness.",
        schedule: "MWF 11:15 AM - 12:05 PM",
        prerequisites: ["1110", "2110"]
    ),
    ClassItem(
        name: "CS4410 - Operating Systems",
        description: "Introduction to the design of systems programs, with emphasis on multiprogrammed operating systems. Topics include concurrency, synchronization, deadlocks, memory management, protection, input-output methods, networking, file systems and security. The impact of network and distributed computing environments on operating systems is also discussed.",
        schedule: "TTh 9:40 AM - 10:55 AM",
        prerequisites: ["CS 3410/CS 3420"]
    ),
    ClassItem(
        name: "CS2110 - Object-Oriented Programming and Data Structures",
        description: "Intermediate programming in a high-level language and introduction to computer science. Topics include object-oriented programming (classes, objects, subclasses, types), graphical user interfaces, algorithm analysis (asymptotic complexity, big O notation), recursion, testing, program correctness (loop invariants), searching/sorting, data structures (lists, trees, stacks, queues, heaps, search trees, hash tables, graphs), graph algorithms. Java is the principal programming language.",
        schedule: "TTh 10:10 AM - 11:00 AM",
        prerequisites: ["1110/1112"]
    )
]
