//
//  ITC_Assignment_16Tests.swift
//  ITC-Assignment-16Tests
//
//  Created by Isaiah Ojo on 24/04/2023.
//

import XCTest
@testable import ITC_Assignment_16

final class ITC_Assignment_16Tests: XCTestCase {

    var tnm: TestNetworkManager!
    var pvm: PokemonViewModel!
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        tnm = TestNetworkManager()
        pvm = PokemonViewModel(manager: tnm)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        tnm = nil
        pvm = nil
    }

    func testGetListOfPokemonsSuccess() throws {
        let expectation = self.expectation(description: "Fetching List of Pokemon")
        let urlString = "https://api.pokemontcg.io/v2/cards?page=1&pageSize=40"
        var pokemonList: [PokemonDetails] = []

        pvm.getListOfPokemons(urlString: urlString) { result in
            switch result {
            case .success(let list):
                pokemonList = list
                XCTAssertGreaterThan(pokemonList.count, 0, "Pokemon list should not be empty")
                expectation.fulfill()

            case .failure(let error):
                XCTFail("Fetching list of pokemon failed with error: \(error.localizedDescription)")
            }
        }

        waitForExpectations(timeout: 10.0, handler: nil)
    }

    func testGetListOfPokemonsFailure() throws {
        let expectation = self.expectation(description: "Fetching List of Pokemon")
        let urlString = "https://invalid-url.com"
        var error: NetworkError?

        pvm.getListOfPokemons(urlString: urlString) { result in
            switch result {
            case .success:
                XCTFail("Fetching list of pokemon should have failed")
            case .failure(let err):
                error = err
                XCTAssertNotNil(error, "Error should not be nil")
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testAPI() throws {
        
    }


}
