//
//  ViewController.h
//  BeaconTx
//
//  Created by Saju Sathyan on 16/01/2018.
//  Copyright © 2018 Sensus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController : UIViewController<CBPeripheralManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) CLBeaconRegion *myBeaconRegion;
@property (strong, nonatomic) NSDictionary *myBeaconData;
@property(strong, nonatomic) CBPeripheralManager *peripheralManager;

- (IBAction)buttonClicked:(UIButton *)sender;

@end

