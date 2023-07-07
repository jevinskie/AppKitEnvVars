//
//  ViewController.m
//  AppKitEnvVars
//
//  Created by Jevin Sweval on 2023-07-07.
//

#import "ViewController.h"

@implementation JEVEnvVarsDataSource

- (instancetype)init {
    if (self = [super init]) {
        NSDictionary<NSString *,NSString *> *envVars = NSProcessInfo.processInfo.environment;
        self->_vars = [envVars.allKeys sortedArrayUsingSelector:@selector(compare:)];
        NSMutableArray<NSString *> *vals = [NSMutableArray arrayWithCapacity:self.vars.count];
        for (NSString *key in self.vars) {
            [vals addObject:envVars[key]];
        }
        self->_values = [NSArray arrayWithArray:vals];
    }
    return self;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.vars.count;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *name = tableColumn.identifier;
    NSTableCellView *cell = [tableView makeViewWithIdentifier:name owner:self];
    if ([name isEqual:@"var"]) {
        cell.textField.stringValue = self.vars[row];
    } else if ([name isEqual:@"value"]) {
        cell.textField.stringValue = self.values[row];
    } else {
        [NSException raise:NSInvalidArgumentException format:@"Asked for unknown tableColumn identifier %@", name];
    }
    return cell;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self->_dataSource = [[JEVEnvVarsDataSource alloc] init];
    self.tableView.dataSource = self.dataSource;
}

- (void)viewDidAppear {
    [self.tableView reloadData];
}

- (void)viewDidLayout {
    [self.tableView reloadData];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

@end
