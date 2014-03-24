//
// K_BlurMask v1.0
// Shader written by:   Kyle Obley (kyle.obley@gmail.com)
//
// Pass #1: Multiply front by the matte
//


uniform sampler2D front, matte;
uniform float adsk_result_w, adsk_result_h;

void main()
{
	vec2 iResolution = vec2(adsk_result_w, adsk_result_h);
	vec2 uv = gl_FragCoord.xy / vec2( adsk_result_w, adsk_result_h);
	vec3 f = texture2D(front, uv).rgb;
	vec3 a = texture2D(matte, uv).rgb;
	
	gl_FragColor = vec4((f*a), a);
}
	
	