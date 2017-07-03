//==================================================
import UIKit
//==================================================
class StartController: UIViewController {
    //---------------------------------
    @IBOutlet weak var highscoreLabel: UILabel!
    //---------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        //-------------
        highscoreLabel.text = "HIGHSCORE : \(SingletonShared.sigletonSharedInstance.highScore)" 
    }
    //---------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //---------------------------------

}
//==================================================
