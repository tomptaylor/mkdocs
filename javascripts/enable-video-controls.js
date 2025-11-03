document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll("video").forEach((video) => {
    video.setAttribute("controls", "true");
  });
});
