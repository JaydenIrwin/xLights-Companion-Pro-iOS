//
//  OutletDataSource.swift
//  xLights Tools
//
//  Created by Nicholas Long on 2021-04-16.
//

import Foundation

class OutletDataSource: ObservableObject {
    
    static let defaultData = [
        Port(number: 1, objects: [PortObject(name: "Mega Tree", pixels: 1000)]),
        Port(number: 2, objects: []),
        Port(number: 3, objects: []),
        Port(number: 4, objects: [])
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
        ports.append(Port(number: ports.endIndex+1, objects: []))
        save()
    }
    
    func addNewPortObject() -> PortObject {
        let newItem = PortObject(name: "", pixels: 0)
        let pIndex = ports.endIndex - 1
        ports[pIndex].objects.append(newItem)
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
    
    func removePortObject(_ object: PortObject) {
        for (pIndex, port) in ports.enumerated() {
            if let oIndex = port.objects.firstIndex(where: { $0.uuid == object.uuid }) {
                ports[pIndex].objects.remove(at: oIndex)
                break
            }
        }
        save()
    }
    
    func editPortObject(uuid: UUID, name: String, pixels: Int) {
        for (pIndex, port) in ports.enumerated() {
            if let oIndex = port.objects.firstIndex(where: { $0.uuid == uuid }) {
                ports[pIndex].objects[oIndex].name = name
                ports[pIndex].objects[oIndex].pixels = pixels
                break
            }
        }
        save()
    }
    
    func movePortObject(_ object: PortObject, to newPort: Port) {
        self.removePortObject(object)
        self.ports[newPort.number-1].objects.append(object)
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
