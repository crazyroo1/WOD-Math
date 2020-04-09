

import UIKit

class MyResultsViewController: UIViewController {
    
    @IBOutlet weak var fullRoundsCompletedLabel: UILabel!
    @IBOutlet weak var fullRoundsStepper: UIStepper!
    @IBOutlet weak var movementNumberLabel: UILabel!
    @IBOutlet weak var repsCompletedLabel: UILabel!
    @IBOutlet weak var repsCompletedStepper: UIStepper!
    @IBOutlet weak var repsCompletedSlider: UISlider!
    @IBOutlet weak var repsCompletedPreviousButton: UIButton!
    @IBOutlet weak var repsCompletedNextButton: UIButton!
    
    var movementNumberValue = 1
    var additionalRepsCompleted = 0
    var completedTotalRepsArray = [0]
    var movementsPerRound = 1
    var totalRepsPerscribed = 1
    var fullRoundsCompleted = 0
    var totalAdditionalReps = 0
    var maxRepPerMovement = [0]
    var totalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repsCompletedStepper.maximumValue = Double(maxRepPerMovement[movementNumberValue - 1])
        repsCompletedSlider.maximumValue = Float(maxRepPerMovement[movementNumberValue - 1])
        if movementsPerRound > 1 {
            repsCompletedNextButton.isEnabled = true
        } else {
            repsCompletedNextButton.isEnabled = false
        }
    }
    
    @IBAction func roundsStepperChanged(_ sender: UIStepper) {
        fullRoundsCompleted = Int(sender.value)
        fullRoundsCompletedLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func repsStepperChanged(_ sender: UIStepper) {
        additionalRepsCompleted = Int(sender.value)
        repsCompletedSlider.value = Float(sender.value)
        repsCompletedLabel.text = "\(Int(sender.value))"
        completedTotalRepsArray[movementNumberValue - 1] = Int(sender.value)
        
    }
    
    @IBAction func repsSliderChanged(_ sender: UISlider) {
        additionalRepsCompleted = Int(sender.value)
        repsCompletedStepper.value = Double(sender.value)
        repsCompletedLabel.text = "\(Int(sender.value))"
        completedTotalRepsArray[movementNumberValue - 1] = Int(sender.value)
    }
    
    
    
    @IBAction func repsPreviousButtonPressed(_ sender: UIButton) {
        
        movementNumberValue -= 1
        repsCompletedStepper.maximumValue = Double(maxRepPerMovement[movementNumberValue - 1])
        repsCompletedSlider.maximumValue = Float(maxRepPerMovement[movementNumberValue - 1])
        movementNumberLabel.text = "\(movementNumberValue)"
        let valueAtLocation = Double(completedTotalRepsArray[movementNumberValue - 1])
        repsCompletedStepper.value = valueAtLocation
        repsCompletedSlider.value = Float(valueAtLocation)
        repsCompletedLabel.text = "\(Int(valueAtLocation))"
        
        if movementNumberValue < movementsPerRound {
            repsCompletedNextButton.isEnabled = true
        } else {
            repsCompletedNextButton.isEnabled = false
        }
        if movementNumberValue > 1 {
            repsCompletedPreviousButton.isEnabled = true
        } else {
            repsCompletedPreviousButton.isEnabled = false
        }
    }
    
    @IBAction func repsNextButtonPressed(_ sender: UIButton) {
        completedTotalRepsArray.append(0)
        movementNumberValue += 1
        repsCompletedStepper.maximumValue = Double(maxRepPerMovement[movementNumberValue - 1])
        repsCompletedSlider.maximumValue = Float(maxRepPerMovement[movementNumberValue - 1])
        movementNumberLabel.text = "\(movementNumberValue)"
        let valueAtLocation = Double(completedTotalRepsArray[movementNumberValue - 1])
        repsCompletedStepper.value = valueAtLocation
        repsCompletedSlider.value = Float(valueAtLocation)
        repsCompletedLabel.text = "\(Int(valueAtLocation))"
        
        if movementNumberValue < movementsPerRound {
            repsCompletedNextButton.isEnabled = true
        } else {
            repsCompletedNextButton.isEnabled = false
        }
        if movementNumberValue > 1 {
            repsCompletedPreviousButton.isEnabled = true
        } else {
            repsCompletedPreviousButton.isEnabled = false
        }
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        totalAdditionalReps = completedTotalRepsArray.reduce(0, +)
        totalScore = (totalRepsPerscribed * fullRoundsCompleted) + totalAdditionalReps
        performSegue(withIdentifier: "ScoreResultsView", sender: self)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let myScoreVC = segue.destination as! WODScoreResultsViewController
        myScoreVC.fullRoundsCompleted = fullRoundsCompleted
        myScoreVC.additionalRepsCompleted = totalAdditionalReps
        myScoreVC.finalScore = totalScore
    }
    
}




