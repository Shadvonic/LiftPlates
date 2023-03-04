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
        let weightToLiftInPounds = selectedUnit == .pounds ? weightToLift : weightToLift / 2.20462
        self.plateQuantities = model.calculatePlateQuantities(barbellWeight: self.barbellWeight, weightToLift: weightToLiftInPounds, selectedUnit: self.selectedUnit)
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

    var plateWeights: [Double] {
        switch self {
        case .pounds:
            return [45, 35, 25, 10, 5, 2.5]
        case .kilograms:
            return [20, 15, 10, 5, 2.5, 1.25]
        }
    }
}
