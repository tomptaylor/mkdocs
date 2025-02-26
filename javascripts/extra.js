document.addEventListener("DOMContentLoaded", function () {
  // Open modal
  console.log("Hello from JavaScript!");
  document
    .querySelector(".open-modal-icon")
    .addEventListener("click", function () {
      alert("ji");
      document.getElementById("my-modal").style.display = "flex";
    });

  // Close modal
  document.querySelector(".close-modal").addEventListener("click", function () {
    document.getElementById("my-modal").style.display = "none";
  });

  // Close modal when clicking outside the modal content
  document.getElementById("my-modal").addEventListener("click", function (e) {
    if (e.target === this) {
      this.style.display = "none";
    }
  });
});
