//
//  SFFoundationKitMacro.h
//  SFFoundationKit
//
//  Created by CONAN on 2021/4/25.
//

#ifndef SFFoundationKitMacro_h
#define SFFoundationKitMacro_h

#ifndef sf_weakify
    #define sf_weakify(object)  __weak __typeof__(object) weak##_##object = object;
#endif

#ifndef sf_strongify
    #define sf_strongify(object)  __typeof__(object) object = weak##_##object;
#endif


typedef void (^SFSuccessHandler)(void);
typedef void (^SFSuccessDict)(NSDictionary *dict);
typedef void (^SFSuccessString)(NSString *result);
typedef void (^SFSuccessList)(NSArray *list);
typedef void (^SFSuccessBOOL)(BOOL result);
typedef void (^SFSuccessID)(id result);
typedef void (^SFSuccessInt)(int result);
typedef void (^SFSuccessLongLong)(long long result);
typedef void (^SFSuccessData)(NSData *data);

typedef void (^SFFailureHandler)(void);
typedef void (^SFFailureError)(NSError *error);
typedef void (^SFFailureDescError)(NSString *errDesc);


#endif /* SFFoundationKitMacro_h */
