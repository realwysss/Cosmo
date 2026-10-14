#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

in float sphericalVertexDistance;
in float cylindricalVertexDistance;

out vec4 fragColor;

void main() {
    float l = dot(ColorModulator.rgb, vec3(0.3, 0.55, 0.15));
    float k = 1.0 - smoothstep(0.08, 0.45, l);
    vec3 pur = vec3(0.1, 0.03, 0.2) * clamp(l * 6.0 + 0.35, 0.0, 1.3);
    vec4 c = vec4(mix(ColorModulator.rgb, pur, k), ColorModulator.a);
    fragColor = apply_fog(c, sphericalVertexDistance, cylindricalVertexDistance, 0.0, FogSkyEnd, FogSkyEnd, FogSkyEnd, FogColor);
}