Shader "Custom/sample" {
     Properties {
         _MainTex("Base (RGB)",2D) = "white" {}
     }
 
 	SubShader {
 		Tags { "RenderType"="Opaque" }
 		LOD 200
 		
 		CGPROGRAM
 		#pragma surface surf Standard 
 		#pragma target 3.0
 
 		struct Input {
 			float3 worldPos;
 			float2 uv_MainTex;
 			float4 screenPos;
 		};
 
 
 		void surf (Input IN, inout SurfaceOutputStandard o) {
 			float dist = abs(distance( fixed2(0.5,0.5), IN.uv_MainTex ) - _Time * 5);
 			float4 black = fixed4(0,0,0,1);
 			if( dist % 0.1 < 0.02) {
 				o.Albedo = fixed4(1,1,1,1);
 			} else {
 				o.Albedo = black;
 			}
 		}
 		ENDCG
 	}
 	FallBack "Diffuse"
 }