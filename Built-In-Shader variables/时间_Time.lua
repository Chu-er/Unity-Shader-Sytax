

_Time	个float4	从级别加载（t / 20，t，t * 2，t * 3）开始的时间，用于为着色器内部的内容设置动画。
_SinTime	个float4	时间正弦：（t / 8，t / 4，t / 2，t）。
_CosTime	个float4	时间的余弦：（t / 8，t / 4，t / 2，t）。
unity_DeltaTime	个float4	增量时间：（dt，1 / dt，smoothDt，1 / smoothDt）。