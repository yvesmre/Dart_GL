import 'dart:web_gl' as webgl;
import 'dart:math' as math;
import 'dart:html';

late webgl.RenderingContext gl;
var random = math.Random();
void main() {
  var canvas = querySelector('#game') as CanvasElement;
  gl = canvas.getContext("webgl") as webgl.RenderingContext;

  window.requestAnimationFrame(render);
}

num lastTime = 0;

void render(num value) {
  num diff = value - lastTime;

  if (diff > 120) {
    print(diff);
    gl.viewport(0, 0, gl.drawingBufferWidth ?? 0, gl.drawingBufferHeight ?? 0);
    gl.clearColor(
        random.nextDouble(), random.nextDouble(), random.nextDouble(), 1);
    gl.clear(webgl.WebGL.COLOR_BUFFER_BIT);
    lastTime = value;
  }

  window.requestAnimationFrame(render);
}
