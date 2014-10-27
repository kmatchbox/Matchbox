//
// K_BW v1.0
// Shader written by:   Kyle Obley (kyle.obley@gmail.com)
//

uniform sampler2D image;
uniform float adsk_result_w, adsk_result_h;
uniform float red, green, blue;

void main()
{	
	vec2 st = gl_FragCoord.xy / vec2 (adsk_result_w, adsk_result_h);
	vec3 image = texture2D(image, st).rgb;
	
	float luminance = image.r * (red/100.0) + image.g * (green/100.0) + image.b * (blue/100.0);
	gl_FragColor = vec4(luminance, luminance, luminance, 1.0);
}