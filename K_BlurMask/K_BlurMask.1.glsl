//
// K_BlurMask v1.0
// Shader written by:   Kyle Obley (kyle.obley@gmail.com)
//


uniform sampler2D front;
uniform sampler2D matte;
uniform float adsk_result_w, adsk_result_h;

vec2 iResolution = vec2(adsk_result_w, adsk_result_h);

vec3 multiply( vec3 f, vec3 a )
{
	return f*a;
}



void main()
{
	vec2 uv = gl_FragCoord.xy / vec2( adsk_result_w, adsk_result_h);
	vec3 f = texture2D(front, uv).rgb;
	vec3 a = texture2D(matte, uv).rgb;
	vec3 c = vec3(0.0);
	
	// Multiply by alpha
	c =  multiply(f,a);
	
	gl_FragColor = vec4(c, a);
}
	
	