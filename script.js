const questions = [
    {
        question: "What's my full name?",
        answers: [
            { text:"Sulochana Pandey" , correct:false},
            { text:"Sulochana Poudel" , correct:true},
            { text:"Sulo Poudel" , correct:false},
            { text:"Sujana Poudel" , correct:false},   
        ]
    },
    {
        question: "In which city was Sulo born?",
        answers: [
            { text:"Kathmandu" , correct:false},
            { text:"Chitwan" , correct:false},
            { text:"Pokhara" , correct:true},
            { text:"Bardiya" , correct:false},   
        ]
    },
    {
        question: "Which is Sulo's preferred way to relax?",
        answers: [
            { text:"SLeeping and listening music" , correct:true},
            { text:"Walking" , correct:false},
            { text:"Playing games" , correct:false},
            { text:"Listening Music" , correct:false},   
        ]
    },
    {
        question: "What is Sulo's dream travel destination?",
        answers: [
            { text:"Paris, France" , correct:false},
            { text:"New York City, USA" , correct:true},
            { text:"Tokyo, Japan" , correct:false},
            { text:"Ohio, USA" , correct:false},   
        ]
    },
    {
        question: "What is Sulo's favorite color?",
        answers: [
            { text: "Blue", correct: false },
            { text: "Pink", correct: false },
            { text: "Black", correct: true },
            { text: "Yellow", correct: false },
        ]
    },
    {
        question: "Which is not Sulo's preferred mode of transportation?",
        answers: [            
            { text: "Car", correct: false },
            { text: "Bicycle", correct: false },
            { text: "Walking", correct: false },
            { text: "Public transportation", correct: true },
        ]
    },
    {
        question: "What is Sulo's favorite movie genre?",
        answers: [
            { text: "Action", correct: false },
            { text: "Comedy", correct: true },
            { text: "Drama", correct: false },
            { text: "Sci-Fi", correct: false },
        ]
    },
];


const questionElement = document.getElementById("question");
const answerButtons = document.getElementById("answer-buttons");
const nextButton = document.getElementById("next-btn");
const rangeInput = document.getElementById("range-score");
var width = 10;

let currentQuestionIndex = 0;
let score = 0;

function startQuiz(){
    currentQuestionIndex = 0;
    score = 0;
    nextButton.innerHTML = "Next";
    ShowQuestion();

    width = 0;
    next.style.width = width + "%";
    next.innerHTML = width + "%";
    rangeInput.value = 0

}

function ShowQuestion(){
    resetState();
    let currentQuestion = questions[currentQuestionIndex];
    let questionNo = currentQuestionIndex + 1;
    questionElement.innerHTML = questionNo + ". " + currentQuestion.question;
    

    currentQuestion.answers.forEach(answer => {
        const button = document.createElement("button");
        button.innerHTML = answer.text;
        button.classList.add("btn-1");
        answerButtons.appendChild(button);
        if(answer.correct){
            button.dataset.correct = answer.correct;
        }
        button.addEventListener("click", selectAnswer);
    });
   

}

function resetState(){
    nextButton.style.display = "none";
    while(answerButtons.firstChild){
        answerButtons.removeChild(answerButtons.firstChild);
    }
}






function selectAnswer(e){
const selected = e.target;
selected.classList.add("choosed");
const isCorrect = selected.dataset.correct === "true";
const showAnswerButton = document.getElementById("s-a");

function showAnswer() {
    const correctAnswerIndex = questions[currentQuestionIndex].answers.findIndex(answer => answer.correct);
    const correctAnswerButton = answerButtons.children[correctAnswerIndex]; 
    correctAnswerButton.classList.add("correct");
}

showAnswerButton.addEventListener("click", showAnswer);


if(isCorrect){
    score++;
    document.getElementById("range-score").value = score 
}
else{
    // selected.classList.add("incorrect");
   
}



Array.from(answerButtons.children).forEach(button => {
    // if(button.dataset.correct === "true"){
    //     button.classList.add("correct");
    // }
    button.disabled = true;
 

});

nextButton.style.display = "block";

}






function showScore(){
   
    resetState();
 
    questionElement.innerHTML = `You scored ${score} out of ${questions.length}! `;
    nextButton.innerHTML = "Play again";
    nextButton.style.display = "block"; 

    
    

}

var next = document.getElementById("myBar");
const initialValue = 0;
next.innerHTML = initialValue + "%";
next.style.width = initialValue + "%";

function handleNextButton(){
    width += 100/questions.length;
    if (width > 100) { 
        width = 100;
      }

      next.style.width = width + "%";
      next.innerHTML = Math.round(width);

    currentQuestionIndex++;
    if (currentQuestionIndex < questions.length){
        ShowQuestion();
        
        
    }
    else{
        showScore();
    }  

}

nextButton.addEventListener("click", ()=>{
    if (currentQuestionIndex < questions.length){
        handleNextButton();
    }
    else{
        startQuiz();

    }
});



startQuiz();

