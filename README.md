# SelectableList

SwiftUIのリストだと選択されていることがわかりにくいと思ったので、作りました。

![こんな感じです](https://github.com/tyagishi/SelectableList/image.png "利用イメージ")

コードイメージ：
'''
struct ContentView: View {
    let data = ["item1", "item2", "item3", "item4"]
    @State private var selected:String?
    var body: some View {
        VStack{
            SelectableList(content: data, selectedItem: $selected, rowCell: { item -> Text in
                    Text(item)
                }
                , selectionAction: { item in
                    print("\(item) selected")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
'''
