//==================================================
import UIKit
//==================================================
class SingletonShared {
    //---------------------------------
    var scoreForWrongInterface: String!
    var savedHighscore = UserDefaults.standard
    static let sigletonSharedInstance = SingletonShared()
    //---------------------------------
    init() {
        saveDefaultIfNeeded()
    }
    //---------------------------------
    func saveDefaultIfNeeded() {
        if savedHighscore.object(forKey: "score") == nil {
            savedHighscore.setValue("0", forKey: "score")
        }
    }
    //---------------------------------
    func saveScore(_ aScore: String) {
        let a = Int(aScore)
        let b = savedHighscore.object(forKey: "score") as? String
        let c = Int(b!)
        if a! > c! {
            savedHighscore.setValue(aScore, forKey: "score")
        }
    }
    //---------------------------------
    func resetHighscore() {
        savedHighscore.removeObject(forKey: "score")
        saveDefaultIfNeeded()
    }
    //---------------------------------
}
//==================================================
