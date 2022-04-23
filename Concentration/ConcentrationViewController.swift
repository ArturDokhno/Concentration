//
//  ViewController.swift
//  Concentration
//
//  Created by Артур Дохно on 23.04.2022.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoices = ["🎃", "👻", "🎃", "👻"]

    @IBOutlet var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCatd(_ sender: UIButton) {
        flipCount += 1
        guard let cardNumber = cardButtons.firstIndex(of: sender) else { return }
        flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = .white
        }
    }
}

