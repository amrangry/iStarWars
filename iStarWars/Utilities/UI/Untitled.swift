//
//  Untitled.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 17/02/2025.
//

//
//  AddView.swift
//  SwiftUI-Animations
//
//  Created by Shubham Singh on 21/08/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import SwiftUI

struct AddView: View {

    // MARK:- variables
    @State var isAnimating: Bool = false

    // MARK:- views
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ZStack {
                ExpandingView(expand: $isAnimating, direction: .bottom, symbolName: "note.text")
                ExpandingView(expand: $isAnimating, direction: .left, symbolName: "doc")
                ExpandingView(expand: $isAnimating, direction: .top, symbolName: "photo")
                ExpandingView(expand: $isAnimating, direction: .right, symbolName: "mic.fill")
                Image(systemName: "plus")
                    .font(.system(size: 40, weight:  self.isAnimating ? .regular : .semibold, design: .rounded))
                    .foregroundColor(.orange)//(self.isAnimating ? Color.white : Color.black)
                    //.rotationEffect(self.isAnimating ? .degrees(45) : .degrees(0))
                    //.scaleEffect(self.isAnimating ? 3 : 1)
                    //.opacity(self.isAnimating ? 0.5 : 1)
                  //  .animation(Animation.spring(response: 0.35, dampingFraction: 0.85, blendDuration: 1))
                    .animation(.spring(duration: 0.35, bounce: 0.85, blendDuration: 1), value: isAnimating)
                    .onTapGesture {
                        self.isAnimating.toggle()
                    }
            }.frame(height: 300)
                .padding()
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}

enum ExpandDirection {
    case bottom
    case left
    case right
    case top

    var offsets: (CGFloat, CGFloat) {
        switch self {
            case .bottom:
                return (32, 62)
            case .left:
                return (-62, 32)
            case .top:
                return (-32, -62)
            case .right:
                return (62, -32)
        }
    }

    var containerOffset: (CGFloat, CGFloat) {
        switch self {
            case .bottom:
                return (18, 18)
            case .left:
                return (-18, 18)
            case .top:
                return (-18, -18)
            case .right:
                return (18, -18)
        }
    }
}

//
//  ExpandingView.swift
//  SwiftUI-Animations
//
//  Created by Shubham Singh on 22/08/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import SwiftUI

struct ExpandingView: View {

    // MARK:- variables
    @Binding var expand: Bool
    var direction: ExpandDirection
    var symbolName: String

    var body: some View {
        ZStack {
            ZStack {
                Image(systemName: symbolName)
                    .font(.system(size: 32, weight: .medium, design: .rounded))
                    .foregroundColor(Color.black)
                    .padding()
                    .opacity(self.expand ? 0.85 : 0)
                    .scaleEffect(self.expand ? 1: 0)
                    .rotationEffect(self.expand ? .degrees(-43) : .degrees(0))
                    .animation(.easeOut(duration: 0.15), value: expand)
            }
            .frame(width: 82, height: 82)
            .background(Color.white)
            .cornerRadius(self.expand ? 41 : 8)
            .scaleEffect(self.expand ? 1 : 0.5)
            .offset(x: self.expand ? self.direction.offsets.0 : 0, y: self.expand ? self.direction.offsets.1 : 0)
            .rotationEffect(self.expand ? .degrees(43) : .degrees(0))
            .animation(.easeOut(duration: 0.25).delay(0.05), value: expand)
        }.offset(x: self.direction.containerOffset.0, y: self.direction.containerOffset.1)
    }
}

struct ExpandButton_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingView(expand: .constant(true), direction: .bottom, symbolName: "doc.fill")
    }
}
