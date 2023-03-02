let button = document.getElementById("responsiveButton");

button.addEventListener("click", function() {
  // generate random position
  let x = Math.floor(Math.random() * (window.innerWidth - button.offsetWidth));
  let y = Math.floor(Math.random() * (window.innerHeight - button.offsetHeight));

  // set button position
  button.style.left = x + "px";
  button.style.top = y + "px";
});
