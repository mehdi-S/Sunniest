import TipKit

struct CameraButtonTip: Tip {
    let id = "Sunniest.CameraButtonTip"
    // MARK: - Parameters
    @Parameter static var buttonWasTapped: Bool = false

    // MARK: - Rules
    var rules: [Rule] {
        #Rule(Self.$buttonWasTapped) { $0 == false }
    }

    // MARK: - Content
    var title: Text {
        Text("Take a Photo")
    }

    var message: Text? {
        Text("Tap here to capture and share photos of this location with the community")
    }
}
