//
//  ARScannerView.swift
//  WoafMeowPetCare
//
//  Created by Marcel Martin on 9/17/24.
//

import SwiftUI

struct ARScannerView: View {
    @State private var scanInProgress = false
    @State private var score = 0
    @State private var foundItems: [String] = []
    @State private var showAchievement = false
    private let itemsToFind = ["Golden Retriever", "Siamese Cat", "Shiba Inu", "Persian Cat"]
    
    var body: some View {
        ZStack {
            // Background Gradient for Visual Appeal
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Header
                Text("AR Scanner")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                Spacer()
                
                // Pixel Art Image as a decorative element
                Image("PixelDogs")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding()
                    .shadow(radius: 5)
                
                // Placeholder for AR Content
                Image(systemName: scanInProgress ? "camera.viewfinder" : "pawprint.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.white)
                    .padding()
                    .rotationEffect(.degrees(scanInProgress ? 360 : 0))
                    .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: scanInProgress)
                
                // Scan Button
                Button(action: {
                    scanInProgress.toggle()
                    if scanInProgress {
                        performScan()
                    }
                }) {
                    Text(scanInProgress ? "Stop Scanning" : "Start Scanning")
                        .font(.headline)
                        .padding()
                        .background(scanInProgress ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                // Score and Found Items
                VStack {
                    Text("Score: \(score)")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("Found Items:")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    ForEach(foundItems, id: \.self) { item in
                        Text(item)
                            .foregroundColor(.white)
                            .padding(.top, 2)
                    }
                }
                
                Spacer()
                
                // Show Achievement
                if showAchievement {
                    Text("Achievement Unlocked!")
                        .font(.headline)
                        .foregroundColor(.yellow)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                        .transition(.opacity)
                        .animation(.easeInOut, value: showAchievement)
                }
            }
            .padding()
        }
    }
    
    // Function to Simulate Scanning
    private func performScan() {
        if let foundItem = itemsToFind.randomElement(), !foundItems.contains(foundItem) {
            foundItems.append(foundItem)
            score += 10
            if foundItems.count == itemsToFind.count {
                showAchievement = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showAchievement = false
                }
            }
        }
    }
}
