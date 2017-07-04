//==================================================
import Foundation
import UIKit
//==================================================
class SimoneBrain {
    //---------------------------------
    var colorTracker: Int!
    var userTurnToPlay: Bool!
    var scoreKeeperCounter: Int!
    var theScoreKeeper = ""
    var randomButtonChooser: UIButton!
    //---------------------------------
    func getRandomNumber(from f: Int, to t: Int) -> Int {
        let from = UInt32(f)
        let to = UInt32(t)
        let randomNumber = arc4random_uniform(to - from + 1) + from
        return Int(randomNumber)
    }
    //---------------------------------
    func startGame(_ arrOfRandomButtons: [UIButton]) {
        //-----------------
        colorTracker = 0
        //-----------------
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {_ in
            self.buttonAlphaManager(arrOfRandomButtons)
        }
        //-----------------
    }
    //---------------------------------
    func buttonAlphaManager(_ arrOfRandomButtons: [UIButton]) {
        /*
            Si "colorTracker" < que le nombre d'éléments dans "arrOfRandomButtons" alors...
                .   Initialise "userTurnToPlay" à faux
                .   Initialise "scoreKeeperCounter" à 0
                .   Initialise "scoreKeeper" à ""
                .   Initialise "arrOfRandomChooser" au button à l'index "colorTracker" dans le tableau "arrOfRandomButtons"
                .   Change la proprieété alpha "arrOfRandomChooser" à 0.2
                .   Incrémente "colorTracker" de 1
                .   Timer de 0.5 seconde appellant la méthode "resetAlphaForButtons" avec l'argument "arrOfRandomButtons"
            Sinon
                .   Valeur de "userTurnToPlay" = vrai
         */
        if colorTracker < arrOfRandomButtons.count {
            //-----------------
            userTurnToPlay = false
            scoreKeeperCounter = 0
            scoreKeeper = ""
            randomButtonChooser = arrOfRandomButtons[colorTracker]
            randomButtonChooser.alpha = 0.2
            colorTracker! += 1
            //-----------------
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) {_ in
                self.resetAlphaForButtons(arrOfRandomButtons)
            }
            //-----------------
        } else {
            userTurnToPlay = true
        }
    }
    //---------------------------------
    func resetAlphaForButtons(_ arrOfRandomButtons: [UIButton]) {
        //-----------------
        randomButtonChooser.alpha = 1.0
        //-----------------
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) {_ in
            self.resetAlphaForButtons(arrOfRandomButtons)
        }
        //-----------------
    }
    //---------------------------------
    var scoreKeeper: String? {
        // get = retourne la valeur de la variable "theScoreKeeper"
        // set = initialise la variable "theScoreKeeper" à la nouvelle valeur
        
        get {
            return theScoreKeeper
        }
        set {
           theScoreKeeper = newValue!
        }
    }
    //---------------------------------
}
//==================================================
