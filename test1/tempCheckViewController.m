//
//  tempCheckViewController.m
//  test1
//
//  Created by Neal on 1/1/13.
//  Copyright (c) 2013 Neal. All rights reserved.
//

#import "tempCheckViewController.h"

@interface tempCheckViewController ()

@end

@implementation tempCheckViewController
@synthesize tempLabel;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButton:(id)sender {
    NSData *data = [NSData dataWithContentsOfURL:
          [NSURL URLWithString:@"http://nicktravis.com/beertemp/get.php?format=json&num=1"]
                    ];
    
    NSError *error;
    NSDictionary *json = NULL;
    
    if(data){
        json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        NSArray *result = [json objectForKey:@"posts"];
        
        
        
        //NSLog(@"result %@",result);
        
        tempLabel.text = [NSString stringWithFormat:@"Temp - %@ *F", json[@"posts"][0][@"reading"]];
        
    }//end if data from web ok
    
    else{//no data from web
        
        tempLabel.text=@"No Data From Web";
}
}
@end
