#import <Foundation/Foundation.h>

@class Bil;

@interface BilStore : NSObject
{
    NSMutableArray *biler;
}

+ (BilStore *)instance;

- (NSMutableArray *)biler;
- (Bil *)opprettBil;

- (NSString *)arkivLokasjon;
- (BOOL)lagre;

@end
