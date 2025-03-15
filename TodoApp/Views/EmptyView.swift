//
//  EmptyView.swift
//  TodoApp
//
//  Created by Mai Thinh on 15/3/25.
//

import SwiftUI

struct EmptyView: View {
    @State var animate: Bool = false;
    var body: some View {
        ScrollView {
            VStack {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!" )
                NavigationLink(destination: AddTodoView(), label: {
                    Text("Add something 🤑")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.secondaryAccent : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .shadow(
                    color: animate ? Color.secondaryAccent.opacity(
                        0.7
                    ) : Color.accentColor.opacity(
                        0.7
                    ),
                    radius: 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        EmptyView()
    }
    .navigationTitle("Test")
}
