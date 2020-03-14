import UIKit

// MARK: Models

struct Human: Codable {
  let fullName: String
}

struct MyCodingKey: CodingKey {
  var stringValue: String
  init?(stringValue: String) {
    self.stringValue = stringValue
  }
  var intValue: Int? {
    return nil
  }
  init?(intValue: Int) {
    return nil
  }
}

// MARK: Data

let jsonString = """
{
  "full_name": "Pavan Powani",
}
"""

let decoder = JSONDecoder()

// MARK: Logic
decoder.keyDecodingStrategy = .custom { keys in

    print("keys: \(keys), \(keys.count)")
    let lastKey = keys.last!
    print("lastKey: \(lastKey.stringValue)")
    if lastKey.stringValue == "full_name" {
        let finalKey = "fullName"
        let val = MyCodingKey(stringValue: finalKey)!
        print(val)
        return val
    }
    return lastKey
}
let data = Data(jsonString.utf8)
print(data)
let result = try? decoder.decode(Human.self, from: data)
print(result!)
