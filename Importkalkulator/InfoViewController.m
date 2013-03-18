#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

@synthesize navnTextField;
@synthesize navn;
@synthesize registreringsdatoPicker;
@synthesize registreringsdato;
@synthesize version;

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
    version.text = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
}

- (void)viewDidUnload
{
    [self setRegistreringsdatoPicker:nil];
    [self setNavnTextField:nil];
    [self setVersion:nil];
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
