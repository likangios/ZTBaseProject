//
//  MyLocationManager.m
//  xuexuecan
//
//  Created by zhongli on 15/3/5.
//  Copyright (c) 2015年 ICan. All rights reserved.
//

#import "MyLocationManager.h"

@implementation MyLocationManager
+ (id)sharedManager{
    static id _s;
    if (_s == nil) {
        _s = [[self alloc]init];
        [_s initGeoCodeSearch];
        [_s initLocationService];
        [_s initSuggestionSearch];
        [_s initPOISearch];
    }
    return _s;
}
- (void)initLocationService{
    _locService = [[BMKLocationService alloc]init];
    _locService.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    _locService.delegate = self;
}
- (void)initGeoCodeSearch{
    _searcher = [[BMKGeoCodeSearch alloc]init];
    _searcher.delegate = self;
}
- (void)initPOISearch{
    _Poisearcher =[[BMKPoiSearch alloc]init];
    _Poisearcher.delegate = self;
}
- (void)initSuggestionSearch{
    _searcherSuggestion = [[BMKSuggestionSearch alloc]init];
    _searcherSuggestion.delegate = self;
}
- (NSString *)getCityName{
    return self.cityName;
}
- (NSString *)getCityAddress{
    return  self.cityAddress;
}
- (NSString *)getProvince{
    return self.province;
}
- (NSString *)getDistrict{
    return  self.district;
}
- (CLLocationCoordinate2D)getLocation{
    return self.location;
}
- (void)startLocation{
    [_locService startUserLocationService];
}
- (void)stopLocation{
    [_locService stopUserLocationService];
}
#pragma mark 定位Block
- (void)BMKLocationServiceWillStart:(willStartLocatingBlock)willStart didUpdateUserLocationBlock:(didUpdateUserLocationBlock)didUpdate
                    didFailToLocate:(didFailToLocate)didFail
               didStopLocatingBlock:(didStopLocatingBlock)didStop{
    _willStart = willStart;
    _didUpdate = didUpdate;
    _didFail = didFail;
    _didStop = didStop;
    [_locService startUserLocationService];
}
#pragma mark 定位回调
- (void)willStartLocatingUser{
    if (_willStart) {
        _willStart();
    }
}
- (void)didStopLocatingUser{
    if (_didStop) {
        _didStop();
    }
}
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    [_locService stopUserLocationService];
    self.location = userLocation.location.coordinate;
    if (_didUpdate) {
        _didUpdate(userLocation);
    }
    [self BMKGeoCodeSearchReverseGeoCodeOptionWith:self.location ReverseGeoCodeYN:NULL ReverseGeoCodeResult:^(BMKReverseGeoCodeResult *result, BMKSearchErrorCode error) {
        BMKAddressComponent *component = result.addressDetail;
        self.cityName = component.city;
        self.cityAddress = result.address;
        self.province = component.province;
        self.district = component.district;
        DDLogDebug(@"city %@  adress %@",self.cityName,self.cityAddress);
    }];
}
- (void)didFailToLocateUserWithError:(NSError *)error{
    [_locService stopUserLocationService];
    if (_didFail) {
        _didFail(error);
    }
}
#pragma mark 地理编码Block

- (void)BMKGeoCodeSearchReverseGeoCodeOptionWith:(CLLocationCoordinate2D)cllocation   ReverseGeoCodeYN:(ReverseGeoCodeYN)rgcYN
                            ReverseGeoCodeResult:(ReverseGeoCodeResultBlock)rgcResult{
    _searchCllocation = cllocation;
    _rgcYN = rgcYN;
    _rgcResult = rgcResult;
    [self ReverseGeoCodeOptionWith:cllocation];
}
- (void)ReverseGeoCodeOptionWith:(CLLocationCoordinate2D)cllocation{
    BMKReverseGeoCodeOption *reverseGeocodeOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeocodeOption.reverseGeoPoint = cllocation;
    BOOL flag = [_searcher reverseGeoCode:reverseGeocodeOption ];
    if (_rgcYN) {
        _rgcYN(flag);
    }
}
- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
    if (error == BMK_SEARCH_NO_ERROR) {
    }
    if (_rgcResult) {
        _rgcResult(result,error);
    }
}
#pragma mark  位置检索Block
- (void)BMKGeoCodeSearchGeoCodeSearchWithCity:(NSString *)city Address:(NSString *)address
                              GeoCodeSearchYN:(GeoCodeSearchYN)gcYN
                          GeoCodeSearchResult:(GeoCodeSearchResultBlock)gcResult{
    _gcYN = gcYN;
    _gcResult = gcResult;
    [self GeoCodeSearchWithCity:city Address:address];
}
- (void)GeoCodeSearchWithCity:(NSString *)city Address:(NSString *)address{
    BMKGeoCodeSearchOption *geoCodeSearchOption = [[BMKGeoCodeSearchOption alloc]init];
    geoCodeSearchOption.city= city;
    geoCodeSearchOption.address = address;
    BOOL flag = [_searcher geoCode:geoCodeSearchOption];
    if (_gcYN) {
        _gcYN(flag);
    }
}
- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
    if (_gcResult) {
        _gcResult(result,error);
    }
}
#pragma mark 位置检索建议Block
- (void)BMKGeoCodeSearchGeoCodeSearchSuggestionWithCity:(NSString *)city Address:(NSString *)address
                              GeoCodeSearchSuggestionYN:(GeoCodeSearchSuggestionYN)suggestionYN
                          GeoCodeSearchSuggestionResult:(GeoCodeSearchSuggestionResultBlock)suggestionResult{
    _suggestionYN = suggestionYN;
    _suggestionResult = suggestionResult;
    [self SearchOptionWithCity:city Address:address];
}
- (void)SearchOptionWithCity:(NSString *)city Address:(NSString *)address{
    
    BMKSuggestionSearchOption *option = [[BMKSuggestionSearchOption alloc]init];
    option.cityname = city;//搜索城市
    option.keyword = address;//搜索地址
    BOOL flag = [_searcherSuggestion suggestionSearch:option ];
    if (_suggestionYN) {
        _suggestionYN(flag);
    }
}
//检索建议
- (void)onGetSuggestionResult:(BMKSuggestionSearch *)searcher result:(BMKSuggestionResult *)result errorCode:(BMKSearchErrorCode)error{
    if (_suggestionResult) {
        _suggestionResult(result,error);
    }
}
#pragma mark POI检索建议Block
- (void)BMKPOISearchWithCity:(NSString *)city Address:(NSString *)address
                              GeoCodeSearchSuggestionYN:(PoiSearchYN)poiSearchYN
                          GeoCodeSearchSuggestionResult:(PoiSearchResultBlock)poiSearchResult{
    _poiCityYN = poiSearchYN;
    _poiCitySearchResult = poiSearchResult;
    [self PoiSearchWithCity:city AndKeyword:address];
}
- (void)PoiSearchWithCity:(NSString *)city AndKeyword:(NSString *)keyword{
    BMKCitySearchOption *option = [[BMKCitySearchOption alloc]init];
    if (city) {
    option.city = city;
    }else{
    option.city = @"";
    }
    option.keyword = keyword;
    BOOL flag =  [_Poisearcher poiSearchInCity:option];
    if (_poiCityYN) {
        _poiCityYN(flag);
    }
}
#pragma mark implement BMKSearchDelegate
- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult*)result errorCode:(BMKSearchErrorCode)error
{
    if (_poiCitySearchResult) {
        _poiCitySearchResult(result,error);
    }
}
#pragma mark OTHER

- (BOOL)isLocationServicesEnabled{
    if ([CLLocationManager locationServicesEnabled] &&
        ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized
         || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)) {
            return YES;
        }
    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied){
        return NO;
    }
    return NO;
}



@end
