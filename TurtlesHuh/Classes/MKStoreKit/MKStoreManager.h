//
//  StoreManager.h
//  MKSync
//
//  Created by Mugunth Kumar on 17-Oct-09.
//  Copyright 2009 MK Inc. All rights reserved.
//  mugunthkumar.com

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "MKStoreObserver.h"

@protocol MKStoreKitDelegate <NSObject>
@optional
- (void)productPurchased:(NSString *)productId;
@end

@interface MKStoreManager : NSObject<SKProductsRequestDelegate> {

	NSMutableArray *purchasableObjects;
	MKStoreObserver *storeObserver;	
	
}

@property (nonatomic, retain) NSMutableArray *purchasableObjects;
@property (nonatomic, retain) MKStoreObserver *storeObserver;

- (void) requestProductData;

- (BOOL) canCurrentDeviceUseFeature: (NSString*) featureID;

-(void) buFeatureCoin01;
-(void) buFeatureCoin02;
-(void) buFeatureCoin03;
-(void) buFeatureCoin04;
-(void) buFeatureCoin05;
-(void) buFeatureCoin06;
-(void) buFeatureFreeons;


// do not call this directly. This is like a private method
- (void) buyFeature:(NSString*) featureId;

- (void) failedTransaction: (SKPaymentTransaction *)transaction;
-(void) provideContent: (NSString*) productIdentifier shouldSerialize: (BOOL) serialize;

+ (MKStoreManager*)sharedManager;

/*+ (BOOL) feature_Coin01;
+ (BOOL) feature_Coin02;
+ (BOOL) feature_Coin03;
+ (BOOL) feature_Coin04;
+ (BOOL) feature_Coin05;
+ (BOOL) feature_Coin06;
+ (BOOL) feature_Freeons;*/

+(NSString*) featureCoin01;
+(NSString*) featureCoin02;
+(NSString*) featureCoin03;
+(NSString*) featureCoin04;
+(NSString*) featureCoin05;
+(NSString*) featureCoin06;
+(NSString*) featureFreeons;

//DELEGATES
+(id)delegate;	
+(void)setDelegate:(id)newDelegate;

-(void) endLoad;

@end
