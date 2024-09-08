//
//  ContentView.swift
//  Demo_Onboarding_Quiz
//
//  Created by Dmitriy Richard Starson on 9/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSurvey = false

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome to Our App!")
                .font(.title)
            Text("We'd like to know a bit about you!")
                .font(.subheadline)
            
            Button("Get Started") {
                showSurvey = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .fullScreenCover(isPresented: $showSurvey) {
            AgeSurveyView()
        }
    }
}

#Preview {
    ContentView()
}
