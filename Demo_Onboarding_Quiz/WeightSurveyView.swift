import SwiftUI

struct WeightSurveyView: View {
    @State private var currentWeight: Double = 150
    @State private var goalWeight: Double = 150
    @State private var showNextScreen = false
    
    let weightRange: ClosedRange<Double> = 50...250
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Weight Information")
                .font(.title)
            
            VStack {
                Text("Current Weight: \(Int(currentWeight)) lbs")
                    .font(.headline)
                Slider(value: $currentWeight, in: weightRange, step: 1)
            }
            .padding()
            
            VStack {
                Text("Goal Weight: \(Int(goalWeight)) lbs")
                    .font(.headline)
                Slider(value: $goalWeight, in: weightRange, step: 1)
            }
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
            Text("Welcome to Passio!") // Placeholder for the next screen or completion
        }
    }
    
    private func saveWeightInfo() {
        UserDefaults.standard.set(currentWeight, forKey: "userCurrentWeight")
        UserDefaults.standard.set(goalWeight, forKey: "userGoalWeight")
    }
}

struct WeightSurveyView_Previews: PreviewProvider {
    static var previews: some View {
        WeightSurveyView()
    }
}