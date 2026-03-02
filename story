<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Safe Story Adventure</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      color: #222;
      text-align: center;
      margin: 0;
      padding: 0;
    }

    #game-container {
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0,0,0,0.2);
    }

    h1 {
      color: #4a90e2;
    }

    .choice-btn {
      display: block;
      margin: 15px auto;
      padding: 12px 25px;
      font-size: 16px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      background-color: #4a90e2;
      color: #fff;
      transition: background-color 0.2s;
    }

    .choice-btn:hover {
      background-color: #357ABD;
    }
  </style>
</head>
<body>
  <div id="game-container">
    <h1>🌟 Adventure Begins 🌟</h1>
    <p id="story-text">You wake up in a mysterious forest. The sun is rising and you hear distant noises. What will you do?</p>
    <div id="choices">
      <button class="choice-btn" onclick="choose('explore')">Explore the forest</button>
      <button class="choice-btn" onclick="choose('stay')">Stay where you are</button>
    </div>
  </div>

  <script>
    // Story nodes
    const story = {
      start: {
        text: "You wake up in a mysterious forest. The sun is rising and you hear distant noises. What will you do?",
        choices: [
          { text: "Explore the forest", next: "explore" },
          { text: "Stay where you are", next: "stay" }
        ]
      },
      explore: {
        text: "You wander deeper into the forest and find a sparkling river. Do you drink from it or follow it?",
        choices: [
          { text: "Drink the water", next: "drink" },
          { text: "Follow the river", next: "follow" }
        ]
      },
      stay: {
        text: "You stay in place and notice a tree with shiny fruits. Do you eat one or climb the tree?",
        choices: [
          { text: "Eat a fruit", next: "eat" },
          { text: "Climb the tree", next: "climb" }
        ]
      },
      drink: {
        text: "The water is refreshing! You feel energized and continue your journey safely. You win! 🎉",
        choices: [
          { text: "Restart Adventure", next: "start" }
        ]
      },
      follow: {
        text: "Following the river, you discover a small village. People welcome you warmly. You win! 🌟",
        choices: [
          { text: "Restart Adventure", next: "start" }
        ]
      },
      eat: {
        text: "The fruit is sweet and delicious. You feel happy and relaxed. You win! 🍎",
        choices: [
          { text: "Restart Adventure", next: "start" }
        ]
      },
      climb: {
        text: "From the treetop, you spot a hidden path leading out of the forest. You safely leave the forest. You win! 🏞️",
        choices: [
          { text: "Restart Adventure", next: "start" }
        ]
      }
    };

    // Function to update story
    function choose(next) {
      const node = story[next];
      const storyText = document.getElementById('story-text');
      const choicesDiv = document.getElementById('choices');

      storyText.textContent = node.text;
      choicesDiv.innerHTML = '';

      node.choices.forEach(choice => {
        const btn = document.createElement('button');
        btn.textContent = choice.text;
        btn.className = 'choice-btn';
        btn.onclick = () => choose(choice.next);
        choicesDiv.appendChild(btn);
      });
    }
  </script>
</body>
</html>
