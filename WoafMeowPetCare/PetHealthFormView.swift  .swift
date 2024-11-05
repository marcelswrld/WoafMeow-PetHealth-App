//
//  PetHealthFormView.swift  .swift
//  WoafMeowPetCare
//
//  Created by Marcel Martin on 9/17/24.
//

import SwiftUI

struct PetHealthFormView: View {
    @State private var petName: String = ""
    @State private var petAge: Int = 1
    @State private var petBreed: String = ""
    @State private var petWeight: Double = 5.0
    @State private var petActivityLevel: String = "Moderate"
    @State private var showRecommendations = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Pet Information")) {
                    TextField("Pet Name", text: $petName)
                    
                    Stepper(value: $petAge, in: 1...20) {
                        Text("Age: \(petAge) years")
                    }
                    
                    TextField("Breed", text: $petBreed)
                    
                    Stepper(value: $petWeight, in: 1...100, step: 0.5) {
                        Text("Weight: \(petWeight, specifier: "%.1f") kg")
                    }
                    
                    Picker("Activity Level", selection: $petActivityLevel) {
                        Text("Low").tag("Low")
                        Text("Moderate").tag("Moderate")
                        Text("High").tag("High")
                    }
                }
                
                Button(action: {
                    showRecommendations.toggle()
                }) {
                    Text("Get Recommendations")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showRecommendations) {
                    PersonalizedRecommendationsView(
                        petName: petName,
                        petAge: petAge,
                        petBreed: petBreed,
                        petWeight: petWeight,
                        petActivityLevel: petActivityLevel
                    )
                }
            }
            .navigationTitle("Pet Health Data")
        }
    }
}

struct PetHealthFormView_Previews: PreviewProvider {
    static var previews: some View {
        PetHealthFormView()
    }
}
