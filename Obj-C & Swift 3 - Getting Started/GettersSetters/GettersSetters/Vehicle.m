//
//  Vehicle.m
//  GettersSetters
//
//  Created by Jeffrey Eng on 4/19/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

-(void)setOdometer:(long)odometer {
    // if incoming value is greater than the existing value
    if (odometer > _odometer) {
        _odometer = odometer;
    }
}

-(NSString*)model {
    if ([_model isEqualToString:@"Honda Civic"]) {
        return @"POS";
    } else {
        return _model;
    }
}

@end
