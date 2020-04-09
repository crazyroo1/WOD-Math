import UIKit
import SpriteKit

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
        
        let skView = SKView(frame: view.frame)
        view.addSubview(skView)
        
        let scene = SKScene(size: view.bounds.size)
        scene.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        if let particles = SKEmitterNode(fileNamed: "Confetti") {
            scene.addChild(particles)
            scene.backgroundColor = .clear
            skView.allowsTransparency = true
            skView.backgroundColor = .clear
            
            skView.presentScene(scene)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                particles.particleBirthRate = 0
            }
        }
    }
}



