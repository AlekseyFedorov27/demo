uniform sampler2D uTexture;
uniform float uAlpha;
uniform vec2 uOffset;
varying vec2 vUv;
uniform vec2 u_mouse;
uniform float u_time;

vec3 rgbShift(sampler2D textureImage, vec2 uv, vec2 offset) {

   float noise = 1. - sin(3. * uv.y + uv.x + u_mouse.x * 30. + u_mouse.y * 30. + u_time * 0.6) / 30.;
   vec3 rgb = texture2D(textureImage, uv * noise).rgb;
   rgb.b = texture2D(textureImage, uv * noise + sin(u_mouse.y)*0.03).b;
   rgb.r = texture2D(textureImage, uv * noise - sin(u_mouse.x)*-0.02).r;
   return vec3(rgb);
}

void main() {
   vec3 color = rgbShift(uTexture, vUv, uOffset);
   gl_FragColor = vec4(color, uAlpha);
}

