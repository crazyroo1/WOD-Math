
import UIKit

class WODScoreResultsViewController: UIViewController {
    
    
    @IBOutlet weak var fullRoundsCompletedLabel: UILabel!
    @IBOutlet weak var additionalRepsCompletedLabel: UILabel!
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    var fullRoundsCompleted = 0
    var additionalRepsCompleted = 0
    var finalScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        fullRoundsCompletedLabel.text = ("\(fullRoundsCompleted)")
        additionalRepsCompletedLabel.text = "\(additionalRepsCompleted)"
        finalScoreLabel.text = "\(Int(finalScore))"
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func resetButtonPressed(_ sender: UIButton) {
    }
}


