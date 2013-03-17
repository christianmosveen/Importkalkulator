#import "ImportkalkulatorTests.h"

@implementation ImportkalkulatorTests

@synthesize kalkuler;

int const DAG = 86400;

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
    STAssertEquals(delavgift, 37590.0, @"Trinn 1");
    delavgift = [kalkuler vekt:1150];
    STAssertEqualsWithAccuracy(delavgift, 43228.5, 0.001, @"Trinn 1");
    delavgift = [kalkuler vekt:1151];
    STAssertEqualsWithAccuracy(delavgift, 43310.44, 0.001, @"Trinn 2");
    delavgift = [kalkuler vekt:1400];
    STAssertEqualsWithAccuracy(delavgift, 63713.5, 0.001, @"Trinn 2");
    delavgift = [kalkuler vekt:1401];
    STAssertEqualsWithAccuracy(delavgift, 63877.4, 0.001, @"Trinn 3");
    delavgift = [kalkuler vekt:1500];
    STAssertEqualsWithAccuracy(delavgift, 80103.5, 0.001, @"Trinn 3");
    delavgift = [kalkuler vekt:1700];
    STAssertEqualsWithAccuracy(delavgift, 118225.5, 0.001, @"Trinn 4");
}

- (void)testEffekt
{
    int delavgift = [kalkuler effekt:65];
    STAssertEquals(delavgift, 0, @"Trinn 1");
    delavgift = [kalkuler effekt:66];
    STAssertEquals(delavgift, 275, @"Trinn 2");
    delavgift = [kalkuler effekt:90];
    STAssertEquals(delavgift, 6875, @"Trinn 2");
    delavgift = [kalkuler effekt:91];
    STAssertEquals(delavgift, 7665, @"Trinn 3");
    delavgift = [kalkuler effekt:130];
    STAssertEquals(delavgift, 38475, @"Trinn 3");
    delavgift = [kalkuler effekt:150];
    STAssertEquals(delavgift, 77675, @"Trinn 4");
}

- (void)testNoX
{
    int delavgift = [kalkuler nox:1];
    STAssertEquals(delavgift, 35, @"NOx");
    delavgift = [kalkuler nox:100];
    STAssertEquals(delavgift, 3500, @"NOx");
}

- (void)testCo2
{
    int delavgift = [kalkuler co2:1];
    STAssertEquals(delavgift, -96174, @"Trinn 1");
    delavgift = [kalkuler co2:49];
    STAssertEquals(delavgift, -49806, @"Trinn 1");
    delavgift = [kalkuler co2:50];
    STAssertEquals(delavgift, -48840, @"Trinn 2");
    delavgift = [kalkuler co2:109];
    STAssertEquals(delavgift, -814, @"Trinn 2");
    delavgift = [kalkuler co2:110];
    STAssertEquals(delavgift, 0, @"Nullpunkt");
    delavgift = [kalkuler co2:111];
    STAssertEquals(delavgift, 764, @"Trinn 3");
    delavgift = [kalkuler co2:125];
    STAssertEquals(delavgift, 11460, @"Trinn 3");
    delavgift = [kalkuler co2:126];
    STAssertEquals(delavgift, 12230, @"Trinn 4");
    delavgift = [kalkuler co2:165];
    STAssertEquals(delavgift, 42260, @"Trinn 4");
    delavgift = [kalkuler co2:166];
    STAssertEquals(delavgift, 44056, @"Trinn 5");
    delavgift = [kalkuler co2:235];
    STAssertEquals(delavgift, 167980, @"Trinn 5");
    delavgift = [kalkuler co2:250];
    STAssertEquals(delavgift, 211225, @"Trinn 6");
}

- (void)testBruksfradrag
{
    float bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-MND]];
    STAssertEquals(bruksfradrag, 0.02f, @"Trinn 1");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-2*MND]];
    STAssertEquals(bruksfradrag, 0.04f, @"Trinn 2");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-3*MND]];
    STAssertEquals(bruksfradrag, 0.06f, @"Trinn 3");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-4*MND]];
    STAssertEquals(bruksfradrag, 0.08f, @"Trinn 4");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-5*MND]];
    STAssertEquals(bruksfradrag, 0.10f, @"Trinn 5");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-6*MND]];
    STAssertEquals(bruksfradrag, 0.11f, @"Trinn 6");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-7*MND]];
    STAssertEquals(bruksfradrag, 0.12f, @"Trinn 7");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-8*MND]];
    STAssertEquals(bruksfradrag, 0.13f, @"Trinn 8");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-9*MND]];
    STAssertEquals(bruksfradrag, 0.14f, @"Trinn 9");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-10*MND]];
    STAssertEquals(bruksfradrag, 0.15f, @"Trinn 10");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-11*MND]];
    STAssertEquals(bruksfradrag, 0.16f, @"Trinn 11");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-AAR]];
    STAssertEquals(bruksfradrag, 0.17f, @"Trinn 12");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(AAR+2*MND)]];
    STAssertEquals(bruksfradrag, 0.19f, @"Trinn 13");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(AAR+4*MND)]];
    STAssertEquals(bruksfradrag, 0.21f, @"Trinn 14");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(AAR+6*MND)]];
    STAssertEquals(bruksfradrag, 0.23f, @"Trinn 15");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(AAR+8*MND)]];
    STAssertEquals(bruksfradrag, 0.25f, @"Trinn 16");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(AAR+10*MND)]];
    STAssertEquals(bruksfradrag, 0.27f, @"Trinn 17");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-2*AAR]];
    STAssertEquals(bruksfradrag, 0.30f, @"Trinn 18");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(2*AAR+6*MND)]];
    STAssertEquals(bruksfradrag, 0.33f, @"Trinn 19");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-3*AAR]];
    STAssertEquals(bruksfradrag, 0.36f, @"Trinn 20");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(3*AAR+6*MND)]];
    STAssertEquals(bruksfradrag, 0.39f, @"Trinn 21");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-4*AAR]];
    STAssertEquals(bruksfradrag, 0.42f, @"Trinn 22");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-5*AAR]];
    STAssertEquals(bruksfradrag, 0.45f, @"Trinn 23");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-6*AAR]];
    STAssertEquals(bruksfradrag, 0.50f, @"Trinn 24");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(7*AAR+DAG)]];
    STAssertEquals(bruksfradrag, 0.55f, @"Trinn 25");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(8*AAR+DAG)]];
    STAssertEquals(bruksfradrag, 0.59f, @"Trinn 26");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(9*AAR+DAG)]];
    STAssertEquals(bruksfradrag, 0.63f, @"Trinn 27");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(10*AAR+DAG)]];
    STAssertEquals(bruksfradrag, 0.67f, @"Trinn 28");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(11*AAR+DAG)]];
    STAssertEquals(bruksfradrag, 0.70f, @"Trinn 29");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(12*AAR+DAG)]];
    STAssertEquals(bruksfradrag, 0.73f, @"Trinn 30");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(13*AAR+DAG)]];
    STAssertEquals(bruksfradrag, 0.76f, @"Trinn 31");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(14*AAR+DAG)]];
    STAssertEquals(bruksfradrag, 0.78f, @"Trinn 32");
    bruksfradrag = [kalkuler bruksfradrag:[NSDate dateWithTimeIntervalSinceNow:-(15*AAR+DAG)]];
    STAssertEquals(bruksfradrag, 0.80f, @"Trinn 33");
}

- (void)testAvgift
{
    double avgift = [kalkuler avgiftMedVekt:1300 effekt:75 nox:100 co2:119];
    STAssertEquals(avgift, 68645.5, @"Avgift");
}

- (void)testAvgiftMedBruksfradrag
{
    double avgiftMedBruksfradrag = [kalkuler avgiftMedVekt:1300 effekt:75 nox:100 co2:119 registreringsdato:[NSDate dateWithTimeIntervalSinceNow:-AAR]];
    STAssertEquals(avgiftMedBruksfradrag, 56976.0, @"Avgift med bruksfradrag");
}

@end
