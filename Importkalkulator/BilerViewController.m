#import "BilerViewController.h"

@implementation BilerViewController

@synthesize biler;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
    [super viewDidLoad];
    
    Avgift *bil1 = [[Avgift alloc] initWithBil:@"2010 Golf TDI" vekt:1300 effekt:77 co2:119 nox:60 registreringsdato:[NSDate date]];
    Avgift *bil2 = [[Avgift alloc] initWithBil:@"2009 Audi A4 Quattro" vekt:1500 effekt:100 co2:130 nox:74 registreringsdato:[NSDate date]];
    Avgift *bil3 = [[Avgift alloc] initWithBil:@"2010 Touran 2,0 TDI" vekt:1600 effekt:110 co2:129 nox:68 registreringsdato:[NSDate date]];
    
    biler = [[NSMutableArray alloc] initWithObjects:bil1, bil2, bil3, nil];
    
    UIBarButtonItem *leggTilButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(leggTilBil)];
    self.navigationItem.rightBarButtonItem = leggTilButton;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [biler count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Avgift* avgift = [biler objectAtIndex:indexPath.row];
    cell.textLabel.text = avgift.bil;
        
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EngangsavgiftViewController *engangsavgiftViewController = [[EngangsavgiftViewController alloc] init];
    Avgift* avgift = [biler objectAtIndex:indexPath.row];
    engangsavgiftViewController.title = avgift.bil;
    engangsavgiftViewController.vekt = avgift.vekt;
    engangsavgiftViewController.effekt = avgift.effekt;
    engangsavgiftViewController.co2 = avgift.co2;
    engangsavgiftViewController.nox = avgift.nox;
    engangsavgiftViewController.registreringsdato = avgift.registreringsdato;
    
    [self.navigationController pushViewController:engangsavgiftViewController animated:YES];
    
}

- (void)leggTilBil
{
    EngangsavgiftViewController *engangsavgiftViewController = [[EngangsavgiftViewController alloc] init];
    engangsavgiftViewController.title = @"Engangsavgift";
    
    [self.navigationController pushViewController:engangsavgiftViewController animated:YES];
    
}


@end
