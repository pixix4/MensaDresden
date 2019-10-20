import SwiftUI

struct FavoriteCanteensSetting: View {
    @EnvironmentObject var settings: Settings

    func deleteFavorite(at offsets: IndexSet) {
        for idx in offsets {
            settings.favoriteCanteens.remove(at: idx)
        }
    }

    func moveFavorites(fromOffsets offsets: IndexSet, toOffset offset: Int) {
        settings.favoriteCanteens.move(fromOffsets: offsets, toOffset: offset)
    }

    var body: some View {
        List {
            Section(footer: Text("settings.favorite-canteens-description")) {
                ForEach(settings.favoriteCanteens, id: \.self) { favorite in
                    Text(favorite)
                }
                .onMove(perform: moveFavorites(fromOffsets:toOffset:))
                .onDelete(perform: deleteFavorite(at:))
            }
        }
        .navigationBarItems(trailing: EditButton())
    }
}

struct FavoriteCanteensSetting_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCanteensSetting()
    }
}