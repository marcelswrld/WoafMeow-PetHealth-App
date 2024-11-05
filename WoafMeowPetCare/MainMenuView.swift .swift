//
//  MainMenuView.swift .swift
//  WoafMeowPetCare
//
//  Created by Marcel Martin on 9/17/24.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("WoafMeow Pet Care")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                // Add the pixel art image to the main menu
                Image("PixelDogs")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding()
                    .shadow(radius: 5)
                
                // Navigation to Pet Adventure Mode
                NavigationLink(destination: ContentView()) {
                    Text("Pet Adventure Mode")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                // Navigation to AR Scanner
                NavigationLink(destination: ARScannerView()) {
                    Text("AR Scanner")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                // Navigation to Pet Health Form
                NavigationLink(destination: PetHealthFormView()) {
                    Text("Pet Health Data")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .navigationTitle("Main Menu")
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
