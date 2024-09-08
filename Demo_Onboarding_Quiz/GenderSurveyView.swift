import SwiftUI

struct GenderSurveyView: View {
    @State private var gender: String = ""
    @State private var showNextScreen = false

    var body: some View {
        VStack(spacing: 20) {
            Text("What is your gender?")
                .font(.title)
            
            Picker("Gender", selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non-binary").tag("Non-binary")
                Text("Prefer not to say").tag("Prefer not to say")
            }
            .pickerStyle(WheelPickerStyle())
            
            Button("Next") {
                saveGender()
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
    
    private func saveGender() {
        // Save gender to UserDefaults or a JSON file
        UserDefaults.standard.set(gender, forKey: "userGender")
    }
}