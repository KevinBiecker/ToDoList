//
//  RowView.swift
//  ToDoList
//
//  Created by Kevin biecker on 3/16/22.
//

import SwiftUI

struct RowView: View {
    @State var item: Inputs
    
    var body: some View {
        HStack{
            Button(action: {
                item.isCompleted.toggle()
            }, label: {
                if(item.isCompleted == false){
                    Image(systemName: "circle")
                }
                else{
                    Image(systemName: "circle.fill")
                }
            })
            Text(item.title)
        }
    }
}


struct RowView_Previews: PreviewProvider {
    
    static var item1 = Inputs(title: "my to do for today.", isCompleted: true)
    static var item2 = Inputs(title: "What I have to do tomorrow.", isCompleted: false)
    
    static var previews: some View {
        Group{
            RowView(item: item1)
            RowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
