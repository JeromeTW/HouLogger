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
  
  func test_print_every_level() {
    logger.configure([.fault, .error, .debug, .info, .normal], shouldShow: true, shouldCache: false)
    let faultString = "faultString"
    let errorString = "errorString"
    let debugString = "debugString"
    let infoString = "infoString"
    let normalString = "normalString"
    logF(faultString)
    logE(errorString)
    logD(debugString)
    logI(infoString)
    logN(normalString)
    XCTAssert(logTextView.text.contains(faultString))
    XCTAssert(logTextView.text.contains(errorString))
    XCTAssert(logTextView.text.contains(debugString))
    XCTAssert(logTextView.text.contains(infoString))
    XCTAssert(logTextView.text.contains(normalString))
  }
  
  func test_print_some_levels() {
    logger.configure([.fault, .error], shouldShow: true, shouldCache: false)
    let faultString = "faultString"
    let errorString = "errorString"
    let debugString = "debugString"
    let infoString = "infoString"
    let normalString = "normalString"
    logF(faultString)
    logE(errorString)
    logD(debugString)
    logI(infoString)
    logN(normalString)
    XCTAssert(logTextView.text.contains(faultString))
    XCTAssert(logTextView.text.contains(errorString))
    XCTAssert(logTextView.text.contains(debugString) == false)
    XCTAssert(logTextView.text.contains(infoString) == false)
    XCTAssert(logTextView.text.contains(normalString) == false)
  }
  
  func test_log_file_is_existed() {
    logger.configure([.fault, .error, .debug, .info, .normal], shouldShow: false, shouldCache: true)
    let faultString = "faultString"
    let errorString = "errorString"
    let debugString = "debugString"
    let infoString = "infoString"
    let normalString = "normalString"
    logF(faultString)
    logE(errorString)
    logD(debugString)
    logI(infoString)
    logN(normalString)
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
