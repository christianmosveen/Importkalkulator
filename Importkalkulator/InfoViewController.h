#import <UIKit/UIKit.h>

@class InfoViewController;

@protocol InfoViewControllerDelegate <NSObject>
- (void)infoViewControllerDidFinish:(InfoViewController *)controller;
- (void)regDatoEndret:(NSDate *)dato;
@end

@interface InfoViewController : UIViewController

@property (weak, nonatomic) id <InfoViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;
- (IBAction)datoEndret:(id)sender;

@end