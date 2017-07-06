//==================================================
import UIKit
//==================================================
class StartController: UIViewController {
    //---------------------------------
    @IBOutlet weak var highscoreLabel: UILabel!
    //---------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        SingletonShared.sigletonSharedInstance.managerScore()
        highscoreLabel.text = "HIGHSCORE : \(SingletonShared.sigletonSharedInstance.highScore!)"
    }
    //---------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //---------------------------------

}
//==================================================
