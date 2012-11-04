#import "EngangsavgiftViewController.h"

NSNumberFormatter *formatter;

@implementation EngangsavgiftViewController

@synthesize kalkuler;

@synthesize bil;

@synthesize avgift;
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
        
        formatter = [[NSNumberFormatter alloc] init];
        formatter.usesGroupingSeparator = YES;
        formatter.groupingSeparator = @" ";
        formatter.groupingSize = 3;
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.title = bil.navn;
    vektSlider.value = bil.vekt;
    effektSlider.value = bil.effekt;
    co2Slider.value = bil.co2;
    noxSlider.value = bil.nox;
    
    vektLabel.text = [[NSString alloc] initWithFormat:@"%d", bil.vekt];
    effektLabel.text = [[NSString alloc] initWithFormat:@"%d", bil.effekt];
    co2Label.text = [[NSString alloc] initWithFormat:@"%d", bil.co2];
    noxLabel.text = [[NSString alloc] initWithFormat:@"%d", bil.nox];
    
    [self kalkulerAvgift];
    
    [super viewDidLoad];
}

- (IBAction)vektEndret:(id)sender {
    bil.vekt = (int)(vektSlider.value+0.5f);
    vektLabel.text = [[NSString alloc] initWithFormat:@"%d", bil.vekt];
    [self kalkulerAvgift];
}

- (IBAction)effektEndret:(id)sender {
    bil.effekt = (int)(effektSlider.value+0.5f);
    effektLabel.text = [[NSString alloc] initWithFormat:@"%d", bil.effekt];
    [self kalkulerAvgift];
}

- (IBAction)co2Endret:(id)sender {
    bil.co2 = (int)(co2Slider.value+0.5f);
    co2Label.text = [[NSString alloc] initWithFormat:@"%d", bil.co2];
    [self kalkulerAvgift];
}

- (IBAction)noxEndret:(id)sender {
    bil.nox = (int)(noxSlider.value+0.5f);
    noxLabel.text = [[NSString alloc] initWithFormat:@"%d", bil.nox];
    [self kalkulerAvgift];
}

- (void)regDatoEndret:(NSDate *)dato {
    bil.registreringsdato = dato;
    [self kalkulerAvgift];
}

- (IBAction)visInfo:(id)sender {
    InfoViewController *infoViewController = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    infoViewController.delegate = self;
    infoViewController.registreringsdato = bil.registreringsdato;
    infoViewController.navn = bil.navn;
    infoViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:infoViewController animated:YES];
}

- (void)kalkulerAvgift {
    avgift = [kalkuler avgiftMedVekt:bil.vekt effekt:bil.effekt nox:bil.nox co2:bil.co2 registreringsdato:bil.registreringsdato];
    avgiftLabel.text = [[NSString alloc] initWithFormat:@"%@ kr", [formatter stringFromNumber:[NSNumber numberWithInt:(int)(avgift+0.5f)]]];
}

- (void)infoViewControllerDidFinish:(InfoViewController *)controller {
    bil.navn = controller.navn;
    self.title = bil.navn;
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
