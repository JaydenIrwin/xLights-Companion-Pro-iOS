//
//  TreeLightsCalculator.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-03.
//

import SwiftUI

struct TreeLightsCalculator: View {
    
    enum UnitSystem {
        case imperial
        case metric
    }
    
    @State var unit = UnitSystem.metric
    @State var autoHeight = false
    @State var enteredHeight : Double?
    @State var topDiameter : Double?
    @State var bottomDiameter : Double?
    @State var circumferenceCovered : Double?
    @State var numberOfStrings: Int?
    @State var LightToTopSpacing : Double?
    @State var bottomToLightSpacing : Double?
    @State var lightSpacing : Double?
    @State var lightsPerString : Int?
    
    //Computed variables
    var computedHeight : Double? {
        if autoHeight {
            if let LightToTopSpacing = LightToTopSpacing, let bottomToLightSpacing = bottomToLightSpacing, let lightSpacing = lightSpacing, let lightsPerString = lightsPerString {
                return (LightToTopSpacing + bottomToLightSpacing + (Double((lightsPerString - 1)) * lightSpacing))/100
            }
            return nil
        } else {
            return enteredHeight ?? nil
        }
    }
    
    var topCircumference : Double? {
        if let topDiameter = topDiameter {
            return 2 * .pi * (topDiameter/2)
        } else {
            return nil
        }
        
    }
    
    var bottomCircumference : Double? {
        if let bottomDiameter = bottomDiameter {
            return 2 * .pi * (bottomDiameter/2)
        } else {
            return nil
        }
    }
    
    var topSpacing : Double? {
        if let topCircumference = topCircumference, let circumferenceCovered = circumferenceCovered, let numberOfStrings = numberOfStrings {
            let circumference = Measurement(value: ((topCircumference * (circumferenceCovered/100))/Double(numberOfStrings)), unit: unit == .metric ? UnitLength.meters : UnitLength.feet)
            if unit == .metric {
                return circumference.converted(to: .centimeters).value
            } else {
                return circumference.converted(to: .inches).value
            }
        } else {
            return nil
        }
    }
    
    //Main view
    var body: some View {
        Form {
            //Settings
            Section(header: Text("Settings")) {
                Picker("Unit of Measurement", selection: $unit) {
                    Text("Metric")
                        .tag(UnitSystem.metric)
                    Text("Imperial")
                        .tag(UnitSystem.imperial)
                }
                .pickerStyle(SegmentedPickerStyle())
                Toggle("Would you like to calculate the height of the tree using light spacing and lights per string?", isOn: $autoHeight)
            }
            //Input
            Section(header: Text("Tree")) {
                if !autoHeight {
                    DoubleInputRow(title: "Height", placeholder: autoHeight ? "" : "6.0", unit: unit == .metric ? "m" : "ft", disabled: autoHeight, value: $enteredHeight)
                }
                DoubleInputRow(title: "Top Diameter", placeholder: "0.5", unit: unit == .metric ? "m" : "ft.", disabled: false, value: $topDiameter)
                DoubleInputRow(title: "Bottom Diameter", placeholder: "1.0", unit: unit == .metric ? "m" : "ft.", disabled: false, value: $bottomDiameter)
                DoubleInputRow(title: "Circumference Covered", placeholder: "100", unit: "%", disabled: false, value: $circumferenceCovered)
                IntegerInputRow(title: "Number of Strings", placeholder: "12", unit: "Strings", value: $numberOfStrings)
                DoubleInputRow(title: "Space to Top Light", placeholder: "2.0", unit: unit == .metric ? "cm" : "in.", disabled: false, value: $LightToTopSpacing)
                DoubleInputRow(title: "Space After Bottom Light", placeholder: "5.0", unit: unit == .metric ? "cm" : "in.", disabled: false, value: $bottomToLightSpacing)
                DoubleInputRow(title: "Spacing Between Lights", placeholder: "4.0", unit: unit == .metric ? "cm" : "in.", disabled: false, value: $lightSpacing)
                if autoHeight {
                    IntegerInputRow(title: "Lights per String", placeholder: "50", unit: "Lights", value: $lightsPerString)
                }
            }
            //Results
            Section(header: Text("Result")) {
                HStack {
                    Text("Height")
                    Spacer()
                    if let computedHeight = computedHeight {
                        Text(mixedLengthString(computedHeight))
                    }
                }
                
                HStack {
                    Text("Top Circumference")
                    Spacer()
                    if let topCircumference = topCircumference {
                        Text(mixedLengthString(topCircumference))
                    }
                }
                
                HStack {
                    Text("Bottom Circumference")
                    Spacer()
                    if let bottomCircumference = bottomCircumference {
                        Text(mixedLengthString(bottomCircumference))
                    }
                }
                
                HStack {
                    Text("Number of lights")
                    Spacer()
                    
                    Text("Lights")
                }
                
                HStack {
                    Text("Top Spacing")
                    Spacer()
                    if let topSpacing = topSpacing {
                        Text(mixedLengthString(topSpacing))
                    }
                }
                
                HStack {
                    Text("Bottom Spacing")
                    Spacer()
                    Text("")
                }
                
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Tree Lights Calculator")
        .onTapGesture {hideKeyboard()}
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func mixedLengthString(_ value: Double) -> String {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
        formatter.numberFormatter.maximumFractionDigits = 0
        
        if unit == .metric {
            let rounded = value.rounded(.towardZero)
            let meters = Measurement(value: rounded, unit: UnitLength.meters)
            let cms = Measurement(value: value - rounded, unit: UnitLength.meters).converted(to: .centimeters)
            return "\(formatter.string(from: meters)) \(formatter.string(from: cms))"
        } else {
            let rounded = value.rounded(.towardZero)
            let feet = Measurement(value: rounded, unit: UnitLength.feet)
            let inches = Measurement(value: value - rounded, unit: UnitLength.feet).converted(to: .inches)
            return "\(formatter.string(from: feet)) \(formatter.string(from: inches))"
        }
    }
    
    
}

struct TreeLightsCalculator_Previews: PreviewProvider {
    static var previews: some View {
        TreeLightsCalculator()
    }
}
