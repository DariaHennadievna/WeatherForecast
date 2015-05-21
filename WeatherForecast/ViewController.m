//
//  ViewController.m
//  WeatherForecast
//
//  Created by Admin on 13.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "ViewController.h"

//http://api.openweathermap.org/data/2.5/forecast/daily?units=metric&lang=en&q=Minsk&cnt=3&APPID=cea4a70a4bf1d91f0c4e71191e145657

@interface ViewController ()

@property (nonatomic) NSDictionary *response;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    CLAuthorizationStatus authorizationStatus= [CLLocationManager authorizationStatus];
    //[self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestAlwaysAuthorization];
    
    // authorizationStatus = kCLAuthorizationStatusNotDetermined...
    if (authorizationStatus == kCLAuthorizationStatusAuthorizedAlways ||
        authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.locationManager startUpdatingLocation];
    }
    
    //[self.locationManager startUpdatingLocation];
    
   
    
    
    
    
   /* AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"units": @"metric", @"lang":@"en", @"q":@"Minsk", @"cnt":@"3",
                                 @"APPID":@"cea4a70a4bf1d91f0c4e71191e145657"};
    
    [manager GET:@"http://api.openweathermap.org/data/2.5/forecast/daily?" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSLog(@"JSON: %@", responseObject);
        self.response = responseObject;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];*/
    
    
    /*NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/forecast/daily?units=metric&lang=en&q=Minsk&cnt=3&APPID=cea4a70a4bf1d91f0c4e71191e145657" ];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    [dataTask resume];*/
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"I'm here!!!");
    CLLocation *location = [locations lastObject];
    NSLog(@"location: lat = %f, lon = %f", location.coordinate.latitude, location.coordinate.longitude);
    
}


@end
