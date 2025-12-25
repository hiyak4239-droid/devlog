// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Turboのページ遷移時にシンタックスハイライトを適用
document.addEventListener('turbo:load', () => {
  if (typeof hljs !== 'undefined') {
    hljs.highlightAll();
  }
});

document.addEventListener('turbo:render', () => {
  if (typeof hljs !== 'undefined') {
    hljs.highlightAll();
  }
});
