
function showPic(whichpic) {
    var source = whichpic.getAttribute("href")
    var palceholder = document.getElementById("placeholder")
    placeholder.setAttribute("src", source)
    var text = whichpic.getAttribute("title")
    var description = document.getElementById("description")
    discription.firstChild.nodeValue = text
}

// function countBodyChildren() {
//     var body_element = document.getElementsByTagName("body")[0]
//     alert(body_element.childNodes.length)
// }

// window.onload = countBodyChildren;

function popUp(winURL) {
    window.open(winURL, "popup", "width=320, height=480")
}

var links = document.getElementsByTagName("a")
for (let i = 0; i < links.length; i++) {
    if (links[i].getAttribute("classs") == "popup") {
        links[i].onclick = function () {
            popUp(this.getAttribute("href"))
            return false
        }
    }    
}
