//
//  ContentView.swift
//  PomoCloudo
//
//  Created by Kari Groszewska on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var timeRemaining = 240
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Color(red: 255/255, green: 242/255, blue: 242/255)
                .ignoresSafeArea()
            Text(convertSecondsToTime(timeInSeconds: timeRemaining))
                .foregroundStyle(Color(red: 71/255, green: 21/255, blue: 21/255))
                .font(.variableFont(210.92, axis: [.weight: 690]))
                .environment(\._lineHeightMultiple, 0.78)
                .onReceive(timer) { _ in
                    timeRemaining -= 1
                }
        }
    }
    
    func convertSecondsToTime(timeInSeconds: Int) -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return (String(format: "%02i\n%02i", minutes, seconds))
    }
}


#Preview {
    ContentView()
}

