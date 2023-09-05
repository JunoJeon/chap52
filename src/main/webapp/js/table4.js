

window.onload = () => {
	
	/** @type {HTMLTableElement} */
	let table = document.querySelector('table');
	
	let hero = new Hero();
	
	table.onclick = () => {
		hero.target.focus();
	}
}

class Hero {
	
	constructor() {
		
		/** @type {HTMLTableDataCellElement} */
		let star = table.rows[10].cells[20];
		star.tabIndex = 1;
		star.style.color = 'yellow';
		star.style.background = 'black';
		star.innerText = '★';
		this.target = star;
		
		this.target.onkeydown = e => this.keydown(e);
	}
	
	/** @param {KeyboardEvent} e */
	keydown(e) {
		console.log(e.key)
		switch(e.key) {
			case "ArrowUp":
				this.up();
				break;
			case "ArrowDown":
				this.down();
				break;
			case "ArrowLeft":
				this.left();
				break;
			case "ArrowRight":
				this.right();
				break;
		}
		
		//e.stopPropagation();
		if (e.key.startsWith("Arrow")) 
			e.preventDefault();
	
	}
	
	up() {
		let hero = this.target;
		let prow = hero.parentElement.previousElementSibling;
			if(prow != null) {
				let hero_up = prow.cells[hero.cellIndex];
				let hero_left = hero.previousElementSibling;
				let hero_up_left = hero_up.previousElementSibling;
				
				let hero_parent = hero.parentElement;
				let hero_up_parent = hero_up.parentElement;
				
				hero.remove();
				hero_up.remove();
					
				if (hero_left == null) {
					
					hero_parent.prepend(hero_up);
					hero_up_parent.prepend(hero);
					
				} else {
					
					hero_left.after(hero_up);
					hero_up_left.after(hero);
				
				}
				
				hero.focus();
			}
	}
	down() {
		let hero = this.target;
		let nrow = hero.parentElement.nextElementSibling;
			if(nrow != null) {
				let hero_down = nrow.cells[hero.cellIndex];
				let hero_left = hero.previousElementSibling;
				let hero_down_left = hero_down.previousElementSibling;
				
				let hero_parent = hero.parentElement;
				let hero_down_parent = hero_down.parentElement;
				
				hero.remove();
				hero_down.remove();
				
				if(hero_left == null){
					
					hero_parent.prepend(hero_down);
					hero_down_parent.prepend(hero);
					
				} else {
					
					hero_left.after(hero_down);
					hero_down_left.after(hero);
				}
				
				hero.focus();
			}
	}
	left() {
		let hero = this.target;
		let hero_left = hero.previousElementSibling;
		
		if (hero_left != null) {
			hero_left.remove();
			hero.after(hero_left);
		}
	}
	right() {
		let hero = this.target;
		let hero_right = hero.nextElementSibling;
		
		if (hero_right != null) {
			hero_right.remove();
			hero.before(hero_right);
		}
	}
}