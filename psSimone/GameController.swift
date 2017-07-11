//==================================================
import UIKit
//==================================================
class GameController: UIViewController {
    //---------------------------------
    @IBOutlet weak var but1: UIButton!
    @IBOutlet weak var but2: UIButton!
    @IBOutlet weak var but3: UIButton!
    @IBOutlet weak var but4: UIButton!
    @IBOutlet weak var but5: UIButton!
    @IBOutlet weak var but6: UIButton!
    @IBOutlet weak var but7: UIButton!
    @IBOutlet weak var but8: UIButton!
    @IBOutlet weak var but9: UIButton!
    @IBOutlet weak var scoreKeeper: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    //---------------------------------
    var arrOfGameColors: [UIButton]!
    var simoneBrain: SimoneBrain!
    var aTimer: Timer!
    //---------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        arrOfGameColors = [but1, but2, but3, but4, but5, but6, but7, but8, but9]
        simoneBrain = SimoneBrain(gameColors: arrOfGameColors, timerLabel: self.timerLabel)
        simoneBrain.addRandomColorToArray()
        simoneBrain.startGame()
        scoreKeeper.text = simoneBrain.scoreKeeper
        simoneBrain.loadArrayForComparison()
        
        aTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
            if self.simoneBrain.timerLabel.text == "YOUR TURN : 0 s" {
                self.performSegue(withIdentifier: "start", sender: nil)
                self.aTimer.invalidate()
            }
        }
    }
    //---------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    //---------------------------------
    @IBAction func buttonManager(_ sender: UIButton) {
        if !simoneBrain.userTurnToPlay {
            return
        }
        simoneBrain.aTimer.invalidate()
        timerLabel.text = ""
        if simoneBrain.arrCopyOfRandomColorsToCompare.count == 0 {
            simoneBrain.arrCopyOfRandomColorsToCompare = simoneBrain.arrRandomColors
        }
        if !simoneBrain.verification(arrOfGameColors[sender.tag]) {
            let theScore = simoneBrain.arrRandomColors.count - 1
            let forWrongDisplay = "SCORE : \(theScore)"
            SingletonShared.sigletonSharedInstance.saveScore(String(theScore))
            SingletonShared.sigletonSharedInstance.scoreForWrongInterface = "\(forWrongDisplay)"
            performSegue(withIdentifier: "wrong", sender: nil)
        }
        simoneBrain.scoreKeeperCounter! += 1
        scoreKeeper.text = "\(simoneBrain.scoreKeeperCounter!)"
    }
    //---------------------------------
}
//==================================================
