const { ImageData, Image, createCanvas, createImageData } = require("canvas")
const Path = require('path')
const Fs = require('fs/promises')

class ImageWrapper {
  static async open(path) {
    let img = new Image()
    
    return new Promise((resolve, reject) => {
      img.onload = () => {
        const canvas = createCanvas(img.width, img.height),
              ctx = canvas.getContext('2d')
      
        ctx.drawImage(img, 0, 0, img.width, img.height)
        resolve(new this(canvas) )
      }

      img.onerror = err =>
        reject(err)

      img.src = path
    })
  }
  
  static createEmpty(width, height, color) {
    let imageWrapper = new this(createCanvas(width, height) )

    if(color) {
      imageWrapper.imageData = imageWrapper.imageData.map((v, i) => color[i % 4])
    }

    return imageWrapper
  }

  constructor(canvas) {
    this.ctx = canvas.getContext('2d')
    this.canvas = canvas
    this.imageData = this.ctx.getImageData(0, 0, canvas.width, canvas.height).data
  }

  applyImageData() {
    return this.ctx.putImageData(createImageData(this.imageData, this.canvas.width, this.canvas.height), 0, 0)
  }

  save(path) {
    this.applyImageData()

    let { ext } = Path.parse(path),
        stream

    switch(ext) {
      case '.png':
        stream = this.canvas.createPNGStream()
        break

      case '.jpg':
      case '.jpeg':
        stream = this.canvas.createJPEGStream()
        break

      case '.pdf':
        stream = this.canvas.createPDFStream()
        break

      default:
        throw new Error(`Cannot handle filetype with extension "${ext}"`)
    }

    return Fs.writeFile(path, stream)
  }

  getIndex(x, y = undefined) {
    let index = x + (y != undefined ? this.canvas.width * y : 0)

    return index > -1 ? index * 4 : null
  }

  getCoords(index) {
    return [ index % this.canvas.width, Math.floor(index / this.canvas.width) ]
  }

  get(x, y) {
    let index = this.getIndex(x, y)
        
    if(index == null)
      return

    return this.imageData.slice(index, index + 4)
  }

  put(color, x, y) {
    this.imageData.set(color, this.getIndex(x, y) )
  }

  fromIndex(index, offsetX, offsetY) {
    let x = index %  4,
        y = parseInt(index / this.canvas.width)

    let rawX = index + offsetX

    return rawX % this.canvas.width < index % this.canvas.width ? null : this.get(rawX, offsetY)
  }

  forEach(callback) {
    for(let i = 0; i < (this.imageData.length / 4); i++)
      callback(this.get(i), i, this.imageData)
  }
}

module.exports = ImageWrapper