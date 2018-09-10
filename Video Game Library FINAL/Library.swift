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
        Game(title: "Call of Duty", rating: "M"),
        Game(title: "No Man's Sky", rating: "E" ),
        Game(title: "Destiny", rating: "T")]
    
    
    //State variables that determine if a game is available or not
    var unavailableGames: [Game] {
        return games.filter {$0.dueDate == nil!}
    }
    
    var availableGames: [Game] {
        return games.filter {$0.dueDate == nil}
    }
    
    //Mark:- Functions for Library
    func passCheck() {
        var key = "password"
        var password = getInput()
        
        if password == key {
            
        }
    }

    
    
    
    
    func addGame() {
//        var seconds = 10
//        var timer = Timer()
//        var isTimerRunning = false
//        var counter = 3
        let key = "password"
        
        
        print("Please Enter Password")
        let password = getInput()
        
        
//        if !isTimerRunning {
            if password == key {
                print("Please enter name of game to be added")
                let title = getInput()
                print("Please enter rating of game as E, T, or M")
                let rating = getInput()
                let game = Game(title: title, rating: rating)
                
                games.append(game)
            } else {
                print("Incorrect Password Entered. Returning to Menu...")
                sleep(3)
        }
//            }
//            else if counter > 0{
//                print("Incorrect Password. Returning to Menu")
//                sleep(3)
//                counter -= 1
//
//            }
//        else{
//            print("Incorrect Password Entered too many times. Try agian in 5 minutes")
//            isTimerRunning = true
//            counter += 3
//            }
//        }
        
    }
    func removeGame() {
        games.printElements()
        
        let index = getIndex(maxIndex: games.count)
        
        games.remove(at: index)
    }
    
    func listAvailableGames() {
        for game in availableGames {
            print(game.title, game.rating)
        }
    }
    
    func listUnavailableGames() {
        for game in unavailableGames {
            print(game.title, game.rating)
            
            if let dueDate = game.dueDate {
                let dateFormatter = DateFormatter()
                print("This game is due on: \(dateFormatter.string(from: dueDate)).")
            }
        }
    }
        func checkGameOut() {
            
            
            availableGames.printElements()
            
            print("Please enter the index of the video game you would like to check out")
            let birthDate = getInput()
            let game = availableGames[getIndex(maxIndex: availableGames.count)]
            let secondsSince1970 = Date().timeIntervalSince1970

            
            let currentCalender = Calendar.current
            let minimumDateforM = secondsSince1970 - 568025136
            let minimumDateforT = secondsSince1970 - 410240376
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

