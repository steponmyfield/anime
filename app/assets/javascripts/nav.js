const modalOpen = document.querySelector(".open")
const modal = document.querySelector(".header-nav-menu")
const modalClose = document.querySelector(".close")

modalOpen.addEventListener("click", function () {
  modal.classList.add("open-modal")
})
modalClose.addEventListener("click", function () {
  modal.classList.remove("open-modal")
})
