import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Review your Favorite Movie!"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
