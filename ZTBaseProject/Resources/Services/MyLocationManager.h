//
//  MyLocationManager.h
//  xuexuecan
//
//  Created by zhongli on 15/3/5.
//  Copyright (c) 2015年 ICan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

//@class MyLocationManager;
#pragma mark  定位
typedef void (^willStartLocatingBlock)(void);                    // 开始定位
typedef void (^didStopLocatingBlock)(void);                       //停止定位
#pragma mark  定位结果
typedef void (^didUpdateUserLocationBlock)(BMKUserLocation *userLocation);  // 定位成功
typedef void (^didFailToLocate)(NSError *error);                            //定位失败
#pragma mark  地理位置编码
typedef void (^ReverseGeoCodeYN)(BOOL YN);
typedef void(^ReverseGeoCodeResultBlock) (BMKReverseGeoCodeResult *result ,BMKSearchErrorCode error);                                           //地理编码结果
#pragma mark  位置检索
typedef void (^GeoCodeSearchYN)(BOOL YN);
typedef void(^GeoCodeSearchResultBlock) (BMKGeoCodeResult *result ,BMKSearchErrorCode error);                                                               //位置检索结果
#pragma mark  位置检索建议
typedef void (^GeoCodeSearchSuggestionYN)(BOOL YN);
typedef void(^GeoCodeSearchSuggestionResultBlock) (BMKSuggestionResult *result ,BMKSearchErrorCode error);
//位置检索结果
#pragma mark POI检索

typedef void (^PoiSearchYN)(BOOL YN);
typedef void(^PoiSearchResultBlock)(BMKPoiResult *result,BMKSearchErrorCode error);

@interface MyLocationManager : NSObject<BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate,BMKSuggestionSearchDelegate,BMKPoiSearchDelegate>
{
    willStartLocatingBlock                  _willStart;
    didStopLocatingBlock                    _didStop;
    didUpdateUserLocationBlock              _didUpdate;
    didFailToLocate                         _didFail;
    
    ReverseGeoCodeYN                        _rgcYN;
    ReverseGeoCodeResultBlock               _rgcResult;
    
    GeoCodeSearchYN                         _gcYN;
    GeoCodeSearchResultBlock                _gcResult;
    
    GeoCodeSearchSuggestionYN               _suggestionYN;
    GeoCodeSearchSuggestionResultBlock      _suggestionResult;
    
    PoiSearchYN                             _poiCityYN;
    PoiSearchResultBlock                    _poiCitySearchResult;
    
    
    
    BMKLocationService *_locService;//定位
    
    BMKGeoCodeSearch *_searcher;//地理编码检索
    
    BMKSuggestionSearch *_searcherSuggestion;//检索建议
//    poi 检索
    BMKPoiSearch        *_Poisearcher;
    
    CLLocationCoordinate2D _searchCllocation;
}
/**
 *  地址
 */
@property (nonatomic,copy) NSString *cityAddress;
/**
 *  城市名字
 */
@property (nonatomic,copy) NSString *cityName;
/**
 *  省份
 */
@property (nonatomic,copy) NSString *province;
/**
 *  区
 */
@property (nonatomic,copy) NSString *district;
/**
 *  经纬度
 */
@property (nonatomic,assign) CLLocationCoordinate2D location;

+ (id)sharedManager;
- (void)startLocation;                          //开始定位
- (void)stopLocation;                          //停止定位

- (NSString *)getProvince;                      //省份
- (NSString *)getDistrict;                      //区
- (NSString *)getCityName;                      // 城市名字
- (NSString *)getCityAddress;                   //街道地址
- (CLLocationCoordinate2D)getLocation;          // 经纬度

// 定位Block
/**
 *  定位
 *
 *  @param willStart 即将开始定位
 *  @param didUpdate 已经更新位置
 *  @param didFail   失败
 *  @param didStop   停止
 */
- (void)BMKLocationServiceWillStart:(willStartLocatingBlock)willStart didUpdateUserLocationBlock:(didUpdateUserLocationBlock)didUpdate
                    didFailToLocate:(didFailToLocate)didFail
               didStopLocatingBlock:(didStopLocatingBlock)didStop;
/**
 *  地理编码
 *
 *  @param cllocation 位置经纬度
 *  @param rgcYN      是否成功
 *  @param rgcResult  结果
 */
- (void)BMKGeoCodeSearchReverseGeoCodeOptionWith:(CLLocationCoordinate2D)cllocation   ReverseGeoCodeYN:(ReverseGeoCodeYN)rgcYN
                            ReverseGeoCodeResult:(ReverseGeoCodeResultBlock)rgcResult;
/**
 *  位置检索Block
 *
 *  @param city     所在城市
 *  @param address  地址
 *  @param gcYN     是否成功
 *  @param gcResult 结果
 */
- (void)BMKGeoCodeSearchGeoCodeSearchWithCity:(NSString *)city Address:(NSString *)address
                              GeoCodeSearchYN:(GeoCodeSearchYN)gcYN
                          GeoCodeSearchResult:(GeoCodeSearchResultBlock)gcResult;

/**
 *  位置检索建议Block
 *
 *  @param city             检索建议城市
 *  @param address          检索地址
 *  @param suggestionYN     是否检索成功
 *  @param suggestionResult 检索结果
 */
- (void)BMKGeoCodeSearchGeoCodeSearchSuggestionWithCity:(NSString *)city Address:(NSString *)address
                              GeoCodeSearchSuggestionYN:(GeoCodeSearchSuggestionYN)suggestionYN
                          GeoCodeSearchSuggestionResult:(GeoCodeSearchSuggestionResultBlock)suggestionResult;
/**
 *  POI本地检索
 *
 *  @param city            检索城市可以为空
 *  @param address         检索地址
 *  @param poiSearchYN     是否检索成功
 *  @param poiSearchResult 检索结果返回
 */
- (void)BMKPOISearchWithCity:(NSString *)city Address:(NSString *)address
   GeoCodeSearchSuggestionYN:(PoiSearchYN)poiSearchYN
GeoCodeSearchSuggestionResult:(PoiSearchResultBlock)poiSearchResult;
/**
 *  检测定位功能是否开启
 *
 */
- (BOOL)isLocationServicesEnabled;

@end
