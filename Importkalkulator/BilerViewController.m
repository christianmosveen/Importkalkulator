#import "BilerViewController.h"
#import "BilStore.h"
#import "Bil.h"

@implementation BilerViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[[BilStore instance] populer];
    
    UIBarButtonItem *leggTilButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(leggTilBil)];
    self.navigationItem.rightBarButtonItem = leggTilButton;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BilStore instance] biler] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Bil* bil = [[[BilStore instance] biler] objectAtIndex:indexPath.row];
    cell.textLabel.text = bil.navn;
        
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EngangsavgiftViewController *engangsavgiftViewController = [[EngangsavgiftViewController alloc] init];
    Bil* bil = [[[BilStore instance] biler] objectAtIndex:indexPath.row];
    engangsavgiftViewController.title = bil.navn;
    engangsavgiftViewController.bil = bil;
    
    [self.navigationController pushViewController:engangsavgiftViewController animated:YES];
    
}

- (void)leggTilBil
{
    EngangsavgiftViewController *engangsavgiftViewController = [[EngangsavgiftViewController alloc] init];
    engangsavgiftViewController.title = @"Engangsavgift";
    
    [self.navigationController pushViewController:engangsavgiftViewController animated:YES];
}

@end
