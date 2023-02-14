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
    @Published var circleScore = 0
    @Published var crossesScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Draw"
    
    init() {
        resetBoard()
    }
    
    // Places the appropriate Cell when tapped
    func placeTile(_ row: Int, _ column: Int) {
        // If board is not empty return
        if(board[row][column].tile != Tile.Empty) {
            return
        }
        
        // Toggling between Cross and Circle when tapped
        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Circle
        
        if(checkForVictory()) {
            if(turn == Tile.Cross) {
                crossesScore += 1
            } else {
                circleScore += 1
            }
            
            let winner = turn == Tile.Cross ? "Crosses" : "Circles"
            alertMessage = winner + " Win!"
            showAlert = true
        } else {
            turn = turn == Tile.Cross ? Tile.Circle : Tile.Cross
        }
    }
    
    func checkForVictory() -> Bool {
        // Vertical victories
        if isTurnTile(0, 0) && isTurnTile(1, 0) && isTurnTile(2, 0) {
            return true
        }
        if isTurnTile(0, 1) && isTurnTile(1, 1) && isTurnTile(2, 1) {
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 2) && isTurnTile(2, 2) {
            return true
        }
        
        // Horizontal Victories
        if isTurnTile(0, 0) && isTurnTile(0, 1) && isTurnTile(0, 2) {
            return true
        }
        if isTurnTile(1, 0) && isTurnTile(1, 1) && isTurnTile(1, 2) {
            return true
        }
        if isTurnTile(2, 0) && isTurnTile(2, 1) && isTurnTile(2, 2) {
            return true
        }
        
        // Diagonal Victories
        if isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2) {
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 0) {
            return true
        }
        return false
    }
    
    func isTurnTile(_ row: Int, _ column: Int) -> Bool {
        return board[row][column].tile == turn
    }
    
    // Resets the game  board
    func resetBoard() {
        var newBoard = [[Cell]]()
        
        // Creates the rows and columns for the board and sets them to Empty
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
