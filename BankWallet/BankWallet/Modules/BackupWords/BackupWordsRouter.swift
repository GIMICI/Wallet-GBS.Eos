import UIKit

class BackupWordsRouter {
    weak var viewController: UIViewController?
    private let delegate: IBackupDelegate

    init(delegate: IBackupDelegate) {
        self.delegate = delegate
    }
}

extension BackupWordsRouter: IBackupWordsRouter {

    func showConfirmation(delegate: IBackupConfirmationDelegate, words: [String]) {
        viewController?.navigationController?.pushViewController(BackupConfirmationRouter.module(delegate: delegate, words: words), animated: true)
    }

    func notifyBackedUp() {
        delegate.didBackUp()
    }

}

extension BackupWordsRouter {

    static func module(delegate: IBackupDelegate, words: [String]) -> UIViewController {

        let router = BackupWordsRouter(delegate: delegate)
        let presenter = BackupWordsPresenter(router: router, words: words)

        let viewController = BackupWordsController(delegate: presenter)

        router.viewController = viewController

        return viewController
    }

}
