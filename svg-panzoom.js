document.addEventListener("DOMContentLoaded", function () {
  const embedElement = document.getElementById("d2-svg");

  embedElement.addEventListener("load", function () {
    const svgDoc =
      embedElement.contentDocument || embedElement.getSVGDocument();

    if (!svgDoc) {
      console.error("Could not access embedded SVG document.");
      return;
    }

    const innerSvg = svgDoc.querySelector("svg");

    if (!innerSvg) {
      console.error("No SVG found inside embed.");
      return;
    }

    const panzoomInstance = Panzoom(innerSvg, {
      contain: "outside",
      maxScale: 5,
    });

    innerSvg.parentElement.addEventListener(
      "wheel",
      panzoomInstance.zoomWithWheel
    );
  });
});
