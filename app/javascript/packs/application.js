// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener('turbolinks:load', () => {

  // Get all "navbar-burger" elements
  const navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Check if there are any navbar burgers
  if (navbarBurgers.length > 0) {

    // Add a click event on each of them
    navbarBurgers.forEach( el => {
      el.addEventListener('click', () => {

        // Get the target from the "data-target" attribute
        const target = el.dataset.target;
        const $target = document.getElementById(target);

        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
        el.classList.toggle('is-active');
        $target.classList.toggle('is-active');

      });
    });
  }
});


document.addEventListener('turbolinks:load', () => {

const notes = document.querySelectorAll('.notification');

if (notes.length > 0) {

    notes.forEach( el => {
      setTimeout(() => {
        el.style.opacity = 0;
      }, 2500);

      setTimeout(() => {
        el.remove()
      }, 4500);
    });
  }

});



document.addEventListener('turbolinks:load', () => {

const openers = Array.prototype.slice.call(document.querySelectorAll('.opener'), 0);

if (openers.length > 0) {

  // Add a click event on each of them
  openers.forEach( el => {
    el.addEventListener('click', () => {

      el.classList.add('hidden-content');
      el.nextElementSibling.classList.remove('hidden-content');

    });
  });
}
});





document.addEventListener('turbolinks:load', () => {

const dismissers = Array.prototype.slice.call(document.querySelectorAll('.dismiss'), 0);

if (dismissers.length > 0) {

  // Add a click event on each of them
  dismissers.forEach( el => {
    el.addEventListener('click', () => {

      setTimeout(() => {
        el.parentNode.remove()
      }, 500);

    });
  });
}
});




document.addEventListener('turbolinks:load', () => {

const $switchers = Array.prototype.slice.call(document.querySelectorAll('.switcher'), 0);

if ($switchers.length > 0) {

  // Add a click event on each of them
  $switchers.forEach( el => {
    el.addEventListener('click', () => {

      const post_wrapper = document.getElementById("post-form-wrapper");
      var tppb = document.getElementById("text_post_post_body");
      var pppb = document.getElementById("picture_post_picture_body");

      post_wrapper.firstElementChild.classList.toggle("hidden-content");
      post_wrapper.lastElementChild.classList.toggle('hidden-content');

      if (el.classList.contains("add-pic")) {
        pppb.value = tppb.value;
      } else {
        tppb.value = pppb.value;
      }

    });
  });
}
});




var count = document.querySelectorAll('.comment-container').length;
document.getElementById("count").innerHTML = count;