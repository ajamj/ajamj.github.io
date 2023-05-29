const quotes = [
  {
    quote: "Every tomorrow has two handles. We can take hold of it with the handle of anxiety or the handle of faith.",
    author: "Henry Ward Beecher",
  },
  {
    quote: "You don't have to control your thoughts. You just have to stop letting them control you.",
    author: "Dan Millman",
  },
  {
    quote: "Every tomorrow has two handles. We can take hold of it with the handle of anxiety or the handle of faith.",
    author: "Henry Ward Beecher",
  },
  {
    quote: "You don't have to control your thoughts. You just have to stop letting them control you.",
    author: "Dan Millman",
  },
  {
    quote: "You have within you right now, everything you need to deal with whatever the world can throw at you.",
    author: "Brian Tracy",
  },
  {
    quote: "The only way out of the labyrinth of suffering is to forgive.",
    author: "John Green",
  },
  {
    quote: "The greatest glory in living lies not in never falling, but in rising every time we fall.",
    author: "Nelson Mandela",
  },
  {
    quote: "It does not matter how slowly you go as long as you do not stop.",
    author: "Confucius",
  },
  {
    quote: "The secret of getting ahead is getting started.",
    author: "Mark Twain",
  },
  {
    quote: "The only limit to our realization of tomorrow will be our doubts of today.",
    author: "Franklin D. Roosevelt",
  },
  {
    quote: "Believe you can and you're halfway there.",
    author: "Theodore Roosevelt",
  },
  {
    quote: "In the middle of difficulty lies opportunity.",
    author: "Albert Einstein",
  },
  {
    quote: "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    author: "Winston Churchill",
  },
  {
    quote: "The way to get started is to quit talking and begin doing.",
    author: "Walt Disney",
  },
  {
    quote: "The only person you are destined to become is the person you decide to be.",
    author: "Ralph Waldo Emerson",
  },
  {
    quote: "Do not wait for the perfect moment, take the moment and make it perfect.",
    author: "Unknown",
  },
  {
    quote: "The only place where success comes before work is in the dictionary.",
    author: "Vidal Sassoon",
  },
  {
    quote: "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle.",
    author: "Christian D. Larson",
  },
  {
    quote: "You are never too old to set another goal or to dream a new dream.",
    author: "C.S. Lewis",
  },
  {
    quote: "Failure is simply the opportunity to begin again, this time more intelligently.",
    author: "Henry Ford",
  },
  {
    quote: "The only way to do great work is to love what you do.",
    author: "Steve Jobs",
  },
  {
    quote: "The future belongs to those who believe in the beauty of their dreams.",
    author: "Eleanor Roosevelt",
  },
  {
    quote: "Don't watch the clock; do what it does. Keep going.",
    author: "Sam Levenson",
  },
  {
    quote: "Your time is limited, don't waste it living someone else's life.",
    author: "Steve Jobs",
  },
  {
    quote: "Don't be pushed around by the fears in your mind. Be led by the dreams in your heart.",
    author: "Roy T. Bennett",
  },
  {
    quote: "You miss 100% of the shots you don't take.",
    author: "Wayne Gretzky",
  },
  {
    quote: "Hardships often prepare ordinary people for an extraordinary destiny.",
    author: "C.S. Lewis",
  },
  {
    quote: "The only person you should try to be better than is the person you were yesterday.",
    author: "Unknown",
  },
  {
    quote: "I am thankful for my struggle because without it, I wouldn't have stumbled upon my strength.",
    author: "Alex Elle",
  },
  {
    quote: "Start where you are. Use what you have. Do what you can.",
    author: "Arthur Ashe",
  },
  {
    quote: "The greatest mistake you can make in life is to continually be afraid you will make one.",
    author: "Elbert Hubbard",
  },
  {
    quote: "The only time you fail is when you fall down and stay down.",
    author: "Stephen Richards",
  },
  {
    quote: "You are stronger than you know. More capable than you ever dreamed. And you are loved more than you could possibly imagine.",
    author: "Unknown",
  },
  {
    quote: "The past cannot be changed. The future is yet in your power.",
    author: "Unknown",
  },
  {
    quote: "The greatest glory in living lies not in never failing, but in rising every time we fail.",
    author: "Ralph Waldo Emerson",
  },
  {
    quote: "Don't let yesterday take up too much of today.",
    author: "Will Rogers",
  },
  {
    quote: "Life is 10% what happens to us and 90% how we react to it.",
    author: "Charles R. Swindoll",
  },
  {
    quote: "The best way to predict the future is to create it.",
    author: "Peter Drucker",
  },
  {
    quote: "It's not about how hard you hit. It's about how hard you can get hit and keep moving forward.",
    author: "Rocky Balboa (Character from the movie Rocky)",
  },
  {
    quote: "You can't go back and change the beginning, but you can start where you are and change the ending.",
    author: "C.S. Lewis",
  },
  {
    quote:
      "The biggest wall you have to climb is the one you build in your mind: Never let your mind talk you out of your dreams, trick you into giving up. Never let your mind become the greatest obstacle to success. To get your mind on the right track, the rest will follow.",
    author: "Roy T. Bennett",
  },
  {
    quote: "The only limit to our realization of tomorrow will be our doubts of today.",
    author: "Franklin D. Roosevelt",
  },
  {
    quote: "The only way to do great work is to love what you do.",
    author: "Steve Jobs",
  },
  {
    quote: "You don't have to be great to start, but you have to start to be great.",
    author: "Zig Ziglar",
  },
  {
    quote: "If you want to achieve greatness, stop asking for permission.",
    author: "Anonymous",
  },
  {
    quote: "You have to be at your strongest when you're feeling at your weakest.",
    author: "Anonymous",
  },
  {
    quote: "When you feel like quitting, think about why you started.",
    author: "Anonymous",
  },
  {
    quote: "The only person you should try to be better than is the person you were yesterday.",
    author: "Anonymous",
  },
  {
    quote: "Every accomplishment starts with the decision to try.",
    author: "Anonymous",
  },
  {
    quote: "The only way to predict the future is to create it.",
    author: "Peter Drucker",
  },
  {
    quote: "The only limit to our realization of tomorrow will be our doubts of today.",
    author: "Franklin D. Roosevelt",
  },
  {
    quote: "The best way to predict the future is to create it.",
    author: "Peter Drucker",
  },
  {
    quote: "It's not about how hard you hit. It's about how hard you can get hit and keep moving forward.",
    author: "Rocky Balboa (Character from the movie Rocky)",
  },
  {
    quote: "You can't go back and change the beginning, but you can start where you are and change the ending.",
    author: "C.S. Lewis",
  },
  {
    quote:
      "The biggest wall you have to climb is the one you build in your mind: Never let your mind talk you out of your dreams, trick you into giving up. Never let your mind become the greatest obstacle to success. To get your mind on the right track, the rest will follow.",
    author: "Roy T. Bennett",
  },
  {
    quote: "The only limit to our realization of tomorrow will be our doubts of today.",
    author: "Franklin D. Roosevelt",
  },
  {
    quote: "The only way to do great work is to love what you do.",
    author: "Steve Jobs",
  },
  {
    quote: "You don't have to be great to start, but you have to start to be great.",
    author: "Zig Ziglar",
  },
  {
    quote: "If you want to achieve greatness, stop asking for permission.",
    author: "Anonymous",
  },
  {
    quote: "You have to be at your strongest when you're feeling at your weakest.",
    author: "Anonymous",
  },
  {
    quote: "When you feel like quitting, think about why you started.",
    author: "Anonymous",
  },
  {
    quote: "The only person you should try to be better than is the person you were yesterday.",
    author: "Anonymous",
  },
  {
    quote: "Every accomplishment starts with the decision to try.",
    author: "Anonymous",
  },
];

let index = 0;
const quoteElement = document.getElementById("quote");
const authorElement = document.getElementById("author");

function displayQuote() {
  const quote = quotes[index];
  fadeOut(quoteElement);
  fadeOut(authorElement);
  setTimeout(() => {
    quoteElement.textContent = quote.quote;
    authorElement.textContent = "- " + quote.author;
    fadeIn(quoteElement);
    fadeIn(authorElement);
  }, 500); // Delay setelah fadeOut selesai
  index = (index + 1) % quotes.length;
}

function fadeIn(element) {
  element.style.opacity = 1;
}

function fadeOut(element) {
  element.style.opacity = 0;
}

displayQuote();
setInterval(displayQuote, 5000);
