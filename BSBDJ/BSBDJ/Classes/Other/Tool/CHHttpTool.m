//
//  CHHttpTool.m
//

#import "CHHttpTool.h"

@implementation CHHttpTool

+ (void)get_AFN:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    //设置响应的数据格式(默认JSON)
//    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //响应体支持的类型
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    //2.发送Get请求
    [mgr GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)post_AFN:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    //设置响应的数据格式(默认JSON)
//    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //设置请求的数据格式(默认二进制)
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //响应体支持的类型
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
   //2.发送POST请求
   [mgr POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
       if (success) {
           success(responseObject);
       }
       
   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
       if (failure) {
           failure(error);
       }
   }];

}
@end