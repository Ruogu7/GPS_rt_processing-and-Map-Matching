function [Lat_d, Lon_d] = ll_dm2d (ll_dm_lat,lat_mark,ll_dm_lon,lon_mark)
% 调整GPS的NMEA协议的经纬度数据的格式，从dm，转化成d
% ll_dm_lat：ddmm.mmmm (前导位数不足，则补0)
% ll_dm_lon：dddmm.mmmm (前导位数不足，则补0)
% step:
% 1. 分割dd,mm.mmmm等字符串
% 2. 确认dd字符串，去掉前导0，变成数值；
% 3. mm.mmmm 分割成mm，mmmm，并转换为d
% 4. 叠加步骤2和步骤3的数值，成为最终结果
% example：
%  [Lat_d,Lon_d] = ll_dm2d ('3036.2727','N','11418.5035','E')
%  [Lat_d,Lon_d] = ll_dm2d ('0036.2727','S','11418.5035','E')
%  [Lat_d,Lon_d] = ll_dm2d ('0006.2727','N','11418.5035','E')
%  [Lat_d,Lon_d] = ll_dm2d ('0000.2727','N','10008.5035','W')
%  [Lat_d,Lon_d] = ll_dm2d ('3036.2727','N','00418.5035','E')
%  [Lat_d,Lon_d] = ll_dm2d ('3000.2727','N','00000.5035','E')
% 
% Author: ruogu7， 380545156@qq.com
% Date: 2020/06/15
% Latest Update: 2020/06/15

%% 处理纬度  ddmm.mmmm (前导位数不足，则补0)
% 从‘.’处，分割成两部分
Lat_cell = regexp(ll_dm_lat, '\.', 'split') ; 
% .mmmm转化成 度数d
Lat_mmmm_d = (str2num(['0.',Lat_cell{2}]))/60; 
% 分割ddmm
Lat_ddmm_str = Lat_cell{1};
% 分割dd
Lat_dd_str = Lat_ddmm_str(1:2);
% 如果有前导0，则去掉dd的前导0
Lat_dd_d = str2num(Lat_dd_str);
% 分割mm
Lat_mm_str = Lat_ddmm_str(3:4);
Lat_mm_d = (str2num(Lat_mm_str))/60;

Lat_d = Lat_mmmm_d + Lat_mm_d + Lat_dd_d;

%% 处理经度 dddmm.mmmm (前导位数不足，则补0)
% 从‘.’处，分割成两部分
Lon_cell = regexp(ll_dm_lon, '\.', 'split');  
% .mmmm转化成 度数d
Lon_mmmm_d = (str2num(['0.',Lon_cell{2}]))/60;  
% 分割dddmm
Lon_dddmm_str = Lon_cell{1} ;
% 分割ddd
Lon_ddd_str = Lon_dddmm_str(1:3);
% 如果有前导0，则去掉dd的前导0
Lon_ddd_d = str2num(Lon_ddd_str);
% 分割mm
Lon_mm_str = Lon_dddmm_str(4:5);
Lon_mm_d = (str2num(Lon_mm_str))/60;

Lon_d = Lon_mmmm_d + Lon_mm_d + Lon_ddd_d;


%% 处理正负号
% 北纬为正；南纬为负
if strcmp(lat_mark,'S')   
    Lat_d = 0 - Lat_d;
end

% 东经为正；西经为负
if strcmp(lon_mark,'W')   
    Lon_d = 0 - Lon_d;
end


