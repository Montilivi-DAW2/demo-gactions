//llibreries que he trovst per a poder fer els efectes de moviment.
import { animate, stagger, splitText } from 'https://cdn.jsdelivr.net/npm/animejs@4/+esm';

// Respectar preferència de moviment reduït
const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

//Animació del títol i nomes entra ssi 
if (!reduceMotion) {
  const { chars } = splitText('#titol', { words: false, chars: true });

  //Aixo el que fa es animar lletra per lletra per a que aixi es vegi aquest efecte de que puja i baixa.
  animate(chars, {
    y: [
      { to: '-2.75rem', ease: 'outExpo', duration: 600 },
      { to: 0, ease: 'outBounce', duration: 800, delay: 100 }
    ],
    rotate: { from: '-1turn', delay: 0 },
    delay: stagger(50),
    ease: 'inOutCirc',
    loopDelay: 1200,
    loop: true
  });

  //Animació del logo
  animate('#logoMoviment', {
    translateY: [
      { to: -10, duration: 900, ease: 'inOutSine' },
      { to: 0, duration: 900, ease: 'inOutSine' }
    ],
    loop: true
  });
}

//Aquest apartat es per a fer que al anar a un enllaç es vegi com mes fluid 
document.querySelectorAll('a[href^="#"]').forEach(a => {
  a.addEventListener('click', (e) => {
    const id = a.getAttribute('href');
    const el = document.querySelector(id);
    if (!el) return;

    e.preventDefault();
    el.scrollIntoView({ behavior: 'smooth', block: 'start' });
  });
  
});
