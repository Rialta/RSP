//
//  ViewController.swift
//  RSP
//
//  Created by Anna Iliashenko 
//  Copyright © 2019 Anna Iliashenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var appSign: UILabel!
    @IBOutlet private weak var gameStatus: UILabel!
    @IBOutlet private weak var rockSign: UIButton!
    @IBOutlet private weak var paperSign: UIButton!
    @IBOutlet private weak var scissorsSign: UIButton!
    @IBOutlet private weak var playAgain: UIButton!
    @IBOutlet private weak var computerResponse: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update(for: .start, computerChoice: nil)
    }
    
   @IBAction func rockButton(_ sender: UIButton) {
        let computerMove = Game.randomSign()
        let state = Game.gameState(forUserChoice: .rock, computerChoice: computerMove)
        update(for: state, computerChoice: computerMove)
        paperSign.isHidden = true
        scissorsSign.isHidden = true
    }
    @IBAction func paperButton(_ sender: UIButton) {
        let computerMove = Game.randomSign()
        let state = Game.gameState(forUserChoice: .paper, computerChoice: computerMove)
        update(for: state, computerChoice: computerMove)
        rockSign.isHidden = true
        scissorsSign.isHidden = true
    }
    @IBAction func scissorsButton(_ sender: UIButton) {
        let computerMove = Game.randomSign()
        let state = Game.gameState(forUserChoice: .scissors, computerChoice: computerMove)
        update(for: state, computerChoice: computerMove)
        paperSign.isHidden = true
        rockSign.isHidden = true
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        update(for: .start, computerChoice: nil)
    }

    
    func update(for state: GameState, computerChoice: Game.Sign?) {
        switch state {
        case .start:
            gameStatus.text = "Rock, Paper or Scissors?"
            paperSign.isHidden = false
            rockSign.isHidden = false
            scissorsSign.isHidden = false
        case .lose:
            gameStatus.text = "You lose:("
        case .draw:
            gameStatus.text = "Draw"
        case .win:
            gameStatus.text = "You won!"
        }
        computerResponse.text = computerChoice?.name
        computerResponse.isHidden = state == .start
        playAgain.isHidden = state == .start
        
    }
    
}







