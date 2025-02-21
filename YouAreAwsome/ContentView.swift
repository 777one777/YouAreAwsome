//
//  ContentView.swift
//  YouAreAwsome
//
//  Created by Student2 on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1 // lastMessageNumber will never be -1
    @State private var lastImageNumber = -1
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default,value: imageName)
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You are Awesome!",
                                "When the Genius Bar Needs Help, They Call You!",
                                "You are Great!",
                                "You are Fantastic!",
                                "Fabulous? That's You!",
                                "You make me Smile!"]
                
                // generate a random messageNumber to use an index
                // if messageNumber == lastMessageNumber {
                //  keep generating a new random messageNumber
                //  until you get a messageNumber != lastMessageNumber
                // set messageString to messages[messageNumber]
                // update the LastMessageNumber with messageNumber
                
                var messageNumber = Int.random(in: 1...messages.count-1)
                while messageNumber == lastMessageNumber {
                    messageNumber = Int.random(in: 0...messages.count-1)
                }
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
               // imageName = "image\(Int.random(in: 0...9))"
                var imageNumber = Int.random(in: 0...9)
                while imageNumber == lastImageNumber {
                    imageNumber = Int.random(in: 0...9)
                }
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)        }
        
        .padding()
        
    }
}

#Preview {
    ContentView()
}
