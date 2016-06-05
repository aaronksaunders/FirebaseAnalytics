/********* FirebaseAnalytics.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "Firebase.h"



@interface FirebaseAnalytics : CDVPlugin {
  // Member variables go here.
}

- (void)initialize:(CDVInvokedUrlCommand*)command;
- (void)setUserProperty:(CDVInvokedUrlCommand*)command;
- (void)logEventWithName:(CDVInvokedUrlCommand*)command;

@end

@implementation FirebaseAnalytics


- (void)initialize:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        [FIRApp configure];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Initialized"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];    
    }
}
      
- (void)setUserProperty:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* key = [command.arguments objectAtIndex:0];
    NSString* value = [command.arguments objectAtIndex:1];
    
    
   [FIRAnalytics setUserPropertyString:value forName:key];

   pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)logEventWithName:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* eventName = [command.arguments objectAtIndex:0];
    NSString* type = [command.arguments objectAtIndex:1];
    NSString* itemId = [command.arguments objectAtIndex:2];
    
    [FIRAnalytics logEventWithName:eventName parameters:@{
                                                             kFIRParameterContentType:type,
                                                             kFIRParameterItemID:itemId
                                                             }];
   pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
@end
