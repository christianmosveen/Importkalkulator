#import "Avgift.h"

@implementation Avgift

@synthesize bil;
@synthesize vekt;
@synthesize effekt;
@synthesize co2;
@synthesize nox;
@synthesize registreringsdato;

- (id)initWithBil:(NSString *)b {
    self = [super init];
    if (self) {
        self.bil = b;
    }
    
    return self;
}

- (id)initWithBil:(NSString *)b vekt:(int)v effekt:(int)e co2:(int)c nox:(int)n registreringsdato:(NSDate *)r {
    self = [super init];
    if (self) {
        self.bil = b;
        self.vekt = v;
        self.effekt = e;
        self.co2 = c;
        self.nox = n;
        self.registreringsdato = r;
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:bil forKey:@"bil"];
    [encoder encodeInt:vekt forKey:@"vekt"];
    [encoder encodeInt:effekt forKey:@"effekt"];
    [encoder encodeInt:co2 forKey:@"co2"];
    [encoder encodeInt:nox forKey:@"nox"];
    [encoder encodeObject:registreringsdato forKey:@"registreringsdato"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    NSString* b = [decoder decodeObjectForKey:@"bil"];
    int v = [decoder decodeIntForKey:@"vekt"];
    int e = [decoder decodeIntForKey:@"effekt"];
    int c = [decoder decodeIntForKey:@"co2"];
    int n = [decoder decodeIntForKey:@"nox"];
    NSDate* r = [decoder decodeObjectForKey:@"registreringsdato"];
    
    return [self initWithBil:b vekt:v effekt:e co2:c nox:n registreringsdato:r];
}

@end
