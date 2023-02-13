//
//  GameState.swift
//  tictactoe
//
//  Created by Andrew L Perkins on 2/13/23.
//

import Foundation

class GameState: ObservableObject {
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross
    
    init() {
        resetBoard()
    }
    
    func placeTile(_ row: Int, _ column: Int) {
        if(board[row][column].tile != Tile.Empty) {
            return
        }
        
        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Circle
    }
    
    func resetBoard() {
        var newBoard = [[Cell]]()
        
        for _ in 0...2 {
            var row = [Cell]()
            for _ in 0...2 {
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
}
