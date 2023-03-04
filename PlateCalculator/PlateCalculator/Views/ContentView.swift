//
//  ContentView.swift
//  PlateCalculator
//
//  Created by Marc Moxey on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = LiftPlatesViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Barbell Weight:")
                    TextField("Enter weight", value: $viewModel.barbellWeight, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }

                HStack {
                    Text("Weight to Lift:")
                    TextField("Enter weight", value: $viewModel.weightToLift, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }

                Picker("Unit", selection: $viewModel.selectedUnit) {
                    ForEach(WeightUnit.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

                Button("Calculate") {
                    viewModel.calculatePlateQuantities()
                }

                Divider()

                if !viewModel.plateQuantities.isEmpty {
                    List {
                        Text("Plate Weight    Quantity (each side)")
                            .font(.headline)
                        ForEach(viewModel.plateQuantities) { plateQuantity in
                            HStack {
                                Text("\(plateQuantity.weight, specifier: "%.1f") \(viewModel.selectedUnit.rawValue)")
                                Spacer()
                                Text("\(plateQuantity.quantity)")
                            }
                        }
                    }
                }

            }
            .padding()
            .navigationTitle("Plate Calculator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
