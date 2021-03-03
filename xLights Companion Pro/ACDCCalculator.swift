//
//  ACDCCalculator.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-05.
//

import SwiftUI

struct ACDCCalculator: View {
    
    enum LightType : String{
        case pixels = "Pixels"
        case incandecent = "Incandecent"
    }
    
    @State var unitSystem = UnitSystem.metric
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
                Text("Overload - This combination will overload your system.")
            }
        }
        .listStyle(InsetGroupedListStyle())
        .frame(maxWidth: 512)
        .navigationTitle("AC/DC Calculator")
    }
}

struct ACDCCalculator_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ACDCCalculator()
        }
    }
}
