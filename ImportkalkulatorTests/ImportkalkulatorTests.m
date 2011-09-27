#import "ImportkalkulatorTests.h"

@implementation ImportkalkulatorTests

@synthesize kalkuler;

- (void)setUp
{
    [super setUp];
    kalkuler = [kalkuler init];
}

- (void)tearDown
{
    [super tearDown];
    [kalkuler release];
}

- (void)testVekttrinn1
{
    NSNumber *delavgift = [kalkuler vekt:[NSNumber numberWithInt:1200]];
    assert(delavgift == 0);
}

@end
