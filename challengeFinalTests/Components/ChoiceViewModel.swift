//
//  ChoiceViewModel.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 26/10/20.
//

import Foundation

public protocol RandomAndBetDelegate: class {
    func didReceivedNode(node: StoryNode)
}

public class ChoiceViewModel {

    weak var hudDelegate: HUDViewDelegate?
    weak var delegate: ChoiceViewModelDelegate?
    weak var randomAndBetDelegate: RandomAndBetDelegate?

    var infos: ChoiceViewInfos?
    let service = StoryNodesServices()
    let playerService: PlayerServiceProtocol
    var eventLogger: LogEventProtocol

    init(infos: ChoiceViewInfos, coordinatorDelegate: ChoiceViewModelDelegate,
         playerService: PlayerServiceProtocol = PlayerService(),
         eventLogger: LogEventProtocol) {
        self.infos = infos
        self.delegate = coordinatorDelegate
        self.playerService = playerService
        self.eventLogger = eventLogger
    }

    public func userWantToDismiss() {
        delegate?.userWantToDismiss()
        eventLogger.logEvent("dismiss", parameters: nil)
    }

    public func userWantToConfirmChoice() {
        guard let dynamic = infos?.selectedDynamic else { return }
        eventLogger.logEvent("confirm_choice", parameters: ["dynamic": dynamic.title()])

        switch dynamic {
        case .choice:
            userChoosed()
        case .random:
            userChoosedRandom()
        case .bet:
            userChoosedBet()
        }
    }

    private func userChoosed() {
        guard let selectedNode = infos?.selectedNode else { return }
        playerService.decreasePlayerPoints(by: 1)
        delegate?.userWantToConfirmChoice(storyNode: selectedNode)
    }

    private func userChoosedRandom() {
        guard let randomNode = retrieveRandomNumber() else { return }
        delegate?.userWantToHighlightNode(node: randomNode)
        randomAndBetDelegate?.didReceivedNode(node: randomNode)
    }

    private func userChoosedBet() {
        guard let selectedNode = infos?.selectedNode,
              let randomNode = retrieveRandomNumber() else { return }

        delegate?.userGotRandom(node: randomNode)
        randomAndBetDelegate?.didReceivedNode(node: randomNode)

        if randomNode.id == selectedNode.id {
            playerService.increasePlayerPoints(by: 2)
        } else {
            playerService.decreasePlayerPoints(by: 1)
        }
    }

    private func retrieveRandomNumber() -> StoryNode? {
        guard let nodes = infos?.nodes,
              let randomNode = nodes.randomElement() else { return nil }
        return randomNode
    }

    public func userWantToChooseNode(_ nodeID: NodeID) {
        delegate?.userWantToChooseNode(node: nodeID)
    }

    public func userWantToChooseDynamic(_ dynamic: DynamicTypes) {
        delegate?.userWantToChooseDynamic(dynamic: dynamic)
    }

    public func userWantToPause() {
        delegate?.userWantToPause()
    }

    public func animationFinished() {
        guard let node = infos?.nodeToEndAnimation else { return }
        self.delegate?.userWantToConfirmChoice(storyNode: node)
    }

    // MARK: - HUDDelegate

    public func updateHUD() {
        // Get player's current points
        playerService.initializePlayer()
        hudDelegate?.updateHUD(with: playerService.player.points)
    }
}

extension ChoiceViewModel: LoggableScreen {
    func screenName() -> String {
        return "choice"
    }
    
    func logger() -> LogEventProtocol? {
        return eventLogger
    }
}
