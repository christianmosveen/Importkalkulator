#import <UIKit/UIKit.h>

@class InfoViewController;

@protocol InfoViewControllerDelegate <NSObject>
- (void)infoViewControllerDidFinish:(InfoViewController *)controller;
- (void)regDatoEndret:(NSDate *)dato;
@end

@interface InfoViewController : UIViewController

@property (weak, nonatomic) id <InfoViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIDatePicker *registreringsdatoPicker;
@property (strong, nonatomic) IBOutlet UITextField *navnTextField;
@property NSDate *registreringsdato;
@property NSString *navn;
@property (strong, nonatomic) IBOutlet UILabel *version;

- (IBAction)done:(id)sender;
- (IBAction)datoEndret:(id)sender;

@end
