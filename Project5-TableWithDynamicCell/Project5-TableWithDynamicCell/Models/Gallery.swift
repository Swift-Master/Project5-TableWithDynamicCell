import Foundation

struct Gallery: Codable {
    
    var artists : [Artists?]
    
    static func getData() -> Gallery? {
        var artGallery : Gallery?
        do {
            if let bundlePath = Bundle.main.path(forResource: "artists", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                artGallery = try JSONDecoder().decode(Gallery.self, from: jsonData)
            }
        } catch {
            print(error)
        }
        return artGallery
    }
    
}
