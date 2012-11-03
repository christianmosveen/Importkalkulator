#import <Foundation/Foundation.h>

@class Bil;

@interface BilStore : NSObject
{
    NSMutableArray *biler;
}

+ (BilStore *)instance;

- (NSArray *)biler;
- (Bil *)opprettBil;

- (NSString *)arkivLokasjon;
- (BOOL)lagre;

- (void)populer;

@end
