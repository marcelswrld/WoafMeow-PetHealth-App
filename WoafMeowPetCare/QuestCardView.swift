//
//  QuestCardView.swift
//  WoafMeowPetCare
//
//  Created by Marcel Martin on 9/17/24.
//

import SwiftUI

struct QuestCardView: View {
    var title: String
    var description: String
    var feature: String
    var location: String
    var color: Color
    
    @State private var showDetails = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(location)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .opacity(0.8)
                }
                
                Spacer()
                
                Text(feature)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(5)
            }
            
            // Quest Description and Animation
            if showDetails {
                Text(description)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.top, 5)
                    .transition(.slide)
                    .animation(.easeInOut(duration: 0.5), value: showDetails)
            }
            
            // Show Details Button
            Button(action: {
                withAnimation {
                    showDetails.toggle()
                }
            }) {
                Text(showDetails ? "Hide Details" : "Show Details")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.top, 5)
            }
        }
        .padding()
        .background(color.opacity(0.7))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct QuestCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestCardView(
            title: "Forest Exploration",
            description: "Explore the mystical forest with your pet to find hidden treasures and magical creatures!",
            feature: "New Creatures",
            location: "Mystical Forest",
            color: .green
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

