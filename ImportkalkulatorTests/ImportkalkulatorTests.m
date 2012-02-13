#import "ImportkalkulatorTests.h"

@implementation ImportkalkulatorTests

@synthesize kalkuler;

- (void)setUp
{
    [super setUp];
    kalkuler = [[KalkulerEngangsavgift alloc] init];
}

- (void)tearDown
{
    [super tearDown];
    [kalkuler release];
}

- (void)testVekt
{
    double delavgift = [kalkuler vekt:1000];
    STAssertEquals(delavgift, 36890.0, @"Trinn 1");
    delavgift = [kalkuler vekt:1150];
    STAssertEquals(delavgift, 42423.5, @"Trinn 1");
    delavgift = [kalkuler vekt:1151];
    STAssertEquals(delavgift, 42503.91, @"Trinn 2");
    delavgift = [kalkuler vekt:1400];
    STAssertEquals(delavgift, 62526.0, @"Trinn 2");
    delavgift = [kalkuler vekt:1401];
    STAssertEquals(delavgift, 62686.84, @"Trinn 3");
    delavgift = [kalkuler vekt:1500];
    STAssertEquals(delavgift, 78610.0, @"Trinn 3");
    delavgift = [kalkuler vekt:1700];
    STAssertEquals(delavgift, 116022.0, @"Trinn 4");
}

- (void)testEffekt
{
    int delavgift = [kalkuler effekt:65];
    STAssertEquals(delavgift, 0, @"Trinn 1");
    delavgift = [kalkuler effekt:66];
    STAssertEquals(delavgift, 315, @"Trinn 2");
    delavgift = [kalkuler effekt:90];
    STAssertEquals(delavgift, 7875, @"Trinn 2");
    delavgift = [kalkuler effekt:91];
    STAssertEquals(delavgift, 8770, @"Trinn 3");
    delavgift = [kalkuler effekt:130];
    STAssertEquals(delavgift, 43675, @"Trinn 3");
    delavgift = [kalkuler effekt:150];
    STAssertEquals(delavgift, 87675, @"Trinn 4");
}

- (void)testNoX
{
    int delavgift = [kalkuler nox:1];
    STAssertEquals(delavgift, 22, @"NOx");
    delavgift = [kalkuler nox:100];
    STAssertEquals(delavgift, 2200, @"NOx");
}

- (void)testCo2
{
    int delavgift = [kalkuler co2:1];
    STAssertEquals(delavgift, -86650, @"Trinn 1");
    delavgift = [kalkuler co2:49];
    STAssertEquals(delavgift, -45850, @"Trinn 1");
    delavgift = [kalkuler co2:50];
    STAssertEquals(delavgift, -45000, @"Trinn 2");
    delavgift = [kalkuler co2:109];
    STAssertEquals(delavgift, -750, @"Trinn 2");
    delavgift = [kalkuler co2:110];
    STAssertEquals(delavgift, 0, @"Nullpunkt");
    delavgift = [kalkuler co2:111];
    STAssertEquals(delavgift, 750, @"Trinn 3");
    delavgift = [kalkuler co2:130];
    STAssertEquals(delavgift, 15000, @"Trinn 3");
    delavgift = [kalkuler co2:131];
    STAssertEquals(delavgift, 15756, @"Trinn 4");
    delavgift = [kalkuler co2:170];
    STAssertEquals(delavgift, 45240, @"Trinn 4");
    delavgift = [kalkuler co2:171];
    STAssertEquals(delavgift, 47003, @"Trinn 5");
    delavgift = [kalkuler co2:240];
    STAssertEquals(delavgift, 168650, @"Trinn 5");
    delavgift = [kalkuler co2:260];
    STAssertEquals(delavgift, 225230, @"Trinn 6");
}

- (void)testAvgift
{
    double avgift = [kalkuler avgiftMedVekt:1300 effekt:75 nox:100 co2:119];
    STAssertEquals(avgift, 66585.0, @"Avgift");
}

@end
