function filterByType(spot_type) {
    var cards, i;
    cards = document.getElementsByClassName("card");
    if (spot_type === "all") spot_type = "";
    // Add the "show" class to the filtered elements, and remove the "show" class from the elements that are not selected
    for (i = 0; i < cards.length; i++) {
        removeClass(cards[i], "show");
        if (cards[i].className.indexOf(spot_type) > -1) addClass(cards[i], "show");
    }
    changeActiveButton("spot_type");
}

function filterByRating(spot_rating) {
    var cards, i;
    cards = document.getElementsByClassName("card");
    if (spot_rating === "all") spot_rating = "";
    // Add the "show" class to the filtered elements, and remove the "show" class from the elements that are not selected
    for (i = 0; i < cards.length; i++) {
        removeClass(cards[i], "show");
        for (s = spot_rating; s<=10; s++) {
            if (cards[i].className.indexOf("rating-" + s) > -1) addClass(cards[i], "show");
        }
    }
    changeActiveButton("rating");
}

// Show filtered elements
function addClass(element, name) {
    var i, arr1, arr2;
    arr1 = element.className.split(" ");
    arr2 = name.split(" ");
    for (i = 0; i < arr2.length; i++) {
        if (arr1.indexOf(arr2[i]) === -1) {
            element.className += " " + arr2[i];
        }
    }
}

// Hide elements that are not selected
function removeClass(element, name) {
    var i, arr1, arr2;
    arr1 = element.className.split(" ");
    arr2 = name.split(" ");
    for (i = 0; i < arr2.length; i++) {
        while (arr1.indexOf(arr2[i]) > -1) {
            arr1.splice(arr1.indexOf(arr2[i]), 1);
        }
    }
    element.className = arr1.join(" ");
}

function changeActiveButton(button_type) {
// Add active class to the current control button (highlight it)
    var btnContainer;
    if (button_type === "spot_type"){
        btnContainer = document.getElementById("type-filters");
    }else if (button_type === "rating"){
        btnContainer = document.getElementById("rating-filters");
    }else {
        console.log("button container type not known");
    }

    var btns = btnContainer.getElementsByClassName("btn");
    for (var i = 0; i < btns.length; i++) {
        btns[i].addEventListener("click", function () {
            var current = btnContainer.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
        });
    }
}




