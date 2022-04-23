//
//  ViewController.swift
//  Concentration
//
//  Created by Артур Дохно on 23.04.2022.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoices = ["🚢", "🛶", "🚑", "🚛", "🏍", "🚠", "⛵️", "🚁", "🚂", "🚀", "🛵", "🚔", "🚜", "🏎", "🚒", "🚕"]

    var emoji = [Int:String]()

    @IBOutlet var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCatd(_ sender: UIButton) {
        flipCount += 1
        guard let cardNumber = cardButtons.firstIndex(of: sender) else { return }
        game.chooseCard(at: cardNumber)
        uppdateViewFromModel()
    }
    
    func uppdateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

 
