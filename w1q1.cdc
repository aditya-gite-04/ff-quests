pub struct Canvas{

    pub let width: UInt8
    pub let height: UInt8
    pub let pixels: String

    init(width: UInt8, height: UInt8, pixels: String){
        self.width = width
        self.height = height
        self.pixels = pixels
    }
}

pub resource Picture{

    pub let canvas: Canvas 
    init(canvas: Canvas){
        self.canvas = canvas;
    }
}


pub fun serializeStringArray(_ lines: [String]): String {

    var buffer = ""
    for line in lines {
        buffer = buffer.concat(line)
    }
    return buffer
}

pub fun display(canvas: Canvas){

    log("+-----+")
    var fromCnt = 0
    var upToCnt = 5
    while fromCnt < 25 {
      log("|".concat(canvas.pixels.slice(from: fromCnt, upTo: upToCnt)).concat("|"))
      fromCnt = upToCnt
      upToCnt = upToCnt + 5
    }
    log("+-----+")

}


pub fun main(){

    let pixelsX = [
        "*   *",
        " * * ",
        "  *  ",
        " * * ",
        "*   *"
    ]
    let canvasX = Canvas(
        width: 5,
        height: 5,
        pixels: serializeStringArray(pixelsX)
    )
    let letterX <- create Picture(canvas:canvasX)
    display(canvas: letterX.canvas)
    destroy letterX
}