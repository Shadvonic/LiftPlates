//
//  WeightCalculatorViewModel.swift
//  PlateCalculator
//
//  Created by Marc Moxey on 3/3/23.
//

import Foundation

class LiftPlatesViewModel: ObservableObject {
    @Published var barbellWeight: Double = 45.0
    @Published var weightToLift: Double = 0.0
    @Published var selectedUnit: WeightUnit = .pounds
    @Published var plateQuantities: [PlateQuantity] = []
    
    private let model = LiftPlatesModel()
    
    func calculatePlateQuantities() {
        self.plateQuantities = model.calculatePlateQuantities(barbellWeight: self.barbellWeight, weightToLift: self.weightToLift, selectedUnit: self.selectedUnit)
    }
}

