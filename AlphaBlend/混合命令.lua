Blend SrcAlpha OneMinusSrcAlpha // 传统透明度
Blend One OneMinusSrcAlpha // 预乘透明度
Blend One One // 叠加
Blend OneMinusDstColor One // 柔和叠加
Blend DstColor Zero // 相乘——正片叠底
Blend DstColor SrcColor // 两倍相乘



Blend Off	关闭混合(默认)
Blend SrcFactor DstFactor	片元产生的颜色乘以SrcFactor,加上屏幕上已有的颜色乘以DstFactor,得到最终的颜色(写入颜色缓存),示例: float4 result = SrcFactor * fragment_output + DstFactor * pixel_color
Blend SrcFactor DstFactor,SrcFactorA, DstFactorA	同上,只不过使用单独的因子SrcFactorA和DstFactorA来混合透明度通道
BlendOp BlendOperation	用其他的操作来取代加法混合
BlendOp OpColor,OpAlpha	同上,只不过对于透明度通道使用不同的操作

