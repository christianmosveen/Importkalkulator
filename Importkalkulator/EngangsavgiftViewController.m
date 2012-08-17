#import "EngangsavgiftViewController.h"

@implementation EngangsavgiftViewController

@synthesize kalkuler;
@synthesize vekt;
@synthesize effekt;
@synthesize co2;
@synthesize nox;
@synthesize avgift;

@synthesize navn;
@synthesize avgiftLabel;

@synthesize vektSlider;
@synthesize effektSlider;
@synthesize co2Slider;
@synthesize noxSlider;

@synthesize vektLabel;
@synthesize effektLabel;
@synthesize co2Label;
@synthesize noxLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        kalkuler = [[KalkulerEngangsavgift alloc] init];
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    vekt = 1300;
    effekt = 77;
    co2 = 119;
    nox = 60;
    
    vektSlider.value = vekt;
    effektSlider.value = effekt;
    co2Slider.value = co2;
    noxSlider.value = nox;
    
    vektLabel.text = [[NSString alloc] initWithFormat:@"%d", vekt];
    effektLabel.text = [[NSString alloc] initWithFormat:@"%d", effekt];
    co2Label.text = [[NSString alloc] initWithFormat:@"%d", co2];
    noxLabel.text = [[NSString alloc] initWithFormat:@"%d", nox];
    
    [self kalkulerAvgift];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setVektLabel:nil];
    [self setEffektLabel:nil];
    [self setCo2Label:nil];
    [self setNoxLabel:nil];
    [self setAvgiftLabel:nil];
    [self setVektSlider:nil];
    [self setEffektSlider:nil];
    [self setCo2Slider:nil];
    [self setNoxSlider:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)vektEndret:(id)sender {
    vekt = (int)(vektSlider.value+0.5f);
    NSString *vektString = [[NSString alloc] initWithFormat:@"%d", vekt];
    vektLabel.text = vektString;
    [self kalkulerAvgift];
}

- (IBAction)effektEndret:(id)sender {
    effekt = (int)(effektSlider.value+0.5f);
    NSString *effektString = [[NSString alloc] initWithFormat:@"%d", effekt];
    effektLabel.text = effektString;
    [self kalkulerAvgift];
}

- (IBAction)co2Endret:(id)sender {
    co2 = (int)(co2Slider.value+0.5f);
    NSString *co2String = [[NSString alloc] initWithFormat:@"%d", co2];
    co2Label.text = co2String;
    [self kalkulerAvgift];
}

- (IBAction)noxEndret:(id)sender {
    nox = (int)(noxSlider.value+0.5f);
    NSString *noxString = [[NSString alloc] initWithFormat:@"%d", nox];
    noxLabel.text = noxString;
    [self kalkulerAvgift];
}

- (void)kalkulerAvgift {
    avgift = [kalkuler avgiftMedVekt:vekt effekt:effekt nox:nox co2:co2];
    NSString *avgiftString = [[NSString alloc] initWithFormat:@"%d", (int)(avgift+0.5f)];
    avgiftLabel.text = avgiftString;
}


@end
