//
//  Cell.swift
//  tictactoe
//
//  Created by Andrew L Perkins on 2/13/23.
//

import Foundation
import SwiftUI

struct Cell {
    var tile: Tile
    
    func displayTile() -> String {
        switch(tile) {
            case Tile.Circle:
                return "O"
            case Tile.Cross:
                return "X"
            default:
                return ""
        }
    }
    
    func tileColor() -> Color {
        switch(tile) {
            case Tile.Circle:
                return Color.red
            case Tile.Cross:
                return Color.black
            default:
                return Color.black
        }
    }
}

enum Tile {
    case Circle
    case Cross
    case Empty
}
