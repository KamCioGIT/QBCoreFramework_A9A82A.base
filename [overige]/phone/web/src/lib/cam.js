import {
  OrthographicCamera,
  Scene,
  WebGLRenderTarget,
  LinearFilter,
  NearestFilter,
  RGBAFormat,
  UnsignedByteType,
  CfxTexture,
  ShaderMaterial,
  PlaneBufferGeometry,
  Mesh,
  WebGLRenderer,
} from "@citizenfx/three";
import { v4 } from "uuid";

function dataURItoBlob(dataURI) {
  const byteString = atob(dataURI.split(",")[1]);
  const mimeString = dataURI.split(",")[0].split(":")[1].split(";")[0];

  const ab = new ArrayBuffer(byteString.length);
  const ia = new Uint8Array(ab);

  for (let i = 0; i < byteString.length; i++) {
    ia[i] = byteString.charCodeAt(i);
  }

  const blob = new Blob([ab], { type: mimeString });
  return blob;
}

class RenderUI {
  apiKey;

  initialize() {
    window.addEventListener("message", (event) => {
      this.request = event.data.request;
      if (event.data.type == "setImageProvider") {
        this.apiKey = event.data.apiKey;
      }
    });

    window.addEventListener("resize", (event) => {
      this.resize();
    });

    const cameraRTT = new OrthographicCamera(
      window.innerWidth / -2,
      window.innerWidth / 2,
      window.innerHeight / 2,
      window.innerHeight / -2,
      -10000,
      10000
    );
    cameraRTT.position.z = 100;

    const sceneRTT = new Scene();

    const rtTexture = new WebGLRenderTarget(
      window.innerWidth,
      window.innerHeight,
      {
        minFilter: LinearFilter,
        magFilter: NearestFilter,
        format: RGBAFormat,
        type: UnsignedByteType,
      }
    );
    const gameTexture = new CfxTexture();
    gameTexture.needsUpdate = true;

    const material = new ShaderMaterial({
      uniforms: { tDiffuse: { value: gameTexture } },
      vertexShader: `
			varying vec2 vUv;
			void main() {
				vUv = vec2(uv.x, 1.0-uv.y); // fuck gl uv coords
				gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
			}
`,
      fragmentShader: `
			varying vec2 vUv;
			uniform sampler2D tDiffuse;
			void main() {
				gl_FragColor = texture2D( tDiffuse, vUv );
			}
`,
    });

    this.material = material;

    const plane = new PlaneBufferGeometry(
      window.innerWidth,
      window.innerHeight
    );
    const quad = new Mesh(plane, material);
    quad.position.z = -100;
    sceneRTT.add(quad);

    const renderer = new WebGLRenderer();
    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.autoClear = false;

    document.getElementById("app").appendChild(renderer.domElement);
    document.getElementById("app").style.display = "none";

    this.renderer = renderer;
    this.rtTexture = rtTexture;
    this.sceneRTT = sceneRTT;
    this.cameraRTT = cameraRTT;

    this.animate = this.animate.bind(this);

    requestAnimationFrame(this.animate);
  }

  resize() {
    const cameraRTT = new OrthographicCamera(
      window.innerWidth / -2,
      window.innerWidth / 2,
      window.innerHeight / 2,
      window.innerHeight / -2,
      -10000,
      10000
    );
    cameraRTT.position.z = 100;

    this.cameraRTT = cameraRTT;

    const sceneRTT = new Scene();

    const plane = new PlaneBufferGeometry(
      window.innerWidth,
      window.innerHeight
    );
    const quad = new Mesh(plane, this.material);
    quad.position.z = -100;
    sceneRTT.add(quad);

    this.sceneRTT = sceneRTT;

    this.rtTexture = new WebGLRenderTarget(
      window.innerWidth,
      window.innerHeight,
      {
        minFilter: LinearFilter,
        magFilter: NearestFilter,
        format: RGBAFormat,
        type: UnsignedByteType,
      }
    );

    this.renderer.setSize(window.innerWidth, window.innerHeight);
  }

  animate() {
    requestAnimationFrame(this.animate);

    this.renderer.clear();
    this.renderer.render(this.sceneRTT, this.cameraRTT, this.rtTexture, true);

    if (this.isAnimated) {
      const read = new Uint8Array(window.innerWidth * window.innerHeight * 4);
      this.renderer.readRenderTargetPixels(
        this.rtTexture,
        0,
        0,
        window.innerWidth,
        window.innerHeight,
        read
      );

      this.canvas.width = 600;
      this.canvas.height = window.innerHeight;

      const d = new Uint8ClampedArray(read.buffer);
      const cxt = this.canvas.getContext("2d");
      const imageData = new ImageData(d, window.innerWidth, window.innerHeight);
      cxt.putImageData(imageData, -350, 0);
    }
  }

  render(element) {
    this.canvas = element;
    this.isAnimated = true;
    this.canvas.style.display = "block";
  }

  stop(hide = true) {
    this.isAnimated = false;
    if (this.canvas && hide) {
      if (this.canvas.style.display != "none") {
        this.canvas.style.display = "none";
      }
    }
  }

  takeScreenshot = () =>
    new Promise(async (res) => {
      // read the screenshot
      const read = new Uint8Array(window.innerWidth * window.innerHeight * 4);
      this.renderer.readRenderTargetPixels(
        this.rtTexture,
        0,
        0,
        window.innerWidth,
        window.innerHeight,
        read
      );

      // create a temporary canvas to compress the image
      const canvas = document.createElement("canvas");
      canvas.style.display = "inline";
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;

      // draw the image on the canvas
      const d = new Uint8ClampedArray(read.buffer);

      const cxt = canvas.getContext("2d");
      cxt.putImageData(
        new ImageData(d, window.innerWidth, window.innerHeight),
        0,
        0
      );

      // encode the image
      let type = "image/png";
      let quality = 0.92;

      // actual encoding
      const imageURL = canvas.toDataURL(type, quality);

      const getFormData = () => {
        const formData = new FormData();
        formData.append("image", dataURItoBlob(imageURL), `${v4()}.png`);

        return formData;
      };

      fetch(`https://api.imgbb.com/1/upload?key=${this.apiKey}`, {
        method: "POST",
        mode: "cors",
        body: getFormData(),
      })
        .then((response) => response.json())
        .then((data) => {
          res(data.data.url);
        });
    });
}

export { RenderUI };
