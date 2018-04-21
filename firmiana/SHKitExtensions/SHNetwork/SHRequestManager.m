//
//  SHRequestManager.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHRequestManager.h"

@implementation SHRequestManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configSettings];
    }
    return self;
}

static SHRequestManager *_instance = nil;

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [self manager];
        [_instance configSettings];
    });
    return _instance;
}


#pragma mark - 初始化设置
- (void)configSettings
{
    DDLogInfo(@"network init");
    
    /************ * HTTPS * **************/
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = NO;
    self.securityPolicy = securityPolicy;
    
    //申明请求的数据是json类型
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    /************ * HTTPS * **************/
    self.requestSerializer.timeoutInterval = 10;
    
    //设置可接收的数据类型
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", @"text/plain", nil];;
    
    
    //记录网络状态
    [self.reachabilityManager startMonitoring];
    //自定义处理数据
    self.responseFormat = ^SHBaseResponse *(SHBaseResponse *response) {
        return response;
    };
}

- (void)setCerFilePath:(NSString *)cerFilePath {
    _cerFilePath = cerFilePath;
    if (SHIsEmpty(cerFilePath)) {
        return;
    }
    
    // 先导入证书 证书由服务端生成，具体由服务端人员操作
    //    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"xxx" ofType:@"cer"];//证书的路径
    NSData *cerData = [NSData dataWithContentsOfFile:cerFilePath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES;
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    
    securityPolicy.pinnedCertificates = [[NSSet alloc] initWithObjects:cerData, nil];
    
    //    2.加上这个函数，https ssl 验证。
    [self setSecurityPolicy:securityPolicy];
}

#pragma mark - 处理返回序列化
- (void)setResponseSerializer:(AFHTTPResponseSerializer<AFURLResponseSerialization> *)responseSerializer
{
    [super setResponseSerializer:responseSerializer];
    
    if ([responseSerializer isKindOfClass:[AFJSONResponseSerializer class]]) {
        AFJSONResponseSerializer *JSONserializer = (AFJSONResponseSerializer *)responseSerializer;
        JSONserializer.removesKeysWithNullValues = YES;
        /*
         NSJSONReadingMutableContainers = 转换出来的对象是可变数组或者可变字典
         NSJSONReadingMutableLeaves = 转换呼出来的OC对象中的字符串是可变的\注意：iOS7之后无效 bug
         NSJSONReadingAllowFragments = 如果服务器返回的JSON数据，不是标准的JSON，那么就必须使用这个值，否则无法解析
         */
        JSONserializer.readingOptions = NSJSONReadingMutableContainers;
    }
}


#pragma mark - POST_GET
// post
- (void)POST:(NSString *)urlString parameters:(id)parameters completion:(void (^)(SHBaseResponse *))completion
{
    [self request:SHRequestMethodPOST URL:urlString parameters:parameters completion:completion];
}

#pragma mark - POST_GET
// put
- (void)PUT:(NSString *)urlString parameters:(id)parameters completion:(void (^)(SHBaseResponse *))completion
{
    [self request:SHRequestMethodPUT URL:urlString parameters:parameters completion:completion];
}

//get
- (void)GET:(NSString *)urlString parameters:(id)parameters completion:(void (^)(SHBaseResponse *))completion
{
    [self request:SHRequestMethodGET URL:urlString parameters:parameters completion:completion];
}

//delete
- (void)DELETE:(NSString *)urlString parameters:(id)parameters completion:(void (^)(SHBaseResponse *))completion
{
    [self request:SHRequestMethodDELETE URL:urlString parameters:parameters completion:completion];
}

#pragma mark - post & get
- (void)request:(SHRequestMethod) method URL:(NSString *)urlString parameters:(id)parameters completion:(void (^)(SHBaseResponse *response))completion
{
    if (self.isLocal) {
        [self requestLocal:urlString completion:completion];
        return;
    }
    
    if (self.reachabilityManager.networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
        SHBaseResponse *response = [SHBaseResponse new];
        response.error = [NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:nil];
        response.errorMsg = LOCSTR(@"Network is not available");
        completion(response);
        return;
    }
    
    
    void(^success)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self wrapperTask:task responseObject:responseObject error:nil completion:completion];
    };
    
    void(^failure)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self wrapperTask:task responseObject:nil error:error completion:completion];
    };
    
    DDLogInfo(@"request url: %@\n payload: %@", urlString, parameters);
    
    if (method == SHRequestMethodGET) {
        [self GET:urlString parameters:parameters progress:nil success:success failure:failure];
    } else if (method == SHRequestMethodPOST) {
        [self POST:urlString parameters:parameters progress:nil success:success failure:failure];
    } else if (method == SHRequestMethodPUT) {
        [self PUT:urlString parameters:parameters success:success failure:failure];
    } else if (method == SHRequestMethodDELETE) {
        [self DELETE:urlString parameters:parameters success:success failure:failure];
    }    
}


#pragma mark - 加载本地数据
static NSString *jsonFileDirectory = @"SHLocalJsons";
- (void)requestLocal:(NSString *)urlString completion:(void (^)(SHBaseResponse *response))completion
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSError *fileError = nil;
        NSError *jsonError = nil;
        
        NSString *jsonFile = [NSString stringWithFormat:@"%@/%@", jsonFileDirectory, [urlString lastPathComponent]];
        NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:jsonFile ofType:@"json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath options:0 error:&fileError];
        
        if (fileError) {
            [self wrapperTask:nil responseObject:nil error:fileError completion:completion];
            
        }else {
            id responseObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&jsonError];
            
            [self wrapperTask:nil responseObject:responseObj error:jsonError completion:completion];
        }
    });
}


#pragma mark - 处理数据
- (void)wrapperTask:(NSURLSessionDataTask *)task responseObject:(id)responseObject error:(NSError *)error completion:(void (^)(SHBaseResponse *response))completion
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        SHBaseResponse *response = [self convertTask:task responseObject:responseObject error:error];
        [self LogResponse:task.currentRequest.URL.absoluteString response:response];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            !completion ?: completion(response);
        });
    });
}



#pragma mark - 包装返回的数据
- (SHBaseResponse *)convertTask:(NSURLSessionDataTask *)task responseObject:(id)responseObject error:(NSError *)error
{
    
    SHBaseResponse *response = [SHBaseResponse new];
    
    if (!SHIsEmpty(responseObject)) {
        response.responseObject = responseObject;
    }
    if (error) {
        response.error = error;
    }
    
    if ([task.response isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *HTTPURLResponse = (NSHTTPURLResponse *)task.response;
        response.headers = HTTPURLResponse.allHeaderFields.mutableCopy;
    }
    
    if (self.responseFormat) {
        response = self.responseFormat(response);
    }
    
    return response;
}




#pragma mark - 打印返回日志
- (void)LogResponse:(NSString *)urlString response:(SHBaseResponse *)response
{
    DDLogInfo(@"\n[%@]---%@\n", urlString, response);
}



#pragma mark - 上传文件
//  data 图片对应的二进制数据
//  name 服务端需要参数
//  fileName 图片对应名字,一般服务不会使用,因为服务端会直接根据你上传的图片随机产生一个唯一的图片名字
//  mimeType 资源类型
//  不确定参数类型 可以这个 octet-stream 类型, 二进制流
- (void)upload:(NSString *)urlString parameters:(id)parameters formDataBlock:(NSDictionary<NSData *, SHDataName *> *(^)(id<AFMultipartFormData> formData, NSMutableDictionary<NSData *, SHDataName *> *needFillDataDict))formDataBlock progress:(void (^)(NSProgress *progress))progress completion:(void (^)(SHBaseResponse *response))completion
{
    static NSString *mineType = @"application/octet-stream";
    
    [self POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSMutableDictionary *needFillDataDict = [NSMutableDictionary dictionary];
        NSDictionary *datas = !formDataBlock ? nil : formDataBlock(formData, needFillDataDict);
        
        if (datas) {
            [datas enumerateKeysAndObjectsUsingBlock:^(NSData * _Nonnull data, SHDataName * _Nonnull name, BOOL * _Nonnull stop) {
                [formData appendPartWithFileData:data name:name fileName:@"random" mimeType:mineType];
            }];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            !progress ?: progress(uploadProgress);
        });
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self wrapperTask:task responseObject:responseObject error:nil completion:completion];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self wrapperTask:task responseObject:nil error:error completion:completion];
        
    }];
    
}

@end
