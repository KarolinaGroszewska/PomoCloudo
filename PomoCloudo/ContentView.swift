//
//  ContentView.swift
//  PomoCloudo
//
//  Created by Kari Groszewska on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var userStatus: Status
    @State var timerOn = false
    //TODO: Override Pomodoro Length with User Preferences
        @State var timeRemaining = 1500
    @State var numPomos = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @ViewBuilder func returnView(status: Status) -> some View {
        switch(userStatus){
        case .focus:
            ZStack {
                Color.Focus.background.ignoresSafeArea()
                VStack{                    
                    Spacer()
                    Button(action: {
                        timeRemaining = 1500
                    }, label: {
                        Text(Image(systemName: "brain"))
                        Text("Focus")
                        
                    }).foregroundStyle(Color.Focus.text)
                        .padding([.top, .bottom], 6)
                        .padding([.leading, .trailing], 10)
                        .background(Color.Focus.primaryButton)
                        .clipShape(Capsule())
                        .overlay(
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke(Color.Focus.text)
                        )
                        .padding(.bottom, -30)
                    Text(convertSecondsToTime(timeInSeconds: timeRemaining))
                        .foregroundStyle(Color.Focus.text)
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
                                .foregroundStyle(Color.Focus.text)
                                .padding(18)
                                .background(Color.Focus.primaryButton)
                                .clipShape(.buttonBorder)
                            
                        }
                        Button {
                            timerOn.toggle()
                        } label: {
                            Text(Image(systemName: timerOn ? "pause.fill": "play.fill" ))
                                .font(.variableFont(25))
                                .foregroundStyle(Color.Focus.text)
                                .padding(25)
                                .padding([.leading, .trailing], 15)
                                .background(Color.Focus.secondaryButton)
                                .clipShape(.buttonBorder)
                        }
                        Button {
                            numPomos += 1
                            if numPomos % 4 == 0 {
                                userStatus = .longBreak
                                timeRemaining = 900
                            } else {
                                userStatus = .shortBreak
                                timeRemaining = 300
                            }
                            timerOn = false
                        } label: {
                            Text(Image(systemName: "forward.fill"))
                                .font(.variableFont(25))
                                .foregroundStyle(Color.Focus.text)
                                .padding(18)
                                .background(Color.Focus.primaryButton)
                                .clipShape(.buttonBorder)
                        }
                    }
                    .padding(.top, -120)
                    Spacer()
                }
            }
        case .shortBreak:
             ZStack {
                Color.ShortBreak.background.ignoresSafeArea()
                 VStack{
                     Spacer()
                     Button(action: {
                         timeRemaining = 300
                     }, label: {
                         Text(Image(systemName: "cup.and.saucer"))
                         Text("Short Break")
                         
                     }).foregroundStyle(Color.ShortBreak.text)
                         .padding([.top, .bottom], 6)
                         .padding([.leading, .trailing], 10)
                         .background(Color.ShortBreak.primaryButton)
                         .clipShape(Capsule())
                         .overlay(
                             RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                 .stroke(Color.ShortBreak.text)
                         )
                         .padding(.bottom, -30)
                     Text(convertSecondsToTime(timeInSeconds: timeRemaining))
                         .foregroundStyle(Color.ShortBreak.text)
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
                                 .foregroundStyle(Color.ShortBreak.text)
                                 .padding(18)
                                 .background(Color.ShortBreak.primaryButton)
                                 .clipShape(.buttonBorder)
                             
                         }
                         Button {
                             timerOn.toggle()
                         } label: {
                             Text(Image(systemName: timerOn ? "pause.fill": "play.fill" ))
                                 .font(.variableFont(25))
                                 .foregroundStyle(Color.ShortBreak.text)
                                 .padding(25)
                                 .padding([.leading, .trailing], 15)
                                 .background(Color.ShortBreak.secondaryButton)
                                 .clipShape(.buttonBorder)
                         }
                         Button {
                             userStatus = .focus
                             timeRemaining = 1500
                             timerOn = false
                         } label: {
                             Text(Image(systemName: "forward.fill"))
                                 .font(.variableFont(25))
                                 .foregroundStyle(Color.ShortBreak.text)
                                 .padding(18)
                                 .background(Color.ShortBreak.primaryButton)
                                 .clipShape(.buttonBorder)
                         }
                     }
                     .padding(.top, -120)
                     Spacer()
                 }
            }
        case .longBreak:
            ZStack {
                Color.LongBreak.background.ignoresSafeArea()
                VStack{
                    Spacer()
                    Button(action: {
                        timeRemaining = 900
                    }, label: {
                        Text(Image(systemName: "cup.and.saucer"))
                        Text("Long Break")
                        
                    }).foregroundStyle(Color.LongBreak.text)
                        .padding([.top, .bottom], 6)
                        .padding([.leading, .trailing], 10)
                        .background(Color.LongBreak.primaryButton)
                        .clipShape(Capsule())
                        .overlay(
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke(Color.LongBreak.text)
                        )
                        .padding(.bottom, -30)
                    Text(convertSecondsToTime(timeInSeconds: timeRemaining))
                        .foregroundStyle(Color.LongBreak.text)
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
                                .foregroundStyle(Color.LongBreak.text)
                                .padding(18)
                                .background(Color.LongBreak.primaryButton)
                                .clipShape(.buttonBorder)
                            
                        }
                        Button {
                            timerOn.toggle()
                        } label: {
                            Text(Image(systemName: timerOn ? "pause.fill": "play.fill" ))
                                .font(.variableFont(25))
                                .foregroundStyle(Color.LongBreak.text)
                                .padding(25)
                                .padding([.leading, .trailing], 15)
                                .background(Color.LongBreak.secondaryButton)
                                .clipShape(.buttonBorder)
                        }
                        Button {
                            userStatus = .focus
                            timeRemaining = 1500
                            timerOn = false
                        } label: {
                            Text(Image(systemName: "forward.fill"))
                                .font(.variableFont(25))
                                .foregroundStyle(Color.LongBreak.text)
                                .padding(18)
                                .background(Color.LongBreak.primaryButton)
                                .clipShape(.buttonBorder)
                        }
                    }
                    .padding(.top, -120)
                    Spacer()
                }
            }
            
        }
    }
    var body: some View {
        returnView(status: userStatus)
    }
//        ZStack{
//            switch (userStatus){
//            case .focus:
//                Color.Focus.background.ignoresSafeArea()
//            case .shortBreak:
//                Color.ShortBreak.background.ignoresSafeArea()
//            case .longBreak:
//                Color.LongBreak.background.ignoresSafeArea()
//            }
//               
//            VStack{
//                Spacer()
//                Button(action: {
//                    switch (userStatus){
//                    case .focus:
//                        timeRemaining = 1500
//                    case .shortBreak:
//                        timeRemaining = 300
//                    case .longBreak:
//                        timeRemaining = 900
//                    }
//                    timerOn = true
//                }, label: {
//                    HStack{
//                        Text(userStatus ?  Image(systemName: "brain") : Image(systemName: "cup.and.saucer"))
//                        Text(userStatus ? "Focus" : "Short Break")
//                    }
//                    .foregroundStyle(userStatus ? Color.Focus.text : Color.ShortBreak.text)
//                    .padding([.top, .bottom], 6)
//                    .padding([.leading, .trailing], 10)
//                })
//                .background(userStatus ? Color.Focus.primaryButton : Color.ShortBreak.primaryButton)
//                .clipShape(Capsule())
//                .overlay(
//                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//                        .stroke(userStatus ? Color.Focus.text : Color.ShortBreak.text)
//                )
//                .padding(.bottom, -30)
//
//                Text(convertSecondsToTime(timeInSeconds: timeRemaining))
//                    .foregroundStyle(userStatus ? Color.Focus.text : Color.ShortBreak.text)
//                    .font(.variableFont(210.92, axis: [.weight: 690]))
//                    .environment(\._lineHeightMultiple, 0.78)
//                    .onReceive(timer) { _ in
//                        if timerOn {
//                            timeRemaining -= 1
//                        }
//                    }
//                HStack{
//                    Button {
//                        //TODO: Open up a settings menu
//                    } label: {
//                        Text(Image(systemName: "ellipsis"))
//                            .font(.variableFont(25))
//                            .foregroundStyle(userStatus ? Color.Focus.text : Color.ShortBreak.text)
//                            .padding(18)
//                            .background(userStatus ? Color.Focus.primaryButton : Color.ShortBreak.primaryButton)
//                            .clipShape(.buttonBorder)
//
//                    }
//                    Button {
//                        timerOn.toggle()
//                    } label: {
//                        Text(Image(systemName: timerOn ? "pause.fill": "play.fill" ))
//                            .font(.variableFont(25))
//                            .foregroundStyle(userStatus ? Color.Focus.text : Color.ShortBreak.text)
//                            .padding(25)
//                            .padding([.leading, .trailing], 15)
//                            .background(userStatus ? Color.Focus.secondaryButton : Color.ShortBreak.secondaryButton)
//                            .clipShape(.buttonBorder)
//                    }
//                    Button {
//                        userStatus.toggle()
//                        timeRemaining = userStatus ? 1500 : 300
//                        timerOn = false
//                    } label: {
//                        Text(Image(systemName: "forward.fill"))
//                            .font(.variableFont(25))
//                            .foregroundStyle(userStatus ? Color.Focus.text : Color.ShortBreak.text)
//                            .padding(18)
//                            .background(userStatus ? Color.Focus.primaryButton : Color.ShortBreak.primaryButton)
//                            .clipShape(.buttonBorder)
//
//                    }
//                    
//                }
//                .padding(.top, -120)
//                Spacer()
//            }
//        }
//    }

    func convertSecondsToTime(timeInSeconds: Int) -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return (String(format: "%02i\n%02i", minutes, seconds))
    }
}


#Preview {
    ContentView(userStatus: .focus)
}

