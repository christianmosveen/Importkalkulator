#import <Foundation/Foundation.h>

@interface Avgift : NSObject <NSCoding>

@property NSString* bil;
@property int vekt;
@property int effekt;
@property int co2;
@property int nox;
@property NSDate* registreringsdato;

- (id)initWithBil:(NSString *)b;
- (id)initWithBil:(NSString *)b vekt:(int)v effekt:(int)e co2:(int)c nox:(int)n registreringsdato:(NSDate *)r;

@end
