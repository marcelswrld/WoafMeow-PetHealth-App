//
//  PetAdventureView.swift
//  WoafMeowPetCare
//
//  Created by Marcel Martin on 9/17/24.
//

import SwiftUI

struct PetAdventureView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Pixel art image as a decorative element
                Image("PixelDogs")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding(.vertical)
                    .shadow(radius: 5)
                
                // Quest List
                VStack(spacing: 20) {
                    QuestCardView(
                        title: "Forest Exploration",
                        description: "Explore the mystical forest with your pet to find hidden treasures and magical creatures!",
                        feature: "New Creatures",
                        location: "Mystical Forest",
                        color: .green
                    )
                    
                    QuestCardView(
                        title: "Beach Cleanup",
                        description: "Help clean the beach while discovering rare shells and ocean treasures. Keep the environment safe for all pets!",
                        feature: "Ocean Treasures",
                        location: "Sunny Beach",
                        color: .blue
                    )
                    
                    QuestCardView(
                        title: "Mountain Hiking",
                        description: "Take your pet on an adventurous hike up the mountain. Encounter new challenges and collect rare items along the way!",
                        feature: "Rare Items",
                        location: "Rocky Mountains",
                        color: .brown
                    )
                    
                    QuestCardView(
                        title: "City Scavenger Hunt",
                        description: "Join a scavenger hunt in the bustling city. Find hidden items and meet other pet adventurers!",
                        feature: "Hidden Items",
                        location: "Urban City",
                        color: .purple
                    )
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 20)
        }
        .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Pet Adventure") // Set title for the navigation bar
    }
}

struct PetAdventureView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // Wrap in NavigationView for the preview
            PetAdventureView()
        }
    }
}
