const main_image = document.querySelector("#main-image");
const minor_images = document.querySelectorAll(".minor-image");

minor_images.forEach(image => {
  image.addEventListener("click", event => {
    var image_src_temp = image.src;
    image.src = main_image.src;
    main_image.src = image_src_temp;
  })
})
