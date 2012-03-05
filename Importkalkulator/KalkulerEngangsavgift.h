#import <Foundation/Foundation.h>

@interface KalkulerEngangsavgift : NSObject

extern int const MND;
extern int const AAR;

- (double)avgiftMedVekt:(int)vekt effekt:(int)effekt nox:(int)nox co2:(int)co2;
- (double)avgiftMedVekt:(int)vekt effekt:(int)effekt nox:(int)nox co2:(int)co2 registreringsdato:(NSDate *)registreringsdato;
- (double)vekt:(int)vekt;
- (int)effekt:(int)effekt;
- (int)nox:(int)nox;
- (int)co2:(int)co2;
- (float)bruksfradrag:(NSDate *)registrert;

@end
