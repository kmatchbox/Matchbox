//
// K_RgbcmyMatte v1.1
// Shader written by:   Kyle Obley (kyle.obley@gmail.com)
//

uniform sampler2D image;
uniform float adsk_result_w, adsk_result_h;
uniform float whichone;

void main()
{	
	vec2 st = gl_FragCoord.xy / vec2 (adsk_result_w, adsk_result_h);
	
	int selection = int( floor( whichone ) );
	
	vec3 cmy;
	
	cmy.x = texture2D(image, st).r;
	cmy.y = texture2D(image, st).g;
	cmy.z = texture2D(image, st).b;
	
	cmy.x = vec3 (0.0, 0.0, 0.0) + (cmy.x); // Red
	cmy.y = vec3 (0.0, 0.0, 0.0) + (cmy.y); // Green
	cmy.z = vec3 (0.0, 0.0, 0.0) + (cmy.z); // Blue
	
	// Red
	if ( selection == 1 )
	{
		gl_FragColor = vec4( cmy.x * (1.0 - cmy.y) * (1.0 - cmy.z) );
	}
	
	// Green
	else if ( selection == 2 )
	{
		gl_FragColor = vec4( (1.0 - cmy.x) * cmy.y * (1.0 - cmy.z) );
	}
	
	// Blue
	else if ( selection == 3 )
	{
		gl_FragColor = vec4( (1.0 - cmy.x) * (1.0 - cmy.y) * cmy.z );
	}
	
	// Cyan
	else if ( selection == 4 )
	{
		gl_FragColor = vec4( (1.0 - cmy.x) * cmy.y * cmy.z );
	}
	
	// Yellow
	else if ( selection == 5 )
	{
		gl_FragColor = vec4(  cmy.x * cmy.y  * (1.0 - cmy.z) );
	}
	
	// Magenta
	else if ( selection == 6 )
	{
		gl_FragColor = vec4( cmy.z * (1.0 - cmy.x ) * cmy.y );
	}
	
	// White
	else if ( selection == 7 )
	{
		gl_FragColor = vec4( cmy.x * cmy.y * cmy.z );
	}
}