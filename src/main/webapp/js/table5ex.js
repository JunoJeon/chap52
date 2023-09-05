

window.onload = function() {

	/** @type {HTMLTableElement} */
	let table = document.querySelector("#table");

	let hero1 = new Hero(5,5);
	let hero2 = new Hero(10,10);
	let hero3 = new Hero(15,15);
	let hero4 = new Hero(19,25);
	let hero5 = new Hero(19,39);
	
	table.onclick = function(e) {
		e.target.focus()
	}	
}

class Hero {
	
	constructor(row, cell) {
		/** @type {HTMLTableDataCellElement} */	
		let target = table.rows[row].cells[cell];
		target.tabIndex = 1;
		target.style.color = 'blue'
		target.style.background = 'white';
		target.innerText = String.fromCharCode('A'.charCodeAt(0)+parseInt(Math.random()*26))
		this.target = target;
		
		this.target.onkeydown = e => this.keydown(e);
		this.target.onclick= e=>this.click(e);
	}
//	constructor() {
//		/** @type {HTMLTableDataCellElement} */	
//		let target = table.rows[parseInt(Math.random()*20)].cells[parseInt(Math.random()*40)];
//		target.tabIndex = 1;
//		target.style.color = 'blue'
//		target.style.background = 'white';
//		target.innerText = String.fromCharCode('A'.charCodeAt(0)+parseInt(Math.random()*26))
//		this.target = target;
//		
//		this.target.onkeydown = e => this.keydown(e);
//		this.target.onclick= e=>this.click(e);
//	}
	/** @param {MouseEvent} e */
	click(e){
		e.stopPropagation();
	}
	
	/** @param {KeyboardEvent} e */
	keydown(e) {
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
		let hero=this.target
		let prow=hero.parentElement.previousElementSibling;
		if(prow!=null){
			let hero_left=hero.previousElementSibling;
			let hero_up=prow.cells[hero.cellIndex]
			let hero_up_left=hero_up.previousElementSibling
			let hero_parent=hero.parentElement
			let hero_up_parent=hero_up.parentElement
			
			hero_up.remove();
			hero.remove();
			if(hero_left==null){
				hero_parent.prepend(hero_up);
				hero_up_parent.prepend(hero);
			}else{
				hero_up_left.after(hero)
				hero_left.after(hero_up)
			}		
			hero.focus();
		}
	}
	down() {
		let hero=this.target
		let nrow=hero.parentElement.nextElementSibling;
		if(nrow!=null){
			let hero_left=hero.previousElementSibling;
			let hero_down=nrow.cells[hero.cellIndex]
			let hero_down_left=hero_down.previousElementSibling
			let hero_parent=hero.parentElement
			let hero_down_parent=hero_down.parentElement
			
			hero_down.remove();
			hero.remove();
			if(hero_left==null){
				hero_parent.prepend(hero_down);
				hero_down_parent.prepend(hero);
			}else{
				hero_down_left.after(hero)
				hero_left.after(hero_down)
			}		
			hero.focus();
		}
	}
	left() {
		let hero = this.target;
		let hero_left = hero.previousElementSibling;
		if (hero_left!=null) {
			hero_left.remove()
			hero.after(hero_left);
		}
	}
	right() {
		let hero = this.target;
		let hero_right = hero.nextElementSibling;
		if (hero_right!=null) {
			hero_right.remove();
			hero.before(hero_right);
		}
	}
	
}





