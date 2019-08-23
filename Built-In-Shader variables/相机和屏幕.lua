
----------------相机和屏幕
这些变量将对应于摄像机中的渲染。例如，在阴影贴图渲染期间，
它们仍然会引用相机组件值，而不是用于阴影贴图投影的“虚拟相机”。


name       type                    value

_WorldSpaceCameraPos	FLOAT3	相机的世界空间位置。
_ProjectionParams		float4	x是1.0（如果当前使用翻转投影矩阵渲染，则为-1.0 ），y是摄像机的近平面，z是摄像机的远平面，w是1 / FarPlane。
_ScreenParams			float4	x是相机目标纹理的宽度（以像素为，y是相机的目标纹理的以像素为单位的高度，z为1.0 + 1.0 /宽度和w为1.0 + 1.0 /高度。
_ZBufferParams	个float4	用于线性化Z缓冲区值。x是（1 - far/near），y是（far/near），z是（x /far）并且w是（y /far）。
unity_OrthoParams	个float4	x是正交相机的宽度，y是正交相机的高度，z未使用     w:相机为正交时为1.0，透视时为0.0。
unity_CameraProjection	float4x4	相机的投影矩阵。
unity_CameraInvProjection	float4x4	反相机的投影矩阵。
unity_CameraWorldClipPlanes [6]	个float4	相机平截头体平面世界空间方程，按此顺序：左，右，底，顶，近，远。