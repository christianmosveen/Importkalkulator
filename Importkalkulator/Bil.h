#import <Foundation/Foundation.h>

@interface Bil : NSObject <NSCoding>

@property NSString* navn;
@property int vekt;
@property int effekt;
@property int co2;
@property int nox;
@property NSDate* registreringsdato;

- (id)initWithNavn:(NSString *)n;
- (id)initWithNavn:(NSString *)n vekt:(int)v effekt:(int)e co2:(int)c nox:(int)nx registreringsdato:(NSDate *)r;

@end
