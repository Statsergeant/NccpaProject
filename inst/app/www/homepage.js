(function () {
  const imageList = [
    "https://www.nccpa.net/wp-content/uploads/2022/11/Smaller-size-design-4.png",
    "https://www.nccpa.net/wp-content/uploads/2024/10/nurse-showing-elderly-man-brochure.jpg",
    "https://www.nccpa.net/wp-content/uploads/2025/05/Banner-2.png",
    "https://www.nccpa.net/wp-content/uploads/2024/10/pexels-tofros-com-83191-359757-scaled.jpg",
    "https://www.nccpa.net/wp-content/uploads/2024/12/55d62d0eb051c5088ecb27.png"
  ];

  let currentIndex = 0;
  let img = null;

  $(document).ready(function () {
    img = $("#rotating-bg");
    img.attr("src", imageList[currentIndex]);

    setInterval(() => {
      img.fadeOut(500, () => {
        currentIndex = (currentIndex + 1) % imageList.length;
        img.attr("src", imageList[currentIndex]).fadeIn(500);
      });
    }, 5000);
  });
})();
