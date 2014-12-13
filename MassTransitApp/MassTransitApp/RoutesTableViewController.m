//
//  RoutesTableViewController.m
//
//  Created by Matthew Elko on 11/29/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "RoutesTableViewController.h"
#import "MSDetailViewController.h"
#import "OCTADB.h"
#import "Metro.h"
#import "StopsTableViewController.h"


@implementation RoutesTableViewController


@synthesize routes = _routes;

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;
  
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //NSLog(@"tab bar: %ld", (long)self.tabBarItem.tag);
//    OCTADB* temp =[[OCTADB alloc] init];
//    NSLog(@"checking: %@", temp.name);
    
    
    
   //checks to see what tab you are on so it can grab the correct routes from the correct database
    if (self.tabBarController.selectedIndex == 0) {
        self.routes = [[OCTADB sharedGTDF]retrieveRoutes];
    }
    else
        self.routes = [[Metro sharedGTDF]retrieveRoutes];
    
    
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
  
    self.routes = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  //#warning Potentially incomplete method implementation.
  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  //#warning Incomplete method implementation.
  // Return the number of rows in the section.
  return [self.routes count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  //static NSString *CellIdentifier = @"Cell";
  static NSString *MyIdentifier = @"MyCellIdentifier";
  //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
  
  // Configure the cell...
  if (cell == nil) {
		// Use the default cell style.
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
  }
    Routes *newRoute = [self.routes objectAtIndex:indexPath.row];
  
    cell.textLabel.text = newRoute.routeName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Route Id:%@, Agency Id: %@, Route Type: %@", newRoute.routeId, newRoute.agencyId, newRoute.routeType];
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  //NSLog(@"Tap!");
  //[self performSegueWithIdentifier:@"detailsegue" sender:self];
  // Navigation logic may go here. Create and push another view controller.
  /*
   <#DetailViewController#>*detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
   // ...
   // Pass the selected object to the new view controller.
   [self.navigationController pushViewController:detailViewController animated:YES];
   */
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  //NSLog(@"prepareForSegue: %@", segue.identifier);

  if ([segue.identifier isEqualToString:@"StopsSegue"]){
    StopsTableViewController* stopsVC = segue.destinationViewController;
    NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
    stopsVC.selectedRoute = [self.routes objectAtIndex:selectedRowIndex.row];
  }
}


@end
