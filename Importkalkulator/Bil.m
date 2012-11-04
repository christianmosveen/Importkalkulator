#import "Bil.h"

@implementation Bil

@synthesize navn;
@synthesize vekt;
@synthesize effekt;
@synthesize co2;
@synthesize nox;
@synthesize registreringsdato;

- (id)init {
    self = [super init];
    if (self) {
        self.vekt = 1000;
        self.effekt = 65;
        self.co2 = 60;
        self.nox = 60;
        self.registreringsdato = [NSDate date];
    }
    
    return self;
}

- (id)initWithNavn:(NSString *)n vekt:(int)v effekt:(int)e co2:(int)c nox:(int)nx registreringsdato:(NSDate *)r {
    self = [super init];
    if (self) {
        self.navn = n;
        self.vekt = v;
        self.effekt = e;
        self.co2 = c;
        self.nox = nx;
        self.registreringsdato = r;
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:navn forKey:@"navn"];
    [encoder encodeInt:vekt forKey:@"vekt"];
    [encoder encodeInt:effekt forKey:@"effekt"];
    [encoder encodeInt:co2 forKey:@"co2"];
    [encoder encodeInt:nox forKey:@"nox"];
    [encoder encodeObject:registreringsdato forKey:@"registreringsdato"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    NSString* n = [decoder decodeObjectForKey:@"navn"];
    int v = [decoder decodeIntForKey:@"vekt"];
    int e = [decoder decodeIntForKey:@"effekt"];
    int c = [decoder decodeIntForKey:@"co2"];
    int nx = [decoder decodeIntForKey:@"nox"];
    NSDate* r = [decoder decodeObjectForKey:@"registreringsdato"];
    
    return [self initWithNavn:n vekt:v effekt:e co2:c nox:nx registreringsdato:r];
}

@end
