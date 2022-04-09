import SwiftUI

struct CourseListView: View {
    @State private var courses = courseData
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30){
                Text("Courses")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                ForEach(courses.indices, id: \.self) { itemIndex in
                    GeometryReader { geo in
                        CourseView(show: $courses[itemIndex].show, course: courses[itemIndex])
                            .offset(y: courses[itemIndex].show ? -geo.frame(in: .global).minY : 0 )
                    }
                    .frame(height: courses[itemIndex].show ? UIScreen.main.bounds.height : 285)
                }
            }
        }
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}

struct CourseView: View {
    @Binding var show: Bool
    var course: CourseListModel
    
    var body: some View {
        ZStack(alignment: .top) {
            textUnderCard
            cardUpFront
        }
        .frame(width: UIScreen.main.bounds.width)
        .animation(.spring(), value: UUID())
    }
    
    var cardUpFront: some View{
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 8){
                    Text(course.title)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white )
                    Text(course.subString)
                        .foregroundColor(.white.opacity(0.6))
                }
                Spacer()
                ZStack {
                    course.logo
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
            course.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 180)
        }
        .padding(show ? 30 : 20)
        .padding(show ? 30 : 0)
        .frame(maxWidth: show ? .infinity : UIScreen.main.bounds.width - 60, maxHeight: show ? 450 : 280)
        .ignoresSafeArea()
        .background(course.color)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: course.color.opacity(0.3), radius: 10, x: 10, y: 0 )
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
