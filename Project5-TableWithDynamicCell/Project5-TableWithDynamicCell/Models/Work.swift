import Foundation

class Works: Codable {

  var title : String?
  var image : String?
  var info  : String?
  var isSelected : Bool = false
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.info = try container.decodeIfPresent(String.self, forKey: .info)
    }
}
