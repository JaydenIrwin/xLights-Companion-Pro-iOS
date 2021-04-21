//
//  OutletDataSource.swift
//  xLights Tools
//
//  Created by Nicholas Long on 2021-04-16.
//

import Foundation

class OutletDataSource: ObservableObject {
    
    static let defaultData = [
        Port(number: 1, props: [OrganizerProp(name: "Mega Tree", pixels: 1000)]),
        Port(number: 2, props: []),
        Port(number: 3, props: []),
        Port(number: 4, props: [])
    ]
    
    static func load() -> [Port] {
        guard let fileURL  = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Outlet Org Ports").appendingPathExtension("json") else { return defaultData }
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode([Port].self, from: data)
        } catch {
            print("Unable to decode")
            return defaultData
        }
    }
    
    @Published var ports: [Port] = OutletDataSource.load()
    
    func addNewPort() {
        ports.append(Port(number: ports.endIndex+1, props: []))
        save()
    }
    
    func addNewPortObject() -> OrganizerProp {
        let newItem = OrganizerProp(name: "", pixels: 0)
        let pIndex = ports.endIndex - 1
        ports[pIndex].props.append(newItem)
        save()
        return newItem
    }
    
    func removePort(_ port: Port) {
        ports.remove(at: port.number-1)
        // Recalculate port ids after removal
        for (index) in ports.indices {
            ports[index].number = index + 1
        }
        save()
    }
    
    func removeProp(_ prop: OrganizerProp) {
        for (pIndex, port) in ports.enumerated() {
            if let oIndex = port.props.firstIndex(where: { $0.uuid == prop.uuid }) {
                ports[pIndex].props.remove(at: oIndex)
                break
            }
        }
        save()
    }
    
    func editProp(uuid: UUID, name: String, pixels: Int) {
        for (pIndex, port) in ports.enumerated() {
            if let oIndex = port.props.firstIndex(where: { $0.uuid == uuid }) {
                ports[pIndex].props[oIndex].name = name
                ports[pIndex].props[oIndex].pixels = pixels
                break
            }
        }
        save()
    }
    
    func moveProp(_ prop: OrganizerProp, to newPort: Port) {
        self.removeProp(prop)
        self.ports[newPort.number-1].props.append(prop)
        save()
    }
    
    func deleteAll() {
        ports = OutletDataSource.defaultData
        save()
    }
    
    func save() {
        guard let fileURL  = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Outlet Org Ports").appendingPathExtension("json") else {return}
        do {
            let data = try JSONEncoder().encode(ports)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save ports")
        }
    }
    
}
