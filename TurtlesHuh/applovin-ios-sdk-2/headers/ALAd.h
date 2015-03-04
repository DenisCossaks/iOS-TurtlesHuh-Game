//
//  AppLovinAd.h
//  sdk
//
//  Created by Basil on 2/27/12.
//  Copyright (c) 2013, AppLovin Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALAdSize.h"
#import "ALAdType.h"

/**
 * This class represents an ad that has been served from AppLovin server and
 * should be displayed to the user.
 *
 * @author Basil Shikin
 * @version 1.0
 */
@interface ALAd : NSObject

@property (strong, nonatomic) ALAdSize * size;
@property (strong, nonatomic) ALAdType * adType;
@property (strong, nonatomic) NSString * videoUrl;
@property (strong, nonatomic) NSString * html;
@property (strong, nonatomic) NSArray  * destinationUrls;

// Only used for legacy compatibility.
@property (strong, nonatomic) NSString* clickTrackerUrl DEPRECATED_ATTRIBUTE;

@end
