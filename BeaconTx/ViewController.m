//
//  ViewController.m
//  BeaconTx
//
//  Created by Saju Sathyan on 16/01/2018.
//  Copyright © 2018 Sensus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Create a NSUUID object
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"2EB654DB-3574-475E-ACB9-3C517ED4DE7F"];
    
    // Initialize the Beacon Region
    self.myBeaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID: uuid major: 1 minor: 1 identifier: @"dk.sensus.iball"]; // dk.sensus.BeaconTx
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonClicked:(UIButton *)sender {
    // Get the beacon data to advertise
    self.myBeaconData = [self.myBeaconRegion peripheralDataWithMeasuredPower: nil];
    
    // Start the peripheral manager
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate: self queue: nil options: nil];
}

-(void) peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    if(peripheral.state == CBManagerStatePoweredOn)
    {
        // Bluetooh is on
        
        // Update our status label
        self.statusLabel.text = @"Broadcasting ...";
        [self.peripheralManager startAdvertising: self.myBeaconData];
        
        NSLog(@"%@", self.myBeaconData);
    }
    else if (peripheral.state == CBManagerStatePoweredOff)
    {
        // Update our status label
        self.statusLabel.text = @"Stopped";
        
        // Bluetooth isn't on. Stop broadcasting
        [self.peripheralManager stopAdvertising];
    }
    else if(peripheral.state == CBManagerStateUnsupported)
    {
        self.statusLabel.text = @"Unsupported";
    }
    
}

@end
