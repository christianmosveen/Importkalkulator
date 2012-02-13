#import <Foundation/Foundation.h>

@interface KalkulerEngangsavgift : NSObject

- (double)avgiftMedVekt:(int)vekt effekt:(int)effekt nox:(int)nox co2:(int)co2;
- (double)vekt:(int)vekt;
- (int)effekt:(int)effekt;
- (int)nox:(int)nox;
- (int)co2:(int)co2;

@end
