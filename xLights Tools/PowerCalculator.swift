//
//  ACDCCalculator.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-02-05.
//

import SwiftUI

struct PowerCalculator: View {
    
    enum LightType : String {
        case pixels = "Pixels"
        case incandecent = "Incandecent"
    }
    
    @State var lightType : LightType = .pixels
    @State var pixelVoltage : Double?
    @State var milliampsPerLight : Double?
    @State var runningBrightness : Double?
    @State var powerSupplyWattage : Int?
    @State var maximumSupplyUsage : Double?
    
    @State var numberOfStrings : Int?
    @State var lightsPerString : Int?
    
    var voltage : Double? {
        if lightType == .incandecent {
            return 120
        } else {
            return pixelVoltage
        }
    }
    
    var ampsPerString : Double? {
        if lightType == .pixels {
            if let milliampsPerLight = milliampsPerLight, let lightsPerString = lightsPerString, let runningBrightness = runningBrightness {
                //Convert running brightness to decimal to find how many milliamps we are running per bulb multiplied by the lights per string and then converted to amps
                return ((milliampsPerLight * (runningBrightness/100)) * Double(lightsPerString))/1000
            }
        } else {
            if let milliampsPerLight = milliampsPerLight, let lightsPerString = lightsPerString {
                return (milliampsPerLight * Double(lightsPerString))/1000
            }
        }
        return nil
    }
    
    var totalAmps : Double? {
        if let ampsPerString = ampsPerString, let numberOfStrings = numberOfStrings {
            return ampsPerString * Double(numberOfStrings)
        } else {
            return nil
        }
    }
    
    //MIGHT BE INCORRECT FOR INCANDECENT
    var wattsPerString : Double? {
        if let ampsPerString = ampsPerString, let voltage = voltage {
            return ampsPerString * voltage
        } else {
            return nil
        }
    }
    
    var totalWattage : Double? {
        if let wattsPerString = wattsPerString, let numberOfStrings = numberOfStrings {
            return wattsPerString * Double(numberOfStrings)
        } else {
            return nil
        }
    }
    
    var stringsPerPowerSupply : Int? {
        if let wattsPerString = wattsPerString, let powerSupplyWattage = powerSupplyWattage, let maximumSupplyUsage = maximumSupplyUsage {
            return Int(round((Double(powerSupplyWattage) * (maximumSupplyUsage / 100)) / wattsPerString))
        } else {
            return nil
        }
    }
    
    var numberOfPowerSupplies : Int? {
        if let stringsPerPowerSupply = stringsPerPowerSupply, let numberOfStrings = numberOfStrings, let totalWattage = totalWattage, let powerSupplyWattage = powerSupplyWattage, let maximumSupplyUsage = maximumSupplyUsage {
            if stringsPerPowerSupply < numberOfStrings {
                let powerSupplies = totalWattage / (Double(powerSupplyWattage) * (maximumSupplyUsage / 100))
                return Int(powerSupplies.rounded(.up))
            } else {
                return 1
            }
        } else {
            return nil
        }
    }
    
    var body: some View {
        Form {
            Section(header: Text("Lights")) {
                Picker("Light Type", selection: $lightType) {
                    Text(LightType.pixels.rawValue)
                        .tag(LightType.pixels)
                    Text(LightType.incandecent.rawValue)
                        .tag(LightType.incandecent)
                }
                .pickerStyle(SegmentedPickerStyle())
                IntegerInputRow(title: "Number of Strings", placeholder: "12", unit: "Strings", value: $numberOfStrings)
                IntegerInputRow(title: "Lights per String", placeholder: "50", unit: "Lights", value: $lightsPerString)
                IntegerInputRow(title: "Power Supply", placeholder: "350", unit: "Watts", value: $powerSupplyWattage)
                DoubleInputRow(title: "Maximum Supply Usage", placeholder: "80", disabled: false, value: $maximumSupplyUsage, unit: "%", unitFrame: 30)
                
                if lightType == .pixels {
                    DoubleInputRow(title: "Voltage", placeholder: "12", disabled: false, value: $pixelVoltage, unit: "Volt", unitFrame: 30)
                    DoubleInputRow(title: "Milliamps per Pixel", placeholder: "60", disabled: false, value: $milliampsPerLight, unit: "mA", unitFrame: 30)
                    DoubleInputRow(title: "Running Brightness", placeholder: "80", disabled: false, value: $runningBrightness, unit: "%", unitFrame: 30)
                } else {
                    DoubleInputRow(title: "Voltage", placeholder: "120", disabled: true, value: .constant(voltage), unit: "Volt", unitFrame: 30)
                    DoubleInputRow(title: "Milliamps per Light", placeholder: "60", disabled: false, value: $milliampsPerLight, unit: "mA", unitFrame: 30)
                }
                
            }
            
            Section(header: Text("Result")) {
                ResultRow(title: "Amps per String", value: Binding(get: {ampsPerString}, set: {_ in}), unit: "amps", unitFrame: 50)
                ResultRow(title: "Total Amperage", value: Binding(get: {totalAmps}, set: {_ in}), unit: "amps", unitFrame: 50)
                ResultRow(title: "Watts per String", value: Binding(get: {wattsPerString}, set: {_ in}), unit: "watts", unitFrame: 50)
                ResultRow(title: "Total Wattage", value: Binding(get: {totalWattage}, set: {_ in}), unit: "watts", unitFrame: 50)
                
                ResultRow(title: "Strings Possible per Supply", value: Binding(get: {
                    if let stringsPerPowerSupply = stringsPerPowerSupply {
                        return Double(stringsPerPowerSupply)
                    } else {
                        return nil
                    }
                }, set: {newValue in}), unit: "Strings", unitFrame: 70)
                ResultRow(title: "Power Supplies Needed", value: Binding(get: {
                    if let numberOfPowerSupplies = numberOfPowerSupplies {
                        return Double(numberOfPowerSupplies)
                    } else {
                        return nil
                    }
                }, set: {_ in}), unit: "Supplies", unitFrame: 70)
                
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Power Calculator")
    }
}

struct ACDCCalculator_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PowerCalculator()
        }
    }
}
