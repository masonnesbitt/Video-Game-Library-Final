//
//  Library.swift
//  Video Game Library FINAL
//
//  Created by Mason Nesbitt on 9/6/18.
//  Copyright © 2018 Mason Nesbitt. All rights reserved.
//

import Foundation

class Library{
    
    //Variables that are Library Class specific that can only be changed from within Library
    private var games = [
        Game(title: "Call of Duty"),
        Game(title: "No Man's Sky"),
        Game(title: "Destiny")]
    
    
    //State variables that determine if a game is available or not
    var unavailableGames: [Game] {
        return games.filter {$0.dueDate == nil!}
    }
    
    var availableGames: [Game] {
        return games.filter {$0.dueDate == nil}
    }
    
    //Mark:- Functions for Library
    func addGame() {
        print("Please enter name of game to be added")
        let title = getInput()
        let game = Game(title: title)
        
        games.append(game)
    }
    
    func removeGame() {
        games.printElements()
        
        let index = getIndex(maxIndex: games.count)
        
        games.remove(at: index)
    }
    
    func listAvailableGames() {
        availableGames.printElements()
    }
    
    func listUnavailableGames() {
        for game in unavailableGames {
            print(game.title)
            
            if let dueDate = game.dueDate {
                let dateFormatter = DateFormatter()
                print("This game is due on: \(dateFormatter.string(from: dueDate)).")
            }
        }
    }
    
        func checkGameOut() {
            availableGames.printElements()
            
            print("Please enter the index of the video game you would like to check out")
            
            let game = availableGames[getIndex(maxIndex: availableGames.count)]
            let currentCalender = Calendar.current
            let dueDate = currentCalender.date(byAdding: .day, value: 14, to: Date())
            game.dueDate = dueDate
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            
            print("This game is due on: \(dateFormatter.string(from: dueDate!)).")
        }
        
        func checkGameIn() {
            unavailableGames.printElements()
            
            print("Please enter the index of the game you wish to check in.")
            
            let game = unavailableGames[getIndex(maxIndex: unavailableGames.count)]
            game.dueDate = nil
        }
    }

