//
//  DatabaseManager.m
//  ring
//
//  Created by Steven on 13-4-4.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "DatabaseManager.h"
#import "sqlite3.h"
#import "Ext.h"

@interface DatabaseManager(){
    sqlite3 *database;
}

@end

static DatabaseManager * _sharedDatabaseManager = nil;

@implementation DatabaseManager

+(DatabaseManager *)sharedDatabaseManager{
    if (_sharedDatabaseManager) {
        return _sharedDatabaseManager;
    }
    else{
        _sharedDatabaseManager = [[DatabaseManager alloc] init];
        [_sharedDatabaseManager opendatabase];
    }
    
    return _sharedDatabaseManager;
}


-(BOOL)testDatabaseFile{
    
    NSString *eventsDir = [[NSBundle mainBundle] resourcePath];
    NSString *dataPath = [eventsDir stringByAppendingPathComponent:@"data.db"];
    
    NSString *docDataPath = [[NSString documentPath] stringByAppendingPathComponent:@"data.db"];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm isReadableFileAtPath:docDataPath]){
        NSLog(@"OK");
        return YES;
    }
    else{
        NSLog(@"not find");
        if ([fm isReadableFileAtPath:dataPath]) {
            NSLog(@"Copy file to doc");
            return [fm copyItemAtPath:dataPath toPath:docDataPath error:nil];
        }
        else{
            NSLog(@"No resource");
            return NO;
        }
    }
    
    return NO;
}
- (BOOL)opendatabase{
    NSString *docDataPath = [[NSString documentPath] stringByAppendingPathComponent:@"data.db"];
    if (sqlite3_open([docDataPath UTF8String] , &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSLog( @"打开数据库失败！");
        return NO;
    }
    else{
        NSLog(@"数据库打开成功");
        return YES;
    }
    return NO;
}
- (BOOL)closedatabase{
    sqlite3_close(database);
    return YES;
}
- (void)search{
    NSString *query = @"SELECT * FROM Region where CityName like '%北京%'";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        //依次读取数据库表格FIELDS中每行的内容，并显示在对应的TextField
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //获得数据
            int tag = sqlite3_column_int(statement, 0);
            char *rowData = (char *)sqlite3_column_text(statement, 1);
            //根据tag获得TextField
//  UITextField *textField = (UITextField *)[self.view viewWithTag:tag];
  //          //设置文本
    //        textField.text = [[NSString alloc] initWithUTF8String:rowData];
        }
        sqlite3_finalize(statement);
    }
}
@end
