import SwiftUI

struct GenderSurveyView: View {
    @State private var selectedGender: Gender = .notSpecified
    @State private var showNextScreen = false

    enum Gender: String {
        case male = "Male"
        case female = "Female"
        case notSpecified = "Prefer not to say"
    }

    var body: some View {
        VStack(spacing: 30) {
            Text("What is your gender?")
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 40) {
                GenderButton(gender: .male, selectedGender: $selectedGender)
                GenderButton(gender: .female, selectedGender: $selectedGender)
            }
            
            Button("Prefer not to say") {
                selectedGender = .notSpecified
            }
            .foregroundColor(selectedGender == .notSpecified ? .blue : .gray)
            
            NavigationLink(destination: WeightSurveyView()) {
                Text("Next")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(selectedGender == .notSpecified)
        }
        .padding()
        .navigationBarTitle("Gender", displayMode: .inline)
        .navigationBarBackButtonHidden(false)
    }
    
    private func saveGender() {
        UserDefaults.standard.set(selectedGender.rawValue, forKey: "userGender")
    }
}

struct GenderButton: View {
    let gender: GenderSurveyView.Gender
    @Binding var selectedGender: GenderSurveyView.Gender
    
    var body: some View {
        VStack {
            Image(gender == .male ? "MaleAvatar" : "FemaleAvatar")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(selectedGender == gender ? Color.blue : Color.clear, lineWidth: 3)
                )
            
            Text(gender.rawValue)
                .foregroundColor(selectedGender == gender ? .blue : .gray)
        }
        .onTapGesture {
            selectedGender = gender
        }
    }
}

struct GenderSurveyView_Previews: PreviewProvider {
    static var previews: some View {
        GenderSurveyView()
    }
}