//
//  Plate.swift
//  PlateCalculator
//
//  Created by Marc Moxey on 3/3/23.
//

import Foundation

class LiftPlatesModel {
    let plateWeights: [Double] = [45, 35, 25, 10, 5, 2.5]
    
    func calculatePlateQuantities(barbellWeight: Double, weightToLift: Double, selectedUnit: WeightUnit) -> [PlateQuantity] {
        let weightToLift = selectedUnit == .pounds ? weightToLift : weightToLift * 2.20462 // convert to pounds if needed
        
        var remainingWeight = weightToLift - barbellWeight
        
        var plateQuantities = [PlateQuantity]()
        for plateWeight in plateWeights {
            var quantity = 0
            while remainingWeight >= (plateWeight * 2) {
                remainingWeight -= plateWeight * 2
                quantity += 1
            }
            if quantity > 0 {
                plateQuantities.append(PlateQuantity(weight: plateWeight, quantity: quantity))
            }
        }
        return plateQuantities
    }
}

struct PlateQuantity: Identifiable {
    var id = UUID()
    let weight: Double
    var quantity: Int
}

enum WeightUnit: String, CaseIterable {
    case pounds
    case kilograms
}
