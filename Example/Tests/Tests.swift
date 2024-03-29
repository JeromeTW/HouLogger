import XCTest
import HouLogger

class Tests: XCTestCase {
  override func setUp() {
    super.setUp()
    logTextView.text = ""
    let fileManager = FileManager.default
    guard let cachesDirectory = fileManager.cachesDirectory else { return }
    do {
      try fileManager.removeItem(at: cachesDirectory)
    } catch {
      print(error.localizedDescription)
    }
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  enum APIError: Error {
    case invalidURL
  }
  
  func test_print_every_level() {
    logger.configure(shouldShow: true, shouldCache: false)
    let userString = "userString"
    let codeString = "codeString"
    let traceString = "traceString"
    let errorString = "errorString"
    logU(userString)
    logC(codeString)
    logT(issue: "#36", message: traceString)
    logE(errorString, error: APIError.invalidURL)
    XCTAssert(logTextView.text.contains(userString))    
    XCTAssert(logTextView.text.contains(codeString))
    XCTAssert(logTextView.text.contains(traceString))
    XCTAssert(logTextView.text.contains(errorString))
  }
  
  func test_log_file_is_existed() {
    logger.configure(shouldShow: false, shouldCache: true)
    let userString = "userString"
    let codeString = "codeString"
    let traceString = "traceString"
    let errorString = "errorString"
    logU(userString)
    logC(errorString)
    logT(issue: "#36", message: traceString)
    logE(errorString, error: APIError.invalidURL)
    let fileManager = FileManager.default
    guard let cachesDirectory = fileManager.cachesDirectory else { return }
    let currentDateString = Date().toString(dateFormat: "yyyyMMdd")
    let filePath = cachesDirectory.appendingPathComponent("\(currentDateString).log")

    XCTAssert(fileManager.fileExists(atPath: filePath.path))
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure() {
      // Put the code you want to measure the time of here.
    }
  }
  
}
