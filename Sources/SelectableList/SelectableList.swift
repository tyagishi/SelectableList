//
//  SelectableList.swift
//  ClockClipSwiftUI
//
//  Created by Tomoaki Yagishita on 2020/03/20.
//  Copyright © 2020 SmallDeskSoftware. All rights reserved.
//

import SwiftUI

public struct SelectableList<T:Comparable & Hashable, Content>: View  where Content: View{
    public var content:[T]
    @Binding var selectedItem:T?
    public var rowCell:(T)-> Content
    public var selectionAction:(_ item: T)->Void
    
    public init(content: [T], selectedItem: Binding<T?>, @ViewBuilder rowCell: @escaping ((T) -> Content) , selectionAction: @escaping( (T)->Void) ) {
        self.content = content
        self._selectedItem = selectedItem
        self.rowCell = rowCell
        self.selectionAction = selectionAction
    }
    
    public var body: some View {
        List {
            ForEach(content, id: \.self) { item in
                SelectableCell(item: item, selectedItem: self.$selectedItem,
                               rowCell: self.rowCell, selectionAction: self.selectionAction)
            }
        }
    }
}

public struct SelectableCell<T:Comparable, Content> : View where Content: View {
    public var item: T
    @Binding var selectedItem: T?
    public var rowCell:(T)->Content
    public var selectionAction:(_ selected: T)->Void

    public var body: some View {
        HStack {
            if ( item == selectedItem ) {
#if os(iOS) || os(watchOS) || os(tvOS)
                Image(systemName: "checkmark").foregroundColor(.accentColor)
#elseif os(OSX)
                Text("✔️")
#endif
            }
            Spacer()
            self.rowCell(self.item)
            Spacer()
        } .onTapGesture {
            self.selectedItem = self.item
            self.selectionAction(self.item)
        }
    }
}

struct SelectableList_Previews: PreviewProvider {
    @State static var contentExample = ["test1", "test2"]
    @State static var selectedString:String? = "test1"
    static var previews: some View {
        SelectableList(content: contentExample, selectedItem: $selectedString, rowCell: { item in
            HStack{
            Text("new Celltype!")
            Text(item)
            }
                }
            , selectionAction: { item in
                print("selected \(item)")
        })
    }
}
