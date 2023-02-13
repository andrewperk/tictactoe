//
//  Cell.swift
//  tictactoe
//
//  Created by Andrew L Perkins on 2/13/23.
//

import Foundation

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
}

enum Tile {
    case Circle
    case Cross
    case Empty
}
