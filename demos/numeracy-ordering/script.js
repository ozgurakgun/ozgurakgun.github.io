class NumeracyGame {
    constructor() {
        this.currentNumbers = [];
        this.correctOrder = [];
        this.currentOrderType = '';
        this.settings = {
            digits: 2,
            difficulty: 'basic',
            count: 5,
            order: 'random'
        };
        
        this.initializeElements();
        this.bindEvents();
    }

    initializeElements() {
        // Screens
        this.settingsScreen = document.getElementById('settings-screen');
        this.gameScreen = document.getElementById('game-screen');
        this.resultScreen = document.getElementById('result-screen');

        // Settings elements
        this.digitsSelect = document.getElementById('digits');
        this.difficultySelect = document.getElementById('difficulty');
        this.countSelect = document.getElementById('count');
        this.orderSelect = document.getElementById('order');
        this.playBtn = document.getElementById('play-btn');

        // Game elements
        this.instruction = document.getElementById('instruction');
        this.numbersContainer = document.getElementById('numbers-container');
        this.backBtn = document.getElementById('back-btn');
        this.checkBtn = document.getElementById('check-btn');

        // Result elements
        this.resultMessage = document.getElementById('result-message');
        this.mistakesContainer = document.getElementById('mistakes-container');
        this.mistakesList = document.getElementById('mistakes-list');
        this.tryAgainBtn = document.getElementById('try-again-btn');
        this.newGameBtn = document.getElementById('new-game-btn');
    }

    bindEvents() {
        this.playBtn.addEventListener('click', () => this.startGame());
        this.backBtn.addEventListener('click', () => this.showSettingsScreen());
        this.checkBtn.addEventListener('click', () => this.checkAnswer());
        this.tryAgainBtn.addEventListener('click', () => this.tryAgain());
        this.newGameBtn.addEventListener('click', () => this.showSettingsScreen());
    }

    showSettingsScreen() {
        this.settingsScreen.classList.remove('hidden');
        this.gameScreen.classList.add('hidden');
        this.resultScreen.classList.add('hidden');
    }

    showGameScreen() {
        this.settingsScreen.classList.add('hidden');
        this.gameScreen.classList.remove('hidden');
        this.resultScreen.classList.add('hidden');
    }

    showResultScreen() {
        this.settingsScreen.classList.add('hidden');
        this.gameScreen.classList.add('hidden');
        this.resultScreen.classList.remove('hidden');
    }

    getSettings() {
        this.settings.digits = parseInt(this.digitsSelect.value);
        this.settings.difficulty = this.difficultySelect.value;
        this.settings.count = parseInt(this.countSelect.value);
        this.settings.order = this.orderSelect.value;
    }

    generateNumbers() {
        const { digits, difficulty, count, order } = this.settings;
        const numbers = [];
        
        // Determine the range based on digits
        const min = digits === 1 ? 1 : Math.pow(10, digits - 1);
        const max = Math.pow(10, digits) - 1;

        if (difficulty === 'basic') {
            // Generate random numbers with good spacing
            const used = new Set();
            while (numbers.length < count) {
                const num = Math.floor(Math.random() * (max - min + 1)) + min;
                if (!used.has(num)) {
                    numbers.push(num);
                    used.add(num);
                }
            }
        } else {
            // Spicy mode: generate similar numbers
            const baseNum = Math.floor(Math.random() * (max - min + 1)) + min;
            const baseStr = baseNum.toString();
            numbers.push(baseNum);
            
            // Generate similar numbers by swapping digits
            while (numbers.length < count) {
                let similarNum;
                let attempts = 0;
                
                do {
                    similarNum = this.createSimilarNumber(baseStr, min, max);
                    attempts++;
                } while (numbers.includes(similarNum) && attempts < 50);
                
                if (!numbers.includes(similarNum)) {
                    numbers.push(similarNum);
                } else {
                    // Fallback: generate a random number if we can't create a similar one
                    let randomNum;
                    do {
                        randomNum = Math.floor(Math.random() * (max - min + 1)) + min;
                    } while (numbers.includes(randomNum));
                    numbers.push(randomNum);
                }
            }
        }

        // Determine the order type
        if (order === 'random') {
            this.currentOrderType = Math.random() < 0.5 ? 'ascending' : 'descending';
        } else {
            this.currentOrderType = order;
        }

        // Store the correct order
        this.correctOrder = [...numbers].sort((a, b) => {
            return this.currentOrderType === 'ascending' ? a - b : b - a;
        });

        // Shuffle the numbers for display
        this.currentNumbers = this.shuffleArray([...numbers]);
        
        return this.currentNumbers;
    }

    createSimilarNumber(baseStr, min, max) {
        const digits = baseStr.split('');
        
        // Try different strategies to create similar numbers
        const strategies = [
            () => this.swapAdjacentDigits(digits),
            () => this.swapRandomDigits(digits),
            () => this.changeOneDigit(digits),
            () => this.reverseSubstring(digits)
        ];
        
        const strategy = strategies[Math.floor(Math.random() * strategies.length)];
        const newDigits = strategy();
        const newNum = parseInt(newDigits.join(''));
        
        // Ensure the number is within range
        if (newNum >= min && newNum <= max) {
            return newNum;
        }
        
        // Fallback: just change one digit
        return this.changeOneDigit(digits.slice(), min, max);
    }

    swapAdjacentDigits(digits) {
        const newDigits = digits.slice();
        if (newDigits.length > 1) {
            const i = Math.floor(Math.random() * (newDigits.length - 1));
            [newDigits[i], newDigits[i + 1]] = [newDigits[i + 1], newDigits[i]];
        }
        return newDigits;
    }

    swapRandomDigits(digits) {
        const newDigits = digits.slice();
        if (newDigits.length > 1) {
            const i = Math.floor(Math.random() * newDigits.length);
            let j = Math.floor(Math.random() * newDigits.length);
            while (j === i) {
                j = Math.floor(Math.random() * newDigits.length);
            }
            [newDigits[i], newDigits[j]] = [newDigits[j], newDigits[i]];
        }
        return newDigits;
    }

    changeOneDigit(digits, min, max) {
        const newDigits = digits.slice();
        const i = Math.floor(Math.random() * newDigits.length);
        let newDigit;
        
        do {
            newDigit = Math.floor(Math.random() * 10).toString();
        } while (newDigit === newDigits[i] || (i === 0 && newDigit === '0'));
        
        newDigits[i] = newDigit;
        const newNum = parseInt(newDigits.join(''));
        
        if (min && max && (newNum < min || newNum > max)) {
            return digits.slice(); // Return the original digits array
        }
        
        return newDigits; // Return the modified digits array
    }

    reverseSubstring(digits) {
        const newDigits = digits.slice();
        if (newDigits.length > 2) {
            const start = Math.floor(Math.random() * (newDigits.length - 1));
            const end = start + 2 + Math.floor(Math.random() * (newDigits.length - start - 1));
            const substring = newDigits.slice(start, end);
            newDigits.splice(start, substring.length, ...substring.reverse());
        }
        return newDigits;
    }

    shuffleArray(array) {
        const shuffled = array.slice();
        for (let i = shuffled.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
        }
        return shuffled;
    }

    startGame() {
        this.getSettings();
        this.generateNumbers();
        this.renderNumbers();
        this.updateInstruction();
        this.showGameScreen();
    }

    tryAgain() {
        // Keep the exact same order from the previous attempt
        this.renderNumbers();
        this.showGameScreen();
    }

    updateInstruction() {
        const orderText = this.currentOrderType === 'ascending' 
            ? 'ascending (smallest to biggest)' 
            : 'descending (biggest to smallest)';
        this.instruction.textContent = `Sort in ${orderText} order!`;
    }

    renderNumbers() {
        this.numbersContainer.innerHTML = '';
        
        this.currentNumbers.forEach((number, index) => {
            // Create row container
            const numberRow = document.createElement('div');
            numberRow.className = 'number-row';
            
            // Create move buttons container
            const moveButtons = document.createElement('div');
            moveButtons.className = 'move-buttons';
            
            // Create up button
            const upBtn = document.createElement('button');
            upBtn.className = 'move-btn';
            upBtn.textContent = '↑';
            upBtn.disabled = index === 0; // Disable if first item
            upBtn.addEventListener('click', () => this.moveUp(index));
            
            // Create down button
            const downBtn = document.createElement('button');
            downBtn.className = 'move-btn';
            downBtn.textContent = '↓';
            downBtn.disabled = index === this.currentNumbers.length - 1; // Disable if last item
            downBtn.addEventListener('click', () => this.moveDown(index));
            
            moveButtons.appendChild(upBtn);
            moveButtons.appendChild(downBtn);
            
            // Create number card
            const numberCard = document.createElement('div');
            numberCard.className = 'number-card';
            numberCard.textContent = number;
            numberCard.dataset.number = number;
            numberCard.dataset.index = index;
            
            // Add to row
            numberRow.appendChild(moveButtons);
            numberRow.appendChild(numberCard);
            
            // Add to container
            this.numbersContainer.appendChild(numberRow);
        });
    }

    moveUp(index) {
        if (index <= 0) return; // Can't move up if already at top
        
        // Swap with the item above
        [this.currentNumbers[index], this.currentNumbers[index - 1]] = 
        [this.currentNumbers[index - 1], this.currentNumbers[index]];
        
        // Re-render the numbers
        this.renderNumbers();
    }

    moveDown(index) {
        if (index >= this.currentNumbers.length - 1) return; // Can't move down if already at bottom
        
        // Swap with the item below
        [this.currentNumbers[index], this.currentNumbers[index + 1]] = 
        [this.currentNumbers[index + 1], this.currentNumbers[index]];
        
        // Re-render the numbers
        this.renderNumbers();
    }

    updateCurrentOrder() {
        // Numbers are already in the correct order in this.currentNumbers
        // This method is kept for compatibility but doesn't need to do anything
    }

    checkAnswer() {
        const isCorrect = this.arraysEqual(this.currentNumbers, this.correctOrder);
        
        if (isCorrect) {
            this.showSuccess();
        } else {
            this.showMistakes();
        }
        
        this.showResultScreen();
    }

    arraysEqual(arr1, arr2) {
        if (arr1.length !== arr2.length) return false;
        for (let i = 0; i < arr1.length; i++) {
            if (arr1[i] !== arr2[i]) return false;
        }
        return true;
    }

    showSuccess() {
        this.resultMessage.textContent = '🎉 Well done! Great job!';
        this.resultMessage.className = 'result-message success';
        this.mistakesContainer.classList.add('hidden');
        this.tryAgainBtn.classList.add('hidden');
    }

    showMistakes() {
        const orderText = this.currentOrderType === 'ascending' ? 'ascending' : 'descending';
        this.resultMessage.textContent = `Not quite right! Let's see what needs fixing:`;
        this.resultMessage.className = 'result-message error';
        
        this.mistakesContainer.classList.remove('hidden');
        this.tryAgainBtn.classList.remove('hidden');
        this.mistakesList.innerHTML = '';
        
        // Show the correct order
        const correctOrderDiv = document.createElement('div');
        correctOrderDiv.className = 'mistake-item';
        correctOrderDiv.innerHTML = `
            <strong>Correct ${orderText} order:</strong><br>
            ${this.correctOrder.join(' → ')}
        `;
        this.mistakesList.appendChild(correctOrderDiv);
        
        // Show user's order
        const userOrderDiv = document.createElement('div');
        userOrderDiv.className = 'mistake-item';
        userOrderDiv.innerHTML = `
            <strong>Your order:</strong><br>
            ${this.currentNumbers.join(' → ')}
        `;
        this.mistakesList.appendChild(userOrderDiv);
        
        // Highlight differences
        const differencesDiv = document.createElement('div');
        differencesDiv.className = 'mistake-item';
        let differences = [];
        
        for (let i = 0; i < this.currentNumbers.length; i++) {
            if (this.currentNumbers[i] !== this.correctOrder[i]) {
                differences.push(`Position ${i + 1}: should be ${this.correctOrder[i]}, but you have ${this.currentNumbers[i]}`);
            }
        }
        
        if (differences.length > 0) {
            differencesDiv.innerHTML = `
                <strong>What to fix:</strong><br>
                ${differences.join('<br>')}
            `;
            this.mistakesList.appendChild(differencesDiv);
        }
    }
}

// Initialize the game when the page loads
document.addEventListener('DOMContentLoaded', () => {
    new NumeracyGame();
});
