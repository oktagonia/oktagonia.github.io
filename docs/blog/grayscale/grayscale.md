%{(Post "Image posterization using principal component analysis" "May 2025")}%

Here's the idea: want a grayscale image? Project onto the first principal component.
It works pretty well.

<div class="grayscale-converter">
  <input type='text' id="url" placeholder="URL"/>
  <button onclick="load_image()">Convert to Grayscale</button>

  <div class="loading" id="loading">Processing image...</div>

  <div class="image-container">
    <h3>Original Image</h3>
    <img id="image" alt="Original image"/>
  </div>

  <div class="image-container">
    <h3>Grayscale</h3>
    <canvas id="grayscale"></canvas>
  </div>

  <canvas id="canvas" style="display: none;"></canvas>
</div>

Here's some yap about how I did this. I couldn't figure out how to use javascript libraries to I
wrote a barebones program to find the first principal component. Finding the covariance matrix
is pretty straightforward, especially since this is only $3\times3$ so I just hard coded it. Our
professor randomly covered power method in linear algebra II which I thought was weird at the time,
but I guess it saved me this time. I only wanted the first principal component, so I used power
iteration to find it. Everything is hard coded since I didn't have a linear algebra library and 
didn't want to write one. The rest of the program is vibe coded with the help of cursor.

Some possible extensions to this include: (1) using the projected values on the
principal component instead of only the lengths, to get an image along a single color spectrum, and
(2) using two principal components to get an image with two colors. I hope to do color quantization
with some sort of clustering soon but that's unrelated to this.

<style>
.grayscale-converter {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px 0;
}

.grayscale-converter input[type="text"] {
  width: calc(100% - 10px);
  padding: 8px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

.grayscale-converter button {
  width: 100%;
  padding: 8px;
  background: #333;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-bottom: 20px;
}

.grayscale-converter button:hover {
  background: #444;
}

.image-container {
  margin: 20px 0;
}

.image-container h3 {
  margin-bottom: 10px;
}

.image-container img,
.image-container canvas {
  max-width: 100%;
  height: auto;
  display: block;
}

.loading {
  display: none;
  text-align: center;
  margin: 20px 0;
}

.loading.active {
  display: block;
}
</style>

<script>
const image = document.getElementById('image')
const canvas = document.getElementById('canvas')
const grayscale = document.getElementById('grayscale')
const ctx = canvas.getContext('2d')
const grayscaleCtx = grayscale.getContext('2d')

function computePCA(data) {
  const mean = [0,0,0];
  data.forEach((x) => { mean[0] += x[0]; mean[1] += x[1]; mean[2] += x[2]; });
  mean[0] /= data.length;
  mean[1] /= data.length;
  mean[2] /= data.length;

  const normalized = data.map((x) => [x[0] - mean[0], x[1] - mean[1], x[2] - mean[1]]);
  const cov = [[0,0,0],[0,0,0],[0,0,0]];

  for (let i = 0; i < data.length; i++) {
    const x = normalized[i];
    cov[0][0] += x[0] * x[0];
    cov[0][1] += x[0] * x[1];
    cov[0][2] += x[0] * x[2];
    cov[1][0] += x[1] * x[0];
    cov[1][1] += x[1] * x[1];
    cov[1][2] += x[1] * x[2];
    cov[2][0] += x[2] * x[0];
    cov[2][1] += x[2] * x[1];
    cov[2][2] += x[2] * x[2];
  }

  for (let i = 0; i < 3; i++)
    for (let j = 0; j < 3; j++)
      cov[i][j] /= data.length;

  const b = [1,1,1];
  for (let i = 0; i < 50; i++) {
    for (let j = 0; j < 3; j++)
      b[j] = cov[j][0] * b[0] + cov[j][1] * b[1] + cov[j][2] * b[2];
    const norm = Math.sqrt(b[0]*b[0] + b[1]*b[1] + b[2]*b[2]);
    for (let j = 0; j < 3; j++) b[j] /= norm;
  }

  return b
}

function process_image() {
  canvas.width = image.naturalWidth;
  canvas.height = image.naturalHeight;
  grayscale.width = image.naturalWidth;
  grayscale.height = image.naturalHeight;

  const width = canvas.width;
  const height = canvas.height;

  ctx.drawImage(image, 0, 0);
  const img = ctx.getImageData(0, 0, canvas.width, canvas.height).data;

  const data = [];
  for (let i = 0; i < height; i++) {
    for (let j = 0; j < width; j++) {
      const idx = 4 * (i * width + j);
      const r = img[idx] / 255;
      const g = img[idx + 1] / 255;
      const b = img[idx + 2] / 255;
      data.push([r, g, b]);
    }
  }

  const firstPC = computePCA(data);
  console.log('First principal component:', firstPC);

  const grayscaleData = grayscaleCtx.createImageData(width, height);
  for (let i = 0; i < height; i++) {
    for (let j = 0; j < width; j++) {
      const idx = 4 * (i * width + j);
      const r = img[idx] / 255;
      const g = img[idx + 1] / 255;
      const b = img[idx + 2] / 255;
      
      const grayValue = r * firstPC[0] + g * firstPC[1] + b * firstPC[2];
      const normalizedGray = Math.min(255, Math.max(0, Math.round(grayValue * 255)));
      
      grayscaleData.data[idx] = normalizedGray;
      grayscaleData.data[idx + 1] = normalizedGray;
      grayscaleData.data[idx + 2] = normalizedGray;
      grayscaleData.data[idx + 3] = 255;
    }
  }
  
  grayscaleCtx.putImageData(grayscaleData, 0, 0);
}

function load_image() {
  const url = document.getElementById('url').value;
  image.crossOrigin = 'anonymous';
  image.onload = process_image;
  image.src = url;
}

// Load Starry Night by default
window.onload = function() {
  const defaultImage = 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/1200px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg';
  document.getElementById('url').value = defaultImage;
  load_image();
}
</script> 