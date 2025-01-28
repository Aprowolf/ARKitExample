import UIKit
import ARKit

public class ARPokemonViewController: UIViewController, ARSCNViewDelegate {
    
    public var sceneView: ARSCNView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the scene view
        sceneView = ARSCNView(frame: self.view.bounds)
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.autoenablesDefaultLighting = true
        self.view.addSubview(sceneView)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create and configure AR session
        let configuration = ARImageTrackingConfiguration()
        
        let bundle = Bundle(for: ARPokemonViewController.self)
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "PokemonCards", bundle: bundle) {
            configuration.trackingImages = imageToTrack
            configuration.maximumNumberOfTrackedImages = 2
            print("AR Markers Added!")
        }
        
        sceneView.session.run(configuration)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    public func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor,
           let cardName = imageAnchor.referenceImage.name {
            
            // Create plane for detected image
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width,
                                 height: imageAnchor.referenceImage.physicalSize.height)
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1, alpha: 0.3)
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            
            // Add AR object
            if let pokeNode = ARNodeManager.loadPokeNode(cardName: cardName) {
                pokeNode.eulerAngles.x = .pi / 2
                planeNode.addChildNode(pokeNode)
            }
            
            node.addChildNode(planeNode)
        }
        
        return node
    }
}
