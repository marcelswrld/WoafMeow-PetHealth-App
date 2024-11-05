//
//  PersonalizedRecommendationsView.swift  .swift
//  WoafMeowPetCare
//
//  Created by Marcel Martin on 9/17/24.
//

import SwiftUI

struct PersonalizedRecommendationsView: View {
    var petName: String
    var petAge: Int
    var petBreed: String
    var petWeight: Double
    var petActivityLevel: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Personalized Recommendations for \(petName)")
                    .font(.largeTitle)
                    .padding(.top)
                
                // Customized Exercise Routine
                ExerciseRoutineView(activityLevel: petActivityLevel)
                
                // Customized Diet Plan
                DietPlanView(weight: petWeight, activityLevel: petActivityLevel)
            }
            .padding()
        }
    }
}

struct ExerciseRoutineView: View {
    var activityLevel: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Customized Exercise Routine")
                .font(.headline)
            
            if activityLevel == "Low" {
                Text("• Light walks twice a day for 15 minutes.")
                Text("• Gentle playtime with toys for 10 minutes.")
            } else if activityLevel == "Moderate" {
                Text("• Moderate walks or jogs for 30 minutes daily.")
                Text("• Play fetch or interactive games for 20 minutes.")
            } else {
                Text("• High-energy runs or hikes for 45 minutes.")
                Text("• Agility training or advanced playtime for 30 minutes.")
            }
        }
        .padding()
        .background(Color.orange.opacity(0.2))
        .cornerRadius(10)
    }
}

struct DietPlanView: View {
    var weight: Double
    var activityLevel: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Customized Diet Plan")
                .font(.headline)
            
            Text("Recommended Daily Caloric Intake:")
                .bold()
            Text("\(calculateCaloricIntake(weight: weight, activityLevel: activityLevel)) kcal")
            
            Text("Suggested Meal Plan:")
            if activityLevel == "Low" {
                Text("• 50% protein, 25% fiber, 25% fat")
                Text("• Include foods like chicken, carrots, and brown rice")
            } else if activityLevel == "Moderate" {
                Text("• 60% protein, 20% fiber, 20% fat")
                Text("• Include foods like beef, sweet potatoes, and oats")
            } else {
                Text("• 70% protein, 15% fiber, 15% fat")
                Text("• Include foods like salmon, spinach, and quinoa")
            }
        }
        .padding()
        .background(Color.green.opacity(0.2))
        .cornerRadius(10)
    }
    
    // Calculate recommended daily caloric intake
    func calculateCaloricIntake(weight: Double, activityLevel: String) -> Int {
        let baseCalories = weight * 30
        switch activityLevel {
        case "Low":
            return Int(baseCalories * 0.8)
        case "Moderate":
            return Int(baseCalories * 1.0)
        case "High":
            return Int(baseCalories * 1.2)
        default:
            return Int(baseCalories)
        }
    }
}

struct PersonalizedRecommendationsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalizedRecommendationsView(petName: "Buddy", petAge: 3, petBreed: "Golden Retriever", petWeight: 20.0, petActivityLevel: "Moderate")
    }
}
