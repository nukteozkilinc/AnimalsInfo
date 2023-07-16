import UIKit
import WebKit


class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var url : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlString = url{
            webView.load(URLRequest(url: URL(string: urlString)!))
        }
        
    }
}
