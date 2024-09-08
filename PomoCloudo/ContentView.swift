//
//  ContentView.swift
//  PomoCloudo
//
//  Created by Kari Groszewska on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var workingSession = true
    @State var timerOn = false
    //TODO: Override Pomodoro Length with User Preferences
    @State var timeRemaining = 1500
    @State var timeInFocus = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            workingSession ? Color.Focus.background .ignoresSafeArea() : Color.ShortBreak.background .ignoresSafeArea()
               
            VStack{
                Spacer()
                Button(action: {
                    timeRemaining = workingSession ? 1500 : 300
                    timerOn = true
                }, label: {
                    HStack{
                        Text(workingSession ?  Image(systemName: "brain") : Image(systemName: "cup.and.saucer"))
                        Text(workingSession ? "Focus" : "Short Break")
                    }
                    .foregroundStyle(workingSession ? Color.Focus.text : Color.ShortBreak.text)
                    .padding([.top, .bottom], 6)
                    .padding([.leading, .trailing], 10)
                })
                .background(workingSession ? Color.Focus.primaryButton : Color.ShortBreak.primaryButton)
                .clipShape(Capsule())
                .overlay(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(workingSession ? Color.Focus.text : Color.ShortBreak.text)
                )
                .padding(.bottom, -30)

                Text(convertSecondsToTime(timeInSeconds: timeRemaining))
                    .foregroundStyle(workingSession ? Color.Focus.text : Color.ShortBreak.text)
                    .font(.variableFont(210.92, axis: [.weight: 690]))
                    .environment(\._lineHeightMultiple, 0.78)
                    .onReceive(timer) { _ in
                        if timerOn {
                            timeRemaining -= 1
                        }
                    }
                HStack{
                    Button {
                        //TODO: Open up a settings menu
                    } label: {
                        Text(Image(systemName: "ellipsis"))
                            .font(.variableFont(25))
                            .foregroundStyle(workingSession ? Color.Focus.text : Color.ShortBreak.text)
                            .padding(18)
                            .background(workingSession ? Color.Focus.primaryButton : Color.ShortBreak.primaryButton)
                            .clipShape(.buttonBorder)

                    }
                    Button {
                        timerOn.toggle()
                    } label: {
                        Text(Image(systemName: timerOn ? "pause.fill": "play.fill" ))
                            .font(.variableFont(25))
                            .foregroundStyle(workingSession ? Color.Focus.text : Color.ShortBreak.text)
                            .padding(25)
                            .padding([.leading, .trailing], 15)
                            .background(workingSession ? Color.Focus.secondaryButton : Color.ShortBreak.secondaryButton)
                            .clipShape(.buttonBorder)
                    }
                    Button {
                        workingSession.toggle()
                        timeRemaining = workingSession ? 1500 : 300
                        timerOn = false
                    } label: {
                        Text(Image(systemName: "forward.fill"))
                            .font(.variableFont(25))
                            .foregroundStyle(workingSession ? Color.Focus.text : Color.ShortBreak.text)
                            .padding(18)
                            .background(workingSession ? Color.Focus.primaryButton : Color.ShortBreak.primaryButton)
                            .clipShape(.buttonBorder)

                    }
                    
                }
                .padding(.top, -120)
                Spacer()
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

