//
//  OutletDataSource.swift
//  xLights Tools
//
//  Created by Nicholas Long on 2021-04-16.
//

import Foundation

class OutletDataSource: ObservableObject {
    
    static let defaultData = [
        Port(id: 1, objects: [PortObject(name: "Mega Tree", pixels: 1000)]),
        Port(id: 2, objects: []),
        Port(id: 3, objects: []),
        Port(id: 4, objects: [])
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
    
    func createPortObject() -> (Int, Int) {
        let newItem = PortObject(name: nil, pixels: nil)
        let pIndex = ports.endIndex - 1
        let oIndex = ports[pIndex].objects.endIndex
        ports[pIndex].objects.append(newItem)
        save()
        return (pIndex, oIndex)
    }
    
    func removePort(_ port: Port) {
        ports.remove(at: port.id-1)
        // Recalculate port ids after removal
        for (index) in ports.indices {
            ports[index].id = index + 1
        }
        save()
    }
    
    func movePortObject(_ object: PortObject, to newPort: Port) {
        for (pIndex, port) in ports.enumerated() {
            if let oIndex = port.objects.firstIndex(where: { $0.id == object.id }) {
                ports[pIndex].objects.remove(at: oIndex)
                break
            }
        }
        ports[newPort.id-1].objects.append(object)
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
