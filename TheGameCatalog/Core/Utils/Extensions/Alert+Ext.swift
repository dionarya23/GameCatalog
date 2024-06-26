//
//  Alert+Ext.swift
//  TheGameCatalog
//
//  Created by Dion Arya Pamungkas on 08/06/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}
