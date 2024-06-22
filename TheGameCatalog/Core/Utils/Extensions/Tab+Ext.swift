//
//  Tab+Ext.swift
//  TheGameCatalog
//
//  Created by Dion Arya Pamungkas on 04/06/24.
//

import SwiftUI

enum Tabs: String {
    case home = "Home"
    case favorite = "Favorite"
    case search = "Search"
<<<<<<< HEAD
    case chat = "Community"
    case profile = "Profile"
=======
>>>>>>> 57cca06173b2b633ded991ec29edba9c801429c4
    @ViewBuilder
    var tabContent: some View {
        switch self {
        case .home:
            Image(systemName: "house")
            Text(self.rawValue)
        case .favorite:
            Image(systemName: "heart")
            Text(self.rawValue)
<<<<<<< HEAD
        case .chat:
            Image(systemName: "person.2")
            Text(self.rawValue)
        case .search:
            Image(systemName: "magnifyingglass")
            Text(self.rawValue)
        case .profile:
            Image(systemName: "person")
            Text(self.rawValue)

=======
        case .search:
            Image(systemName: "magnifyingglass")
            Text(self.rawValue)
>>>>>>> 57cca06173b2b633ded991ec29edba9c801429c4
        }
    }
}
