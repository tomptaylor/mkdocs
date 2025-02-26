document.addEventListener("DOMContentLoaded", function () {
  console.log("DOM loaded, checking for Panzoom...");

  if (typeof panzoom === "undefined") {
    console.error(
      "Panzoom is not available. Check if it's loaded in `mkdocs.yml`."
    );
    return;
  }

  console.log("Panzoom loaded, initializing...");

  const svgContainer = document.getElementById("svg-container");

  if (!svgContainer) {
    console.error("SVG container not found.");
    return;
  }

  const panzoomInstance = panzoom(svgContainer, {
    contain: "outside",
    maxScale: 5,
  });

  svgContainer.addEventListener("wheel", function (event) {
    //console.log("Wheel event detected!");
    panzoomInstance.zoomWithWheel(event);
  });

  console.log("Panzoom initialized successfully.");
});
