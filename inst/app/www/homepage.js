(function () {
  const image_href = [
    "linear-gradient(98deg, rgba(62,23,97,0.84), rgba(92,55,126,0)), url('https://www.nccpa.net/wp-content/uploads/2024/10/nurse-showing-elderly-man-brochure.jpg')",
    "linear-gradient(98deg, rgba(62,23,97,0.84), rgba(92,55,126,0)), url('https://www.nccpa.net/wp-content/uploads/2024/10/Data-Security.png')",
    "linear-gradient(98deg, rgba(62,23,97,0.84), rgba(92,55,126,0)), url('https://www.nccpa.net/wp-content/uploads/2024/10/pexels-tofros-com-83191-359757-scaled.jpg')"
  ];

  let currentIndex = 0;

  $(document).ready(function () {
    const target = $(".tab-content.html-fill-item.html-fill-container");

    if (target.length === 0) {
      console.warn("Target container not found.");
      return;
    }

    function updateBackground() {
      target.css({
        "background-image": image_href[currentIndex],
        "background-size": "cover",
        "background-position": "center",
        "background-repeat": "no-repeat"
      });
    }

    updateBackground();

    setInterval(function () {
      currentIndex = (currentIndex + 1) % image_href.length;
      target.fadeOut(500, function () {
        updateBackground();
        target.fadeIn(500);
      });
    }, 5000);
  });
})();
