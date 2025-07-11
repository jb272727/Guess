shader_type spatial;
render_mode cull_disabled, unshaded;

uniform sampler2D depth_texture : hint_depth_texture;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

uniform bool enable_fog = true;
uniform vec3 fog_color : source_color;
uniform vec3 noise_color : source_color;
uniform float fog_distance : hint_range(1, 6000) = 100.0;
uniform float fog_fade_range : hint_range(1, 6000) = 50.0;
uniform bool enable_noise = true;
uniform float noise_time_fac : hint_range(0.1, 10.0) = 4.0;
uniform bool enable_color_limitation = true;
uniform int color_levels : hint_range(2, 256) = 32;
uniform bool enable_dithering = true;
uniform float dither_strength : hint_range(0.0, 1.0) = 0.3;

// NEW: Luminance thresholding
uniform bool enable_luminance_threshold = false;
uniform float luminance_threshold : hint_range(0.0, 1.0) = 0.25;

float hashOld12(vec2 p) {
	return fract(
		sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453
		+ (sin(TIME) / noise_time_fac)
	);
}

vec3 color_mix(vec3 a, vec3 b, float f) {
	f = clamp(abs(f), 0.0, 1.0);
	return a * f + b * (1.0 - f);
}

vec3 quantize_color(vec3 color, int levels) {
	float q = float(levels - 1);
	return floor(color * q + 0.5) / q;
}

float dither(vec2 pos, float brightness) {
	const float pattern[16] = float[](
		0.0,   0.5,   0.125, 0.625,
		0.75,  0.25,  0.875, 0.375,
		0.1875,0.6875,0.0625,0.5625,
		0.9375,0.4375,1.0,   0.8125
	);
	ivec2 idx = ivec2(mod(pos.xy, 4.0));
	int i = idx.x + idx.y * 4;
	return brightness < pattern[i] ? 0.0 : 1.0;
}

void vertex() {
	POSITION = vec4(VERTEX, 1.0);
}

void fragment() {
	// Sample screen and depth
	vec3 col = texture(screen_texture, SCREEN_UV).rgb;
	vec2 sc  = SCREEN_UV * 2.0 - 1.0;
	float d = texture(depth_texture, SCREEN_UV).r;
	vec4 v = INV_PROJECTION_MATRIX * vec4(vec3(sc, d), 1.0);
	v.xyz /= v.w;
	float lin_depth = -v.z;
	float fog_f = clamp(
		(lin_depth - (fog_distance - fog_fade_range))
		/ fog_fade_range, 
		0.0, 1.0
	);

	// Noise & fog
	if (enable_noise) {
		vec3 ncol = color_mix(fog_color, noise_color, hashOld12(sc));
		col = color_mix(ncol, col, fog_f);
	}
	if (enable_fog) {
		col = color_mix(fog_color, col, fog_f);
	}

	// Color quantization
	if (enable_color_limitation) {
		col = quantize_color(col, color_levels);
	}

	// Dithering
	if (enable_dithering) {
		float b = dot(col, vec3(0.3, 0.59, 0.11));
		float m = dither_strength * (dither(FRAGCOORD.xy, b) - 0.5);
		b += m;
		col *= (1.0 + m);
	}

	// Luminance threshold
	if (enable_luminance_threshold) {
		float lum = dot(col, vec3(0.299, 0.587, 0.114));
		if (lum < luminance_threshold) {
			col = vec3(0.0);
		}
	}

	ALBEDO = col;
}
