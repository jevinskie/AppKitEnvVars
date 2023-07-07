//
//  ViewController.h
//  AppKitEnvVars
//
//  Created by Jevin Sweval on 2023-07-07.
//
#pragma once
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface JEVEnvVarsDataSource : NSObject <NSTableViewDataSource, NSTableViewDelegate>
@property (atomic, strong, readonly) NSArray<NSString *> *vars;
@property (atomic, strong, readonly) NSArray<NSString *> *values;
@end

@interface ViewController : NSViewController
@property (atomic, strong, readonly) JEVEnvVarsDataSource *dataSource;
@property (weak) IBOutlet NSTableView *tableView;
@end

NS_ASSUME_NONNULL_END
