//
//  PlayerDataServicesTests.swift
//  challengeFinalTests
//
//  Created by Ivo Dutra on 24/10/20.
//

import XCTest
@testable import challengeFinal

class PlayerDataServicesTests: XCTestCase {

    var sut: PlayerDataService!
    var mockedUserDefaults: UserDefaults!
    let mockedPoints = 42
    let mockedPath = [1, 2, 3]

    override func setUp() {
        super.setUp()
        mockedUserDefaults = UserDefaults()

        sut = PlayerDataService(instance: mockedUserDefaults)
    }

    override func tearDown() {
        sut = nil
        mockedUserDefaults = nil

        super.tearDown()
    }

    func mockData() {
        mockedUserDefaults.setValue(mockedPoints, forKey: sut.pointsString)
        mockedUserDefaults.setValue(mockedPath, forKey: sut.storyPathString)
        mockedUserDefaults.setValue(false, forKey: sut.sawOnboarding)
    }

    // MARK: - Get

    func testGetPoints() {
        mockData()
        XCTAssertEqual(sut.getPoints(), mockedPoints)
    }

    func testGetStoryPath() {
        mockData()
        XCTAssertEqual(sut.getStoryPath(), mockedPath)
    }

    // MARK: - Save

    func testSavePoints() {
        sut.savePoints(43)

        XCTAssertEqual(sut.getPoints(), 43)
    }

    func saveStoryPath() {
        let path = [4, 5, 6]
        sut.saveStoryPath(path)

        XCTAssertEqual(sut.getStoryPath(), path)
    }
    
    func testGetUserSawOnboarding() {
        var didSee = sut.getUserSawOnboarding()
        XCTAssertFalse(didSee)
        
        sut.setUserFinishedOnboarding()
        didSee = sut.getUserSawOnboarding()
        XCTAssertTrue(didSee)
    }
}

