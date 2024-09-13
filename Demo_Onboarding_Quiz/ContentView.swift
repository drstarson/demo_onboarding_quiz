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
        ZStack {
            // Background Image
            Image("LandingImg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Text("Welcome to Passio Nutrition-AI Onboarding App!")
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text("Let's get started with a quick survey!")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    
                    Button("Get Started") {
                        showSurvey = true
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 50) // Add some bottom padding
            }
        }
        .fullScreenCover(isPresented: $showSurvey) {
            AgeSurveyView()
        }
    }
}

#Preview {
    ContentView()
}
