
function showPic(whichpic) {
    if (!document.getElementById("placeholder")) {
        return false
    }
    var source = whichpic.getAttribute("href")
    var palceholder = document.getElementById("placeholder")
    if (palceholder.nodeName != "IMG")) {
        return false
    }
    placeholder.setAttribute("src", source)
    if (document.getElementById("description")) {
        var text = whichpic.getAttribute("title") ? whichpic.getAttribute("title") : ""
        var description = document.getElementById("description")
        if (description.firstChild.nodeValue == 3) {
            discription.firstChild.nodeValue = text
        }
    }
    return true
}

// function countBodyChildren() {
//     var body_element = document.getElementsByTagName("body")[0]
//     alert(body_element.childNodes.length)
// }

// window.onload = countBodyChildren;

// function popUp(winURL) {
//     window.open(winURL, "popup", "width=320, height=480")
// }

window.onload = prepareLinks
function prepareLinks() {
    if (!document.getElementsByTagName) {
        return false
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
}


function prepareGallery() {
    if (!document.getElementsByTagName || !document.getElementById || !document.getElementById("imagegallery")) {
        return false
    }
    var gallery = document.getElementById("imagegallery")
    var links = gallery.getElementsByTagName("a")
    for (let i = 0; i < links.length; i++) {
        links[i].onclick = function () {
            showPic(this)
            return !showPic(this)
        }
    }
}

function addLoadEvent(func) {
    var oldonload = window.onload
    if (typeof window.onload != 'function') {
        window.onload = func
    } else {
        window.onload = function () {
            oldonload()
            func()
        }
    }
}

addLoadEvent(prepareGallery)