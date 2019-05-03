//
//  File.swift
//  RSP
//
//  Created by Anna Iliashenko 
//  Copyright © 2019 Anna Iliashenko. All rights reserved.
//

import Foundation
import GameplayKit

struct Game {
    
    enum Sign {
        case rock, paper, scissors
        
        var name: String {
            switch self {
            case .rock:
                return "Computer choosed 👊"
            case .paper:
                return "Computer choosed 🤚"
            case .scissors:
                return "Computer choosed ✌️"
            }
        }
    }
    
    public static let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
    
    public static func randomSign() -> Sign {
        let sign = randomChoice.nextInt()
        if sign == 0 {
            return .rock
        } else if sign == 1 {
            return .paper
        } else {
            return .scissors
        }
    }
    
    let computerChoice = randomSign()
    
    public static func gameState(forUserChoice: Sign, computerChoice: Sign) -> GameState {
        if forUserChoice == computerChoice {
            return .draw
        } else if forUserChoice == .paper && computerChoice == .rock {
            return .win
        } else if forUserChoice == .rock && computerChoice == .scissors {
            return .win
        } else if forUserChoice == .scissors && computerChoice == .paper {
            return .win
        } else { return .lose }
        
    }
}
