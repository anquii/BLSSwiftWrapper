import XCTest
import MCLSwiftWrapper
import BLSSwiftWrapper

final class BLSSwiftWrapperTests: XCTestCase {
    private static let curveType = Int32(MCL_BLS12_381)
    private static let compilationTime = Int32(MCLBN_FR_UNIT_SIZE * 10 + MCLBN_FP_UNIT_SIZE + BLS_COMPILER_TIME_VAR_ADJ)

    func testGivenCurveType_AndCompilationTime_WhenInit_ThenSuccess() {
        let result = blsInit(Self.curveType, Self.compilationTime)
        XCTAssertEqual(result, 0)
    }

    func testGivenInvalidCurveType_WhenInit_ThenFailure() {
        let curveType = Int32(-1)
        let result = blsInit(curveType, Self.compilationTime)
        XCTAssertNotEqual(result, 0)
    }

    func testGivenInvalidCompilationTime_WhenInit_ThenFailure() {
        let compilationTime = Int32(0)
        let result = blsInit(Self.curveType, compilationTime)
        XCTAssertNotEqual(result, 0)
    }

    func testGivenBLS12381CurveType_WhenInit_AndGetETHSerializationMode_ThenEnabled() {
        blsInit(Self.curveType, Self.compilationTime)
        XCTAssertEqual(mclBn_getETHserialization(), 1)
    }

    func testGivenBLS12381CurveType_AndSupportedETHMode_WhenInit_AndSetETHMode_ThenSuccess() {
        let mode = Int32(BLS_ETH_MODE_LATEST)
        blsInit(Self.curveType, Self.compilationTime)
        let result = blsSetETHmode(mode)
        XCTAssertEqual(result, 0)
    }

    func testGivenBLS12381CurveType_AndUnsupportedETHMode_WhenInit_AndSetETHMode_ThenFailure() {
        let mode = Int32(BLS_ETH_MODE_DRAFT_05)
        blsInit(Self.curveType, Self.compilationTime)
        let result = blsSetETHmode(mode)
        XCTAssertEqual(result, -1)
    }

    func testGivenSupportedMode_WhenSetMapToMode_ThenSuccess() {
        let mode = Int32(MCL_MAP_TO_MODE_HASH_TO_CURVE_07)
        let result = blsSetMapToMode(mode)
        XCTAssertEqual(result, 0)
    }

    func testGivenUnsupportedMode_WhenSetMapToMode_ThenFailure() {
        let mode = Int32(MCL_MAP_TO_MODE_HASH_TO_CURVE_06)
        let result = blsSetMapToMode(mode)
        XCTAssertEqual(result, -1)
    }
}
