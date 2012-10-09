#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController
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
    registreringsdatoPicker.date = registreringsdato;
}

- (void)viewDidUnload
{
    [self setRegistreringsdatoPicker:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)done:(id)sender
{
    [self.delegate infoViewControllerDidFinish:self];
}

- (IBAction)datoEndret:(id)sender {
    [self.delegate regDatoEndret:registreringsdatoPicker.date];
}

@end
