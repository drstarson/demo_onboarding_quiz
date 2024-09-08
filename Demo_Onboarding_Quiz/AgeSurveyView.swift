import SwiftUI

struct AgeSurveyView: View {
    @State private var age: Int = 18
    @State private var showNextScreen = false

    var body: some View {
        VStack(spacing: 20) {
            Text("What is your age?")
                .font(.title)
            
            Picker("Age", selection: $age) {
                ForEach(1...100, id: \.self) { age in
                    Text("\(age)")
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            Button("Next") {
                saveAge()
                showNextScreen = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .fullScreenCover(isPresented: $showNextScreen) {
            GenderSurveyView()
        }
    }
    
    private func saveAge() {
        // Save age to UserDefaults or a JSON file
        UserDefaults.standard.set(age, forKey: "userAge")
    }
}