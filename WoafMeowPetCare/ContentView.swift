//
//  ContentView.swift
//  WoafMeowPetCare
//
//  Created by Marcel Martin on 9/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showARScanner = false
    @State private var showPetAdventure = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    // Header
                    Text("Pet Adventure Mode")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                        .shadow(radius: 5)
                    
                    // Pet Image Placeholder
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 200, height: 200)
                        .overlay(
                            Image(systemName: "pawprint.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .padding(40)
                        )
                        .shadow(radius: 10)
                        .padding(.top, 20)
                        .onTapGesture {
                            // Action for tapping the pet image
                        }
                    
                    // Pet Adventure Button
                    Button(action: {
                        showPetAdventure.toggle()
                    }) {
                        Text("Pet Adventure Mode")
                            .font(.headline)
                            .padding()
                            .frame(width: 250)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .fullScreenCover(isPresented: $showPetAdventure) {
                        PetAdventureView()
                    }
                    
                    // Health Quests and Progress
                    VStack(spacing: 20) {
                        HealthQuestView(title: "Health Quest Progress", progress: 0.6)
                        HealthQuestView(title: "AR Scanner", progress: 0.4)
                            .onTapGesture {
                                showARScanner.toggle()
                            }
                            .fullScreenCover(isPresented: $showARScanner) {
                                ARScannerView()
                            }
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
            }
        }
    }
}

struct HealthQuestView: View {
    var title: String
    var progress: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(width: 300, height: 20)
                    .foregroundColor(.white)
                    .opacity(0.2)
                
                Capsule()
                    .frame(width: progress * 300, height: 20)
                    .foregroundColor(.green)
                    .animation(.easeInOut, value: progress)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
