//==================================================
import UIKit
//==================================================
class SingletonShared {
    //---------------------------------
    var highScore: String!
    var scoreForWrongInterface: String!
    var savedHighscore = UserDefaults.standard
    static let sigletonSharedInstance = SingletonShared()
    //---------------------------------
    init() {
        //savedHighscore.removeObject(forKey: "score")
        managerScore()
    }
    //---------------------------------
    func managerScore() {
        if let hs = savedHighscore.object(forKey: "score") {
            highScore = String(describing: hs)
        } else {
            savedHighscore.setValue("0", forKey: "score")
        }
    }
    //---------------------------------
    func saveScore(_ aScore: String) {
        let a = aScore
        let b = highScore
        if a > b! {
            savedHighscore.setValue(aScore, forKey: "score")
            highScore = a
        }
    }
    //---------------------------------
}
//==================================================
