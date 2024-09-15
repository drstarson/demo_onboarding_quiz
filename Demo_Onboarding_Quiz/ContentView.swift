//
//  ContentView.swift
//  Demo_Onboarding_Quiz
//
//  Created by Dmitriy Richard Starson on 9/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("LandingImg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Text("Welcome to Passio Nutrition-AI App!")
                            .font(.system(size: 28, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("Let's get started with a quick survey!")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: AgeSurveyView()) {
                            Text("Get Started")
                                .padding(.horizontal, 30)
                                .padding(.vertical, 15)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 50)
                    .frame(maxWidth: .infinity)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
