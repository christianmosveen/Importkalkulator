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

- (NSArray *)biler
{
    return biler;
}

- (Bil *)opprettBil
{
    Bil *bil = [[Bil alloc] init];
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

- (void)populer
{
    Bil *bil1 = [[Bil alloc] initWithNavn:@"2010 Golf TDI" vekt:1300 effekt:77 co2:119 nox:60 registreringsdato:[NSDate date]];
    Bil *bil2 = [[Bil alloc] initWithNavn:@"2009 Audi A4 Quattro" vekt:1500 effekt:100 co2:130 nox:74 registreringsdato:[NSDate date]];
    Bil *bil3 = [[Bil alloc] initWithNavn:@"2010 Touran 2,0 TDI" vekt:1600 effekt:110 co2:129 nox:68 registreringsdato:[NSDate date]];
    
    biler = [[NSMutableArray alloc] initWithObjects:bil1, bil2, bil3, nil];
}

@end
