
function showPic(whichpic) {
    var source = whichpic.getAttribute("href")
    var palceholder = document.getElementById("placeholder")
    placeholder.setAttribute("src", source)
}

function countBodyChildren() {
    var body_element = document.getElementsByTagName("body")[0]
    alert(body_element.childNodes.length)
}

window.onload = countBodyChildren;