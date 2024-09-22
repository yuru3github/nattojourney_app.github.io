$('.start').ready(function() {
    $('.start').fadeOut(5000);
});

$('.index .content div').ready(function() {
    var hash = window.location.hash;
    if (hash) {
        $('.index-show').animate({
            scrollTop: $(hash).offset().top()
        }, 1000);
    }
});

$('.side-nav').ready(function() {
    var hash = window.location.hash;
    if (hash) {
        $('.index').animate({
            scrollTop: $(hash).offset().top()
        }, 1000);
    }
});

$('.match').ready(function() {
    var hash = window.location.hash;
    if (hash) {
        $('.index-show').animate({
            scrollTop: $(hash).offset().top()
        }, 1000);
    }
});

let answers = [];
function selectOption(questionNumber, option) {
    answers[questionNumber - 1] = option;
    document.getElementById(`question${questionNumber}`).style.display = 'none';
    if (questionNumber < 4) {
        document.getElementById(`question${questionNumber + 1}`).style.display = 'block';
    } else {
        showResult();
    }
}
function showResult() {
    let resultId = `result_${answers.join('')}`;
    if (resultElement) {
        resultElement.scrollIntoView({ behavior: 'smooth' });
    } else {
        console.error('エラー');
    }
}

$('.match, .card-show').ready(function() {
    $('.anim, .card').fadeIn(3000);
});

$('.nippon area').ready(function() {
    var hash = window.location.hash;
    if (hash) {
        $('.index').animate({
            scrollTop: $(hash).offset().top()
        }, 1000);
    }
});