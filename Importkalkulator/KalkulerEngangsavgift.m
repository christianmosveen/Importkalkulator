#import "KalkulerEngangsavgift.h"

@implementation KalkulerEngangsavgift

double const VEKTTRINN1 = 1150;
double const VEKTTRINN2 = 1400;
double const VEKTTRINN3 = 1500;
double const EFFEKTTRINN1 = 65;
double const EFFEKTTRINN2 = 90;
double const EFFEKTTRINN3 = 130;
double const CO2TRINN1 = 50;
double const CO2TRINN2 = 110;
double const CO2TRINN3 = 130;
double const CO2TRINN4 = 170;
double const CO2TRINN5 = 240;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

// PRIVATE
- (double)vektTrinn1:(int)vekt
{
    return vekt * 36.89;
}

- (double)vektTrinn2:(int)vekt
{
    return [self vektTrinn1:VEKTTRINN1] + (vekt - VEKTTRINN1) * 80.41;
}

- (double)vektTrinn3:(int)vekt
{
    return [self vektTrinn2:VEKTTRINN2] + (vekt - VEKTTRINN2) * 160.84;
}

- (double)vektTrinn4:(int)vekt
{
    return [self vektTrinn3:VEKTTRINN3] + (vekt - VEKTTRINN3) * 187.06;
}

- (int)effektTrinn2:(int)effekt
{
    return (effekt - EFFEKTTRINN1) * 315;
}

- (int)effektTrinn3:(int)effekt
{
    return [self effektTrinn2:EFFEKTTRINN2] + (effekt - EFFEKTTRINN2) * 895;
}

- (int)effektTrinn4:(int)effekt
{
    return [self effektTrinn3:EFFEKTTRINN3] + (effekt - EFFEKTTRINN3) * 2200;
}

- (int)co2trinn2:(int)co2
{
    return (CO2TRINN2 - co2) * -750;
}

- (int)co2trinn1:(int)co2
{
    return (CO2TRINN1 - co2) * -850 + [self co2trinn2:CO2TRINN1];
}

- (int)co2trinn3:(int)co2
{
    return (co2 - CO2TRINN2) * 750;
}

- (int)co2trinn4:(int)co2
{
    return [self co2trinn3:CO2TRINN3] + (co2 - CO2TRINN3) * 756;
}

- (int)co2trinn5:(int)co2
{
    return [self co2trinn4:CO2TRINN4] + (co2 - CO2TRINN4) * 1763;
}

- (int)co2trinn6:(int)co2
{
    return [self co2trinn5:CO2TRINN5] + (co2 - CO2TRINN5) * 2829;
}


// PUBLIC
- (double)avgiftMedVekt:(int)vekt effekt:(int)effekt nox:(int)nox co2:(int)co2
{
    return [self vekt:vekt] + [self effekt:effekt] + [self nox:nox] + [self co2:co2];
}

- (double)vekt:(int)vekt
{
    if (vekt <= VEKTTRINN1) {
        return [self vektTrinn1:vekt];
    } else if (vekt > VEKTTRINN1 && vekt <= VEKTTRINN2) {
        return [self vektTrinn2:vekt];
    } else if (vekt > VEKTTRINN2 && vekt <= VEKTTRINN3) {
        return [self vektTrinn3:vekt];
    } else {
        return [self vektTrinn4:vekt];
    }
}

- (int)effekt:(int)effekt
{
    if (effekt <= EFFEKTTRINN1) {
        return 0;
    } else if (effekt > EFFEKTTRINN1 && effekt <= EFFEKTTRINN2) {
        return [self effektTrinn2:effekt];
    } else if (effekt > EFFEKTTRINN2 && effekt <= EFFEKTTRINN3) {
        return [self effektTrinn3:effekt];
    } else {
        return [self effektTrinn4:effekt];
    }
}

- (int)nox:(int)nox
{
    return nox * 22;
}

- (int)co2:(int)co2
{
    if (co2 < CO2TRINN1) {
        return [self co2trinn1:co2];
    } else if (co2 >= CO2TRINN1 && co2 < CO2TRINN2) {
        return [self co2trinn2:co2];
    } else if (co2 == CO2TRINN2) {
        return 0;
    } else if (co2 > CO2TRINN2 && co2 <= CO2TRINN3) {
        return [self co2trinn3:co2];
    } else if (co2 > CO2TRINN3 && co2 <= CO2TRINN4) {
        return [self co2trinn4:co2];
    } else if (co2 > CO2TRINN4 && co2 <= CO2TRINN5) {
        return [self co2trinn5:co2];
    } else {
        return [self co2trinn6:co2];
    }
}

@end
