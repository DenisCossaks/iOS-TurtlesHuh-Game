//
//  MKStoreManager.m
//
//  Created by Mugunth Kumar on 15-Nov-09.
//  Copyright 2009 Mugunth Kumar. All rights reserved.
//  mugunthkumar.com
//

#import "MKStoreManager.h"
#import "Global.h"

@implementation MKStoreManager

@synthesize purchasableObjects;
@synthesize storeObserver;

// all your features should be managed one and only by StoreManager

static NSString *featureCoin01 = @"com.appbillionaire.rabbitandturtle.Coins01";
static NSString *featureCoin02 = @"com.appbillionaire.rabbitandturtle.Coins02";
static NSString *featureCoin03 = @"com.appbillionaire.rabbitandturtle.Coins03";
static NSString *featureCoin04 = @"com.appbillionaire.rabbitandturtle.Coins04";
static NSString *featureCoin05 = @"com.appbillionaire.rabbitandturtle.Coins05";
static NSString *featureCoin06 = @"com.appbillionaire.rabbitandturtle.Coins06";
static NSString *featureFreeons = @"com.appbillionaire.rabbitandturtle.Freeons";


static __weak id<MKStoreKitDelegate> _delegate;
static MKStoreManager* _sharedStoreManager; // self


/*-(void) testing{
	if([_delegate respondsToSelector:@selector(productPurchased:)]){
		printf("testing\n");
		[_delegate productPurchased:featureAId];
		[self provideContent:featureAId shouldSerialize:YES];
	}
}*/

- (void)dealloc {
	
	[_sharedStoreManager release];
	[storeObserver release];
	[super dealloc];
}

+ (id)delegate {
	
    return _delegate;
}

+ (void)setDelegate:(id)newDelegate {
	
    _delegate = newDelegate;	
}



+(NSString*) featureCoin01{
	return [NSString stringWithString:featureCoin01];
}

+(NSString*) featureCoin02{
	return [NSString stringWithString:featureCoin02];
}

+(NSString*) featureCoin03{
	return [NSString stringWithString:featureCoin03];
}

+(NSString*) featureCoin04{
	return [NSString stringWithString:featureCoin04];
}

+(NSString*) featureCoin05{
	return [NSString stringWithString:featureCoin05];
}

+(NSString*) featureCoin06{
	return [NSString stringWithString:featureCoin06];
}

+(NSString*) featureFreeons{
	return [NSString stringWithString:featureFreeons];
}


+ (MKStoreManager*)sharedManager
{
	@synchronized(self) {
		
        if (_sharedStoreManager == nil) {
			
            [[self alloc] init]; // assignment not done here
			_sharedStoreManager.purchasableObjects = [[NSMutableArray alloc] init];			
			[_sharedStoreManager requestProductData];
			
			
			_sharedStoreManager.storeObserver = [[MKStoreObserver alloc] init];
			[[SKPaymentQueue defaultQueue] addTransactionObserver:_sharedStoreManager.storeObserver];
        }
    }
    return _sharedStoreManager;
}


#pragma mark Singleton Methods

+ (id)allocWithZone:(NSZone *)zone

{	
    @synchronized(self) {
		
        if (_sharedStoreManager == nil) {
			
            _sharedStoreManager = [super allocWithZone:zone];			
            return _sharedStoreManager;  // assignment and return on first allocation
        }
    }
	
    return nil; //on subsequent allocation attempts return nil	
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;	
}

- (id)retain
{	
    return self;	
}

- (unsigned)retainCount
{
    return UINT_MAX;  //denotes an object that cannot be released
}

- (id)autorelease
{
    return self;	
}


- (void) requestProductData
{
	SKProductsRequest *request= [[SKProductsRequest alloc] initWithProductIdentifiers: 
								 [NSSet setWithObjects: featureCoin01, featureCoin02, featureCoin03, featureCoin04, featureCoin05, featureCoin06, nil]];
	request.delegate = self;
	[request start];
}


- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
	
	[purchasableObjects addObjectsFromArray:response.products];
	// populate UI
	for(int i=0;i<[purchasableObjects count];i++)
	{
		
		SKProduct *product = [purchasableObjects objectAtIndex:i];
		NSLog(@"Feature: %@, Cost: %f, ID: %@",[product localizedTitle],
			  [[product price] doubleValue], [product productIdentifier]);
	}
	
	[request autorelease];
}


- (void) buyFeature:(NSString*) featureId
{
	printf("buyFeature:::\n");
	
	if ([SKPaymentQueue canMakePayments])
	{
		printf("can make payments\n");
		//NSLog(featureId);
		SKPayment *payment = [SKPayment paymentWithProductIdentifier:featureId];
		[[SKPaymentQueue defaultQueue] addPayment:payment];
	}
	else
	{
		printf("can't not make payments \n");
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"MKStoreKit" message:@"You are not authorized to purchase from AppStore"
													   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];
		[alert release];
	}
}

- (void) buFeatureCoin01
{
	[self buyFeature:featureCoin01];
}

- (void) buFeatureCoin02
{
	[self buyFeature:featureCoin02];
}

- (void) buFeatureCoin03
{
	[self buyFeature:featureCoin03];
}

- (void) buFeatureCoin04
{
	[self buyFeature:featureCoin04];
}

- (void) buFeatureCoin05
{
	[self buyFeature:featureCoin05];
}

- (void) buFeatureCoin06
{
	[self buyFeature:featureCoin06];
}

- (void) buFeatureFreeons
{
	[self buyFeature:featureFreeons];
}




- (void) failedTransaction: (SKPaymentTransaction *)transaction
{
	NSString *messageToBeShown = [NSString stringWithFormat:@"Reason: %@, You can try: %@", [transaction.error localizedFailureReason], [transaction.error localizedRecoverySuggestion]];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unable to complete your purchase" message:messageToBeShown
												   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];
	[alert release];
}

-(void) provideContent: (NSString*) productIdentifier shouldSerialize: (BOOL) serialize
{
	printf("provide content\n");
	
	
	if(serialize){
		printf("B\n");
		if([_delegate respondsToSelector:@selector(productPurchased:)]){
			printf("C\n");
			[_delegate productPurchased:productIdentifier];
		}
		printf("D\n");		
	}
	
	return;
	
	/*NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	if([productIdentifier isEqualToString:featureAId])
	{
		printf("A\n");
		featureAPurchased = YES;
		if(serialize)
		{printf("B\n");
			if([_delegate respondsToSelector:@selector(productPurchased:)]){
				printf("C\n");
				[_delegate productPurchased:productIdentifier];
			}
				
			printf("D\n");
			[userDefaults setBool:featureAPurchased forKey:featureAId];		
		}
	}*/

}

-(void) endLoad{
	[_delegate endLoad];
}

@end
