#import "BilStore.h"
#import "Bil.h"

@implementation BilStore

+ (BilStore *)instance
{
    static BilStore *store = nil;
    if (!store) {
        store = [[super allocWithZone:nil] init];
    }
    return store;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self instance];
}

- (id)init
{
    self = [super init];
    if (self) {
        NSString *arkivFil = [self arkivLokasjon];
        biler = [NSKeyedUnarchiver unarchiveObjectWithFile:arkivFil];
        
        if (!biler)
            biler = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSMutableArray *)biler
{
    return biler;
}

- (Bil *)opprettBil
{
    Bil *bil = [[Bil alloc] init];
    bil.navn = [NSString stringWithFormat:@"Bil %d", biler.count + 1];
    [biler addObject:bil];
    return bil;
}

- (NSString *)arkivLokasjon
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"biler.archive"];
}

- (BOOL)lagre
{
    return [NSKeyedArchiver archiveRootObject:biler toFile:[self arkivLokasjon]];
}

@end
