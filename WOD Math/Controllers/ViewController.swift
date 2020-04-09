

import UIKit

class ViewController: UIViewController {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func wodScoreCalculatorPressed(_ sender: UIButton) {        
        self.performSegue(withIdentifier: "WODDetailView", sender: self)
    }
    
}

