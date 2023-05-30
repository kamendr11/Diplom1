import UIKit

enum SettingsFactory {
    
    static func getViewController(output: SettingsOutput) -> UIViewController {
        let mainView = SettingsView()
        let vc = SettingsViewController(mainView: mainView)
        
        let viewModel = SettingsViewModel()
        viewModel.output = output
        vc.setViewModel(viewModel: viewModel)
        
        return vc
    }
}
