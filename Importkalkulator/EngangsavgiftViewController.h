#import <UIKit/UIKit.h>

@interface EngangsavgiftViewController : UIViewController

@property (nonatomic) IBOutlet UITextField *navn;
@property ( nonatomic) IBOutlet UILabel *vekt;
@property ( nonatomic) IBOutlet UILabel *effekt;
@property ( nonatomic) IBOutlet UILabel *co2;
@property ( nonatomic) IBOutlet UILabel *nox;

- (IBAction)vektEndret:(id)sender;

@end
