import UIKit
import WebKit

class iForgotViewController: UIViewController, WKUIDelegate {
    
    var isLoadingViewController = false
    var requestsWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoadingViewController = true
        viewLoadSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isLoadingViewController {
            isLoadingViewController = false
        } else {
            viewLoadSetup()
        }
    }
    
    
    func viewLoadSetup(){
        // setup view did load here
        let webConfiguration = WKWebViewConfiguration()
        requestsWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        requestsWebView.uiDelegate = self
        view = requestsWebView
        
        let myURL = URL(string:"https://iforgot.azwestern.edu/")
        let myRequest = URLRequest(url: myURL!)
        requestsWebView.load(myRequest)
    }
    
    
}
