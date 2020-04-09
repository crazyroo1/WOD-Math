//
//  WODScoreCalculatorViewController.swift
//  WOD Math
//
//  Created by Charles Eison on 4/6/20.
//  Copyright © 2020 Charles Eison. All rights reserved.
//

import UIKit

class WODDetailsViewController: UIViewController {
    
    @IBOutlet weak var movementsLabel: UILabel!
    @IBOutlet weak var movementStepper: UIStepper!
    @IBOutlet weak var perscribedRepsLabel: UILabel!
    @IBOutlet weak var perscribedRepsMovementCounter: UILabel!
    @IBOutlet weak var perscribedRepsStepper: UIStepper!
    @IBOutlet weak var perscribedRepsSlider: UISlider!
    @IBOutlet weak var perscribedRepsNextButton: UIButton!
    @IBOutlet weak var perscribedRepsPreviousButton: UIButton!
    @IBOutlet weak var enterResultsButton: UIButton!
    
    var perscribedRepsMovementCounterValue = 1
    var numberOfPerscribedReps = 0
    var movementStepperValue = 1
    var wodTotalRepsArray = [0]
    var totalRepsPerscribed = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func movementStepperChanged(_ sender: UIStepper) {
        
        movementStepperValue = Int(sender.value)
        movementsLabel.text = "\(movementStepperValue)"
        if perscribedRepsMovementCounterValue >= Int(movementsLabel.text!)! {
            perscribedRepsNextButton.isEnabled = false
        } else {
            perscribedRepsNextButton.isEnabled = true
        }
        
        if perscribedRepsMovementCounterValue > 1 {
            perscribedRepsPreviousButton.isEnabled = true
        } else {
            perscribedRepsPreviousButton.isEnabled = false
        }
        
        if perscribedRepsMovementCounterValue == Int(movementsLabel.text!)! {
            enterResultsButton.isEnabled = true
        } else {
            enterResultsButton.isEnabled = false
        }
    }
    
    @IBAction func perscribedRepsStepperChanged(_ sender: UIStepper) {
        numberOfPerscribedReps = Int(sender.value)
        perscribedRepsLabel.text = "\(numberOfPerscribedReps)"
        perscribedRepsSlider.value = Float(sender.value)
        wodTotalRepsArray[perscribedRepsMovementCounterValue - 1] = Int(sender.value)
    }
    
    @IBAction func perscribedRepsSliderChanged(_ sender: UISlider) {
        numberOfPerscribedReps = Int(sender.value)
        perscribedRepsLabel.text = "\(Int(sender.value))"
        perscribedRepsStepper.value = Double(sender.value)
        wodTotalRepsArray[perscribedRepsMovementCounterValue - 1] = Int(sender.value)
    }
    
    @IBAction func perscribedRepsNextButtonPressed(_ sender: UIButton) {
        wodTotalRepsArray.append(0)
        perscribedRepsMovementCounterValue += 1
        perscribedRepsMovementCounter.text = "\(perscribedRepsMovementCounterValue)"
        let valueAtLocation = Double(wodTotalRepsArray[perscribedRepsMovementCounterValue - 1])
        perscribedRepsStepper.value = valueAtLocation
        perscribedRepsSlider.value = Float(valueAtLocation)
        perscribedRepsLabel.text = "\(Int(valueAtLocation))"
        
        if perscribedRepsMovementCounterValue >= Int(movementsLabel.text!)! {
            perscribedRepsNextButton.isEnabled = false
        } else {
            perscribedRepsNextButton.isEnabled = true
        }
        if perscribedRepsMovementCounterValue > 1 {
            perscribedRepsPreviousButton.isEnabled = true
        } else {
            perscribedRepsPreviousButton.isEnabled = false
        }
        
        if perscribedRepsMovementCounterValue == Int(movementsLabel.text!)! {
            enterResultsButton.isEnabled = true
        } else {
            enterResultsButton.isEnabled = false
        }
    }
    
    @IBAction func perscribedRepsPreviousButtonPressed(_ sender: UIButton) {
        perscribedRepsMovementCounterValue -= 1
        perscribedRepsMovementCounter.text = "\(perscribedRepsMovementCounterValue)"
        let valueAtLocation = Double(wodTotalRepsArray[perscribedRepsMovementCounterValue - 1])
        perscribedRepsStepper.value = valueAtLocation
        perscribedRepsSlider.value = Float(valueAtLocation)
        perscribedRepsLabel.text = "\(Int(valueAtLocation))"
        
        if perscribedRepsMovementCounterValue >= Int(movementsLabel.text!)! {
            perscribedRepsNextButton.isEnabled = false
        } else {
            perscribedRepsNextButton.isEnabled = true
        }
        if perscribedRepsMovementCounterValue > 1 {
            perscribedRepsPreviousButton.isEnabled = true
        } else {
            perscribedRepsPreviousButton.isEnabled = false
        }
        
        if perscribedRepsMovementCounterValue == Int(movementsLabel.text!)! {
            enterResultsButton.isEnabled = true
        } else {
            enterResultsButton.isEnabled = false
        }
    }
    
    @IBAction func enterResultsButtonPressed(_ sender: UIButton) {
        totalRepsPerscribed = wodTotalRepsArray.reduce(0, +)
        performSegue(withIdentifier: "WODResultsCalculatorView", sender: self)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let myResultsVC = segue.destination as! MyResultsViewController
        myResultsVC.movementsPerRound = Int(movementStepper.value)
        myResultsVC.totalRepsPerscribed = totalRepsPerscribed
        myResultsVC.maxRepPerMovement = wodTotalRepsArray
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        movementsLabel.text = "1"
        movementStepper.value = 1
        perscribedRepsLabel.text = "0"
        perscribedRepsMovementCounter.text = "1"
        perscribedRepsStepper.value = 0
        perscribedRepsSlider.value = 0
        perscribedRepsMovementCounterValue = 1
        numberOfPerscribedReps = 0
        movementStepperValue = 1
        wodTotalRepsArray = [0]
        totalRepsPerscribed = 0
        perscribedRepsPreviousButton.isEnabled = false
        perscribedRepsNextButton.isEnabled = false
        
    }
}
