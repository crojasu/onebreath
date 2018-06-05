function changeNavbarOnScroll() {
  const navbar = document.querySelector('.navbar');
  const screen = document.querySelector('.navbar');
  window.addEventListener("scroll", () => {
    if (window.scrollY >= window.outerHeight) {
      navbar.classList.add('navbar-transparent');
    } else {
      navbar.classList.remove('navbar-transparent');
    }
  });
}
export { changeNavbarOnScroll };
