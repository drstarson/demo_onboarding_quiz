import SwiftUI

struct AgeSurveyView: View {
    @State private var age: Int = 25

    var body: some View {
        VStack(spacing: 30) {
            Text("What is your age?")
                .font(.title)
                .fontWeight(.bold)
            
            Picker("Select your age", selection: $age) {
                ForEach(1...100, id: \.self) { age in
                    Text("\(age)").tag(age)
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            NavigationLink(destination: GenderSurveyView()) {
                Text("Next")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationBarTitle("Age", displayMode: .inline)
        .navigationBarBackButtonHidden(false)
        .onDisappear {
            saveAge()
        }
    }
    
    private func saveAge() {
        UserDefaults.standard.set(age, forKey: "userAge")
    }
}

struct AgeSurveyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AgeSurveyView()
        }
    }
}