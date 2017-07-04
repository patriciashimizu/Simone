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
    //---------------
    var arrOfButtons: [UIButton]!
    var arrOfRandomButtons: [UIButton] = []
    //---------------
    let simoneBrain = SimoneBrain()
    //---------------------------------
    override func viewDidLoad() {
        //---------------
        super.viewDidLoad()
        //---------------
        arrOfButtons = [but1, but2, but3, but4, but5, but6, but7, but8, but9]
        //---------------
        addRandomButtonToArray()
        // Appelle la méthode "StartGame" avec argument "arrOfRandomButtons"
        simoneBrain.startGame(arrOfRandomButtons)
        //---------------
        // Initialise "scoreKeeper" avec la propriété ordinée "scoreKeeper"
        scoreKeeper.text = simoneBrain.scoreKeeper
        //---------------
    }
    //---------------------------------
    func addRandomButtonToArray(){
       let randomIndex = simoneBrain.getRandomNumber(from: 0, to: arrOfButtons.count - 1)
        // S'assurer que les valeurs seront entre 0 et 8
        arrOfRandomButtons.append(arrOfButtons[randomIndex])
        //print(arrOfRandomButtons)
    }
    
    //---------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    //---------------------------------
    @IBAction func buttonManager(_ sender: UIButton) {
    }
    //---------------------------------
}
//==================================================
