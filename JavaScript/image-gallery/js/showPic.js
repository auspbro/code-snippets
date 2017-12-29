
function showPic(whichpic) {
    if (!document.getElementById("placeholder")) return false;
    var source = whichpic.getAttribute("href");
    var placeholder = document.getElementById("placeholder");
    if (placeholder.nodeName != 'IMG') return false;
    placeholder.setAttribute("src", source);
    if (document.getElementById("description")) {
        var text = whichpic.getAttribute("title") ? whichpic.getAttribute("title") : "";
        var description = document.getElementById("description");
        if (description.firstChild.nodeType == 3) {
            description.firstChild.nodeValue = text;
        }
    }
    return true;
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
    if (!document.getElementsByTagName) return false;
    if (!document.getElementById) return false;
    if (!document.getElementById("imagegallery")) return false;
    var links = document.getElementById("imagegallery").getElementsByTagName("a");
    for (var i = 0; i < links.length; i++) {
        links[i].onclick = function () {
            return !showPic(this);
        }
        links[i].onkeypress = links[i].onclick;
    }
}

function addLoadEvent(func) {
    var oldonload = window.onload;
    if (typeof window.onload != "function") {
        window.onload = func;
    } else {
        window.onload = function () {
            oldonload();
            func();
        }
    }
}

addLoadEvent(prepareGallery)