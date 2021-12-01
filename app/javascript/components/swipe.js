import * as Hammer from "hammerjs";
import Swal from "sweetalert2";

export const initSwipe = () => {
  const tinderContainer = document.querySelector('.cards');
  const allCards = document.querySelectorAll('.card-trip');

  initCards(allCards, tinderContainer);

  allCards.forEach(function (card) {
    const nopeBtn = card.querySelector(".match-button.nope")
    const loveBtn = card.querySelector(".match-button.love")
    const sendNopeMatch = createMatch(nopeBtn, card)
    const sendLoveMatch = createMatch(loveBtn, card)

    const hammertime = new Hammer(card);

    hammertime.on('pan', function (event) {
      if (event.target.classList.contains("unswipable")) { return };

      card.classList.add('moving');
    });

    hammertime.on('pan', function (event) {
      if (event.target.classList.contains("unswipable")) { return };

      if (event.deltaX === 0) return;
      if (event.center.x === 0 && event.center.y === 0) return;

      tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
      tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);

      const xMulti = event.deltaX * 0.03;
      const yMulti = event.deltaY / 80;
      const rotate = xMulti * yMulti;

      event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
    });

    hammertime.on('panend', function (event) {
      card.classList.remove('moving');
      tinderContainer.classList.remove('tinder_love');
      tinderContainer.classList.remove('tinder_nope');

      const moveOutWidth = document.body.clientWidth;
      const keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;

      event.target.classList.toggle('removed', !keep);

      if (keep) {
        event.target.style.transform = '';
      } else {
        const endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
        const toX = event.deltaX > 0 ? endX : -endX;
        const endY = Math.abs(event.velocityY) * moveOutWidth;
        const toY = event.deltaY > 0 ? endY : -endY;

        const xMulti = event.deltaX * 0.03;
        const yMulti = event.deltaY / 80;
        const rotate = xMulti * yMulti;

        event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
        initCards(allCards, tinderContainer);

        const love = toX > 0;
        love ? sendLoveMatch() : sendNopeMatch()
      }
    });

    const nopeListener = createButtonListener(false, sendNopeMatch);
    const loveListener = createButtonListener(true, sendLoveMatch);

    nopeBtn.addEventListener("click", nopeListener)
    loveBtn.addEventListener("click", loveListener)
  });
}

function initCards(allCards, tinderContainer) {
  const newCards = document.querySelectorAll('.card-trip:not(.removed)');

  newCards.forEach(function (card, index) {
    card.style.zIndex = allCards.length - index;
    card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 20 * index + 'px)';
    card.style.opacity = (10 - index) / 10;
  });

  tinderContainer.classList.add('loaded');
}

function createButtonListener(love, sendMatch) {
  return function (event) {
    event.preventDefault()

    const cards = document.querySelectorAll('.card-trip:not(.removed)');
    const moveOutWidth = document.body.clientWidth * 1.5;

    if (!cards.length) return false;

    const card = cards[0];

    card.classList.add('removed');

    if (love) {
      card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
    } else {
      card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
    }
    sendMatch()

    const allCards = document.querySelectorAll('.card-trip');
    const tinderContainer = document.querySelector('.cards');
    initCards(allCards, tinderContainer);

    event.preventDefault();
  };
}

function createMatch(form, card) {
  return function () {
    const url = form.action
    fetch(url, {
      method: 'POST',
      headers: { 'Accept': 'application/json' },
      body: new FormData(form)
    })
      .then(response => response.json())
      .then((data) => {
        setTimeout(() => card.remove(), 300)

        const isNewRelationship = data.new_relationship
        const relationshipURL = data.relationship_url

        if (isNewRelationship) {
          Swal.fire({
            title: "It's a match!",
            text: 'Do you want to visit the profile?',
            icon: 'success',
            confirmButtonText: `<a href='${relationshipURL}' class="text-light" <strong>Chat</strong></a>`,
            showCancelButton: true,
            cancelButtonText: 'Keep browsing'
          })
        }
      })
  }
}
