import SwiftUI

struct WeightSurveyView: View {
    @State private var currentWeight: String = ""
    @State private var goalWeight: String = ""
    @State private var showNextScreen = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Weight Information")
                .font(.title)
            
            TextField("Current Weight (kg)", text: $currentWeight)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Goal Weight (kg)", text: $goalWeight)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Next") {
                saveWeightInfo()
                showNextScreen = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .fullScreenCover(isPresented: $showNextScreen) {
            Text("Survey Complete!") // Placeholder for the next screen or completion
        }
    }
    
    private func saveWeightInfo() {
        UserDefaults.standard.set(currentWeight, forKey: "userCurrentWeight")
        UserDefaults.standard.set(goalWeight, forKey: "userGoalWeight")
    }
}