#import <UIKit/UIKit.h>
#import "KalkulerEngangsavgift.h"
#import "InfoViewController.h"
#import "Bil.h"

@interface EngangsavgiftViewController : UIViewController <InfoViewControllerDelegate>

@property (nonatomic, retain) KalkulerEngangsavgift *kalkuler;

@property Bil *bil;
@property float avgift;

@property (nonatomic) IBOutlet UISlider *vektSlider;
@property (nonatomic) IBOutlet UISlider *effektSlider;
@property (nonatomic) IBOutlet UISlider *co2Slider;
@property (nonatomic) IBOutlet UISlider *noxSlider;

@property (nonatomic) IBOutlet UILabel *vektLabel;
@property (nonatomic) IBOutlet UILabel *effektLabel;
@property (nonatomic) IBOutlet UILabel *co2Label;
@property (nonatomic) IBOutlet UILabel *noxLabel;
@property (nonatomic) IBOutlet UILabel *avgiftLabel;

- (void)kalkulerAvgift;

- (IBAction)vektEndret:(id)sender;
- (IBAction)effektEndret:(id)sender;
- (IBAction)co2Endret:(id)sender;
- (IBAction)noxEndret:(id)sender;
- (void)regDatoEndret:(NSDate *)dato;

- (IBAction)visInfo:(id)sender;


@end
