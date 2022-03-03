//
//  CourseListView.swift
//  Tv School
//
//  Created by sergio shaon on 3/3/22.
//

import SwiftUI

struct CourseListView: View {
    @State private var show = false
    @State private var show2 = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                CourseView(show: $show)
                GeometryReader { geo in
                    CourseView(show: $show2)
                        .offset( y:  show2 ? -geo.frame(in: .global).minY : 0)
                }
                .frame(height: show2 ? UIScreen.main.bounds.height : 285)
                .frame(maxWidth: show2 ? .infinity : UIScreen.main.bounds.width - 60)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}

struct CourseView: View {
    @Binding var show: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            textUnderCard
            cardUpFront
        }
        .ignoresSafeArea()
        .animation(.spring(), value: UUID())
    }
    
    var cardUpFront: some View{
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 8){
                    Text("SwiftUI Advanced")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white )
                    Text("20 Sections")
                        .foregroundColor(.white.opacity(0.6))
                }
                Spacer()
                ZStack {
                    Image("Logo1")
                        .opacity(show ? 0 : 1)
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                        .frame(width: 35, height: 35)
                        .shadow(radius: 5)
                        .offset(x: 10)
                        .transition(.move(edge: .trailing))
                }
            }
            Spacer()
            Image("Card5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 180)
        }
        .padding(show ? 20 : 10)
        .padding(show ? 30 : 0)
        .frame(maxWidth: show ? .infinity : UIScreen.main.bounds.width - 60, maxHeight: show ? 465 : 285)
        .ignoresSafeArea()
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .blue.opacity(0.3), radius: 20, x: 0, y: 20 )
        .onTapGesture {
            show.toggle()
        }
    }
    var textUnderCard: some View{
        VStack(alignment: .leading, spacing: 32){
            Text("Take your SwiftUI app to the app store with advance technique like live API data and CMS")
            Text("About this course")
                .font(.title)
                .bold()
            Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text")
            Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed.")
            Spacer()
        }
        .padding(20)
        .frame(maxWidth: show ? .infinity : UIScreen.main.bounds.width - 60, maxHeight: show ? .infinity : 285, alignment: .top)
        .offset(y: show ? 465 : 0)
        .animation(.spring(), value: UUID())
    }
}
