import SceneKit

public class ARNodeManager {
    
    public static func loadPokeNode(cardName: String) -> SCNNode? {
        let bundle = Bundle(for: ARNodeManager.self)
        if let pokeScene = SCNScene(named: "art.scnassets/\(cardName)_scene.scn", inDirectory: nil, options: nil) {
            return pokeScene.rootNode.childNodes.first
        }
        print("Node for \(cardName) not found.")
        return nil
    }
}
