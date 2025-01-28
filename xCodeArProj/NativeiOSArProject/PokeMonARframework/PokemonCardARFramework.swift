import UIKit
import ARKit

public class PokemonCardARFramework {
    
    public static func startAR(on viewController: UIViewController) -> ARPokemonViewController {
        let arViewController = ARPokemonViewController()
        viewController.present(arViewController, animated: true)
        return arViewController
    }
}
