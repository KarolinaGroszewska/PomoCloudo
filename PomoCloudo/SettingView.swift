//
//  SettingView.swift
//  PomoCloudo
//
//  Created by Kari Groszewska on 9/10/24.
//

import SwiftUI

struct SettingView: View {
    @State var focusLength = 25
    @State var userStatus: Status
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        switch userStatus {
        case .focus:
            ZStack{
                Color.Focus.background
                    .ignoresSafeArea()
                VStack{
                    HStack {
                        Text("Settings")
                            .foregroundStyle(Color.Focus.text)
                            .font(.variableFont(24, axis: [.weight: 500]))
                            .padding(.leading, 25)
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text(Image(systemName: "xmark"))
                        })
                        .foregroundStyle(Color.Focus.text)
                        .font(.variableFont(15, axis: [.weight: 400]))
                        .padding(.trailing, 25)
                    }
                    Spacer()
                    Stepper(value: $focusLength) {
                        Text("Focus Length:  \(focusLength)")
                    }
                    .padding([.leading, .trailing], 25)
                }
            }
        case .shortBreak:
            ZStack{
                Color.ShortBreak.background
                    .ignoresSafeArea()
                VStack{
                    HStack {
                        Text("Settings")
                            .foregroundStyle(Color.ShortBreak.text)
                            .font(.variableFont(24, axis: [.weight: 500]))
                            .padding(.leading, 25)
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text(Image(systemName: "xmark"))
                        })
                        .foregroundStyle(Color.ShortBreak.text)
                        .font(.variableFont(15, axis: [.weight: 400]))
                        .padding(.trailing, 25)
                    }
                    Spacer()
                    Stepper(value: $focusLength) {
                        Text("Focus Length:  \(focusLength)")
                    }
                    .padding([.leading, .trailing], 25)
                }
            }
        case .longBreak:
            ZStack{
                Color.LongBreak.background
                    .ignoresSafeArea()
                VStack{
                    HStack {
                        Text("Settings")
                            .foregroundStyle(Color.LongBreak.text)
                            .font(.variableFont(24, axis: [.weight: 500]))
                            .padding(.leading, 25)
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text(Image(systemName: "xmark"))
                        })
                        .foregroundStyle(Color.LongBreak.text)
                        .font(.variableFont(15, axis: [.weight: 400]))
                        .padding(.trailing, 25)
                    }
                    Spacer()
                    Stepper(value: $focusLength) {
                        Text("Focus Length:  \(focusLength)")
                    }
                    .padding([.leading, .trailing], 25)
                }
            }
        }
    }
}

#Preview {
    SettingView(userStatus: .focus)
}
