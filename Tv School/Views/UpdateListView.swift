//
//  UpdateList.swift
//  Tv School
//
//  Created by sergio shaon on 27/2/22.
//

import SwiftUI

struct UpdateListView: View {
    @StateObject var updateListVM = UpdateViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(updateListVM.update){ item in
                    NavigationLink {
                        UpdateDetailVIew(itemContent: item)
                    } label: {
                        HStack {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 75, height: 75)
                                .background(.black)
                                .cornerRadius(10)
                                .padding(.trailing, 6)
                            VStack(alignment: .leading){
                                Text(item.title)
                                    .font(.title)
                                    .bold()
                                
                                Text(item.text)
                                    .font(.subheadline)
                                    .foregroundColor(Color.black.opacity(0.5))
                                    .lineLimit(2)
                                Text(item.date)
                                    .font(.caption)
                                    .foregroundColor(Color.secondary)
                                    .bold()
                                
                            }
                        }
                        .padding(.top, 5)
                    }
                    .navigationBarTitle("SwiftUI")
                    .navigationBarItems(
                        leading: Button {
                            updateListVM.addUpdate()
                        } label: {
                            Text("Add Update")
                        },
                        trailing: EditButton()
                    )
                }
                .onDelete { index in
                    updateListVM.update.remove(at: index.first!)
                }
            }
        }
    }
}

struct UpdateListView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateListView()
    }
}
