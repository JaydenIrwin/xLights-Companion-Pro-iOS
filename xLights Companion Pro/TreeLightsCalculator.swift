//
//  TreeLightsCalculator.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-03.
//

import SwiftUI

struct TreeLightsCalculator: View {
    
    @State var unitSystem = UnitSystem.metric
    @State var autoHeight = false
    @State var enteredHeight : Double?
    @State var topDiameter : Double?
    @State var bottomDiameter : Double?
    @State var circumferenceCovered : Double?
    @State var numberOfStrings: Int?
    @State var lightToTopSpacing : Double?
    @State var bottomToLightSpacing : Double?
    @State var lightSpacing : Double?
    @State var lightsPerString : Int?
    
    //Computed variables
    var computedHeight : Double? {
        if autoHeight {
            if let LightToTopSpacing = lightToTopSpacing, let bottomToLightSpacing = bottomToLightSpacing, let lightSpacing = lightSpacing, let lightsPerString = lightsPerString {
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
            let circumference = Measurement(value: ((topCircumference * (circumferenceCovered/100))/Double(numberOfStrings)), unit: unitSystem == .metric ? UnitLength.meters : UnitLength.feet)
            if unitSystem == .metric {
                return circumference.converted(to: .centimeters).value
            } else {
                return circumference.converted(to: .inches).value
            }
        } else {
            return nil
        }
    }
    
    var bottomSpacing : Double? {
        if let bottomCircumference = bottomCircumference, let circumferenceCovered = circumferenceCovered, let numberOfStrings = numberOfStrings {
            let circumference = Measurement(value: ((bottomCircumference * (circumferenceCovered/100))/Double(numberOfStrings)), unit: unitSystem == .metric ? UnitLength.meters : UnitLength.feet)
            if unitSystem == .metric {
                return circumference.converted(to: .centimeters).value
            } else {
                return circumference.converted(to: .inches).value
            }
        } else {
            return nil
        }
    }
    
    var slantLength : Double? {
        if let height = enteredHeight, let bottomDiameter = bottomDiameter{
            let radius = bottomDiameter / 2
            return sqrt(pow(radius, 2) + pow(height, 2))
        } else {
            return nil
        }
    }
    
    var computedLightsPerString : Int? {
        if !autoHeight {
            if let bottomToLightSpacing = bottomToLightSpacing, let lightToTopSpacing = lightToTopSpacing, let lightSpacing = lightSpacing, let slant = slantLength {
                var top : Double?
                var bottom : Double?
                var spacing : Double?
                
                let bottomUnitContainer = Measurement(value: bottomToLightSpacing, unit: unitSystem == .metric ? UnitLength.centimeters : UnitLength.inches)
                let topUnitContainer = Measurement(value: lightToTopSpacing, unit: unitSystem == .metric ? UnitLength.centimeters : UnitLength.inches)
                let spacingContainer = Measurement(value: lightSpacing, unit: unitSystem == .metric ? UnitLength.centimeters : UnitLength.inches)
                
                if unitSystem == .metric {
                    bottom = bottomUnitContainer.converted(to: .meters).value
                    top = topUnitContainer.converted(to: .meters).value
                    spacing = spacingContainer.converted(to: .meters).value
                } else {
                    bottom = bottomUnitContainer.converted(to: .feet).value
                    top = topUnitContainer.converted(to: .feet).value
                    spacing = spacingContainer.converted(to: .feet).value
                }
                
                if let top = top, let bottom = bottom, let spacing = spacing {
                    let strandLights = Int(((slant - top - bottom) / spacing).rounded(.toNearestOrAwayFromZero))
                    return strandLights
                }
            }
        } else {
            return lightsPerString
        }
        return nil
    }
    
    var numberOfLights : Int? {
        if let numberOfStrings = numberOfStrings, let lightsPerString = lightsPerString {
            return lightsPerString * numberOfStrings
        }
        if let computedLightsPerString = computedLightsPerString, let numberOfStrings = numberOfStrings{
            return computedLightsPerString * numberOfStrings
        }
        return nil
    }
    
    
    //Main view
    var body: some View {
        Form {
            //Settings
            Section(header: Text("Settings")) {
                Picker("Unit of Measurement", selection: $unitSystem) {
                    Text("Metric")
                        .tag(UnitSystem.metric)
                    Text("Imperial")
                        .tag(UnitSystem.imperial)
                }
                .pickerStyle(SegmentedPickerStyle())
                Toggle("Calculate the tree height using light spacing and lights per string", isOn: $autoHeight)
            }
            //Input
            Section(header: Text("Tree")) {
                if !autoHeight {
                    DoubleInputRow(title: "Height", placeholder: autoHeight ? "" : "6.0", disabled: autoHeight, value: $enteredHeight, unit: unitSystem == .metric ? "m" : "ft.", unitFrame: 25)
                }
                DoubleInputRow(title: "Top Diameter", placeholder: "0.5", disabled: false, value: $topDiameter, unit: unitSystem == .metric ? "m" : "ft.", unitFrame: 25)
                DoubleInputRow(title: "Bottom Diameter", placeholder: "1.0", disabled: false, value: $bottomDiameter, unit: unitSystem == .metric ? "m" : "ft.", unitFrame: 25)
                DoubleInputRow(title: "Circumference Covered", placeholder: "100", disabled: false, value: $circumferenceCovered, unit: "%", unitFrame: 25)
                
                DoubleInputRow(title: "Space to Top Light", placeholder: "2.0", disabled: false, value: $lightToTopSpacing, unit: unitSystem == .metric ? "cm" : "in.", unitFrame: 25)
                DoubleInputRow(title: "Space After Bottom Light", placeholder: "5.0", disabled: false, value: $bottomToLightSpacing, unit: unitSystem == .metric ? "cm" : "in.", unitFrame: 25)
                DoubleInputRow(title: "Spacing Between Lights", placeholder: "4.0", disabled: false, value: $lightSpacing, unit: unitSystem == .metric ? "cm" : "in.", unitFrame: 25)
                IntegerInputRow(title: "Number of Strings", placeholder: "12", unit: "Strings", value: $numberOfStrings)
                if autoHeight {
                    IntegerInputRow(title: "Lights per String", placeholder: "50", unit: "Lights", value: $lightsPerString)
                }
            }
            .onTapGesture {hideKeyboard()}
            
            //Results
            Section(header: Text("Result")) {
                MixedLengthResultRow(title: "Height", length: Binding(get: {computedHeight}, set: {newValue in}), unitSystem: $unitSystem)
                MixedLengthResultRow(title: "Top Circumference", length: Binding(get: {topCircumference}, set: {newValue in}), unitSystem: $unitSystem)
                MixedLengthResultRow(title: "Bottom Circumference", length: Binding(get: {bottomCircumference}, set: {newValue in}), unitSystem: $unitSystem)
                MixedLengthResultRow(title: "Top Spacing", length: Binding(get: {topSpacing}, set: {newValue in}), unitSystem: $unitSystem)
                MixedLengthResultRow(title: "Bottom Spacing", length: Binding(get: {bottomSpacing}, set: {newValue in}), unitSystem: $unitSystem)

                HStack {
                    Text("Lights per String")
                    Spacer()
                    if let computedLightsPerString = computedLightsPerString {
                        Text("\(computedLightsPerString)  Lights")
                    }
                }

                HStack {
                    Text("Number of lights")
                    Spacer()
                    if let numberOfLights = numberOfLights {
                        Text("\(numberOfLights)  Lights")
                    }
                }

            }
            .onTapGesture {hideKeyboard()}
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Tree Lights Calculator")
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

struct TreeLightsCalculator_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TreeLightsCalculator(unitSystem: .metric, autoHeight: false, enteredHeight: 3, topDiameter: 0.5, bottomDiameter: 1, circumferenceCovered: 90, numberOfStrings: 12, lightToTopSpacing: 2, bottomToLightSpacing: 3, lightSpacing: 8, lightsPerString: nil)
        }
    }
}
