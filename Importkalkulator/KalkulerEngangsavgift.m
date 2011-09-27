#import "KalkulerEngangsavgift.h"

@implementation KalkulerEngangsavgift

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (NSNumber *)vekt:(NSNumber *)vekt
{
    if (vekt <= 1150) {
        return 0;
    } else {
        return 1000;
    }
}

@end
