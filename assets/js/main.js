// Site-wide behaviour: mobile navigation toggle.
(function () {
  var btn = document.querySelector('.nav-toggle');
  var menu = document.getElementById('nav-menu');
  if (!btn || !menu) return;

  function setOpen(open) {
    menu.classList.toggle('open', open);
    btn.setAttribute('aria-expanded', open ? 'true' : 'false');
    btn.setAttribute('aria-label', open ? 'Close menu' : 'Open menu');
  }

  btn.addEventListener('click', function () {
    setOpen(!menu.classList.contains('open'));
  });
  menu.addEventListener('click', function (e) {
    if (e.target.closest('a')) setOpen(false);
  });
  document.addEventListener('click', function (e) {
    if (!e.target.closest('.nav')) setOpen(false);
  });
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') setOpen(false);
  });
  window.addEventListener('resize', function () {
    if (window.innerWidth > 960) setOpen(false);
  });
})();
