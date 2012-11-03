#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

@synthesize navnTextField;
@synthesize navn;
@synthesize registreringsdatoPicker;
@synthesize registreringsdato;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    navnTextField.text = navn;
    registreringsdatoPicker.date = registreringsdato;
}

- (void)viewDidUnload
{
    [self setRegistreringsdatoPicker:nil];
    [self setNavnTextField:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)done:(id)sender
{
    navn = navnTextField.text;
    [self.delegate infoViewControllerDidFinish:self];
}

- (IBAction)datoEndret:(id)sender {
    [self.delegate regDatoEndret:registreringsdatoPicker.date];
}

@end
