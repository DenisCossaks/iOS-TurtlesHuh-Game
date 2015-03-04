//
//  MKStoreObserver.m
//
//  Created by Mugunth Kumar on 17-Oct-09.
//  Copyright 2009 Mugunth Kumar. All rights reserved.
//

#import "MKStoreObserver.h"
#import "MKStoreManager.h"

@implementation MKStoreObserver

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
	for (SKPaymentTransaction *transaction in transactions)
	{
		switch (transaction.transactionState)
		{
			case SKPaymentTransactionStatePurchased:
				printf("SKPaymentTransactionStatePurchased\n");
				[[MKStoreManager sharedManager] endLoad];
                [self completeTransaction:transaction];
				
                break;
				
            case SKPaymentTransactionStateFailed:
				printf("SKPaymentTransactionStateFailed\n");
				[[MKStoreManager sharedManager] endLoad];
                [self failedTransaction:transaction];
				
                break;
				
            case SKPaymentTransactionStateRestored:
				printf("SKPaymentTransactionStateRestored\n");
				[[MKStoreManager sharedManager] endLoad];
                [self restoreTransaction:transaction];
				
            default:
				printf("default\n");
				
                break;
		}			
	}
}

- (void) failedTransaction: (SKPaymentTransaction *)transaction
{	printf("failedTransaction\n");
	//NSLog([transaction.error localizedDescription]);
	//NSLog([transaction.error code]);
    if (transaction.error.code != SKErrorPaymentCancelled)		
    {		
        // Optionally, display an error here.
        [[MKStoreManager sharedManager] failedTransaction:transaction];
    }
    
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];	
}

- (void) completeTransaction: (SKPaymentTransaction *)transaction
{		
	printf("completeTransaction\n");
    [[MKStoreManager sharedManager] provideContent: transaction.payment.productIdentifier shouldSerialize:YES];	
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];	
}

- (void) restoreTransaction: (SKPaymentTransaction *)transaction
{	
	printf("restoreTransaction\n");
    [[MKStoreManager sharedManager] provideContent: transaction.originalTransaction.payment.productIdentifier shouldSerialize:YES];	
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];	
}

@end
