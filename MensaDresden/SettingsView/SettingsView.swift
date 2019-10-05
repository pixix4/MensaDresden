import SwiftUI

struct SettingsView: View {
    @State var testToggle = true

    var body: some View {
        List {
            Section(header: Text("Deselect any ingredients you don't want to eat. Meals known to be containing them will be grayed out.")) {
                ForEach(Ingredient.allCases, id: \.self) { ingredient in
                    HStack {
                        Text(LocalizedStringKey(String(describing: ingredient)))
                        Spacer()
                        Toggle(isOn: self.$testToggle) { EmptyView() }
                    }
                }
            }
            Section(header: Text("Same goes for allergens. Uncheck anything you don't want in your food.")) {
                ForEach(Allergen.allCases, id: \.self) { allergen in
                    HStack {
                        Text(LocalizedStringKey(String(describing: allergen)))
                        Spacer()
                        Toggle(isOn: self.$testToggle) { EmptyView() }
                    }
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
