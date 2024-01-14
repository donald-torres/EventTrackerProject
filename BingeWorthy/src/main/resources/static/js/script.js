console.log('script.js loaded')

window.addEventListener('load', function() {
	console.log('PageLoaded, DOM complete');
	init();
});


function init() {

	loadProgramList();
	loadCategoryList();
	loadPlatformList();





	document.newProForm.addProgramButton.addEventListener('click', function(e) {
		e.preventDefault();
		console.log('adding show ')

		let newShow = {

			name: newProForm.name.value,
			imageUrl: newProForm.imageUrl.value,
			description: newProForm.description.value,
			episodeCount: newProForm.episodeCount.value,
			length: newProForm.length.value,
			totalRuntime: newProForm.totalRuntime.value,
			stillAiring: newProForm.stillAiring.value.toUpperCase(),
			//category: newProForm.categories.value,
			//platforms: newProForm.platforms.value
		}
		if (newShow.stillAiring === "YES" || newShow.stillAiring === "Y") {
			newShow.stillAiring = true;
		} else {
			newShow.stillAiring = false;
		}
		if(newProForm.name.value === "" || newProForm.stillAiring.value === ""){
			alert("You must have a title and state if new program is still airing")
		}else {
			
		addNewProgram(newShow);
		}
	})
}

function loadProgramList() {

	let xhr = new XMLHttpRequest();
	xhr.open('GET', 'api/programs');

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let proList = JSON.parse(xhr.responseText);
				console.log(proList)
				displayPrograms(proList);

			}
		}
	}
	xhr.send();
}
function loadCategoryList() {

	let xhr = new XMLHttpRequest();
	xhr.open('GET', 'api/categories');

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let catList = JSON.parse(xhr.responseText);
				console.log(catList)
				displayCategoryList(catList);

			}
		}
	}
	xhr.send();
}
function loadPlatformList() {

	let xhr = new XMLHttpRequest();
	xhr.open('GET', 'api/platforms');

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let platList = JSON.parse(xhr.responseText);
				console.log(platList)
				displayPlatformList(platList);
			}
		}
	}
	xhr.send();
}

function displayPrograms(proList) {
	let tbody = document.getElementById('programBody');
	for (everyShow of proList) {
		let tr = document.createElement('tr');
		tbody.appendChild(tr);
		let td = document.createElement('td');
		td.textContent = everyShow.id
		tr.appendChild(td);
		td = document.createElement('td');
		td.textContent = everyShow.name
		tr.appendChild(td);
		td = document.createElement('td');
		td.textContent = everyShow.description
		tr.appendChild(td);
		tr.program = everyShow
		tr.addEventListener('click', function(e) {
			// let proId = e.target.parentElement.firstElementChild.textContent;
			let program = e.target.parentElement.program;
			getProgramDetails(program)
		})
	}

}
function displayCategoryList(catList) {
	let dropdown = document.getElementById('cat');
	for (cat of catList) {
		let op = document.createElement('option')
		op.textContent = cat.type;
		op.value = cat.id;
		op.id = cat.id;
		dropdown.appendChild(op);
	}
}
function displayPlatformList(platList) {
	let dropdown = document.getElementById('plat');

	for (plat of platList) {
		let op = document.createElement('option')
		op.textContent = plat.name;
		op.value = plat.name;
		dropdown.appendChild(op);
	}
}
function getProgramDetails(program) {
	console.log(program);
	let oneProDiv = document.getElementById('oneProDiv');
	oneProDiv.textContent = '';

	let h1 = document.createElement('h1');
	h1.textContent = "Program ID: " + program.id + " Title: " + program.name;
	oneProDiv.appendChild(h1);

	let img = document.createElement('img');
	img.src = program.imageUrl;
	img.alt = "No Image"
	oneProDiv.appendChild(img);

	let blockQuote = document.createElement('blockquote');
	blockQuote.textContent = program.description;
	oneProDiv.appendChild(blockQuote)

	let ul = document.createElement('ul');
	oneProDiv.appendChild(ul)

	let li = document.createElement('li');
	li.textContent = "Category: " + program.category.type + " - " + program.category.description;
	ul.appendChild(li);

	li = document.createElement('li');
	li.textContent = "Episode Count: " + program.episodeCount;
	ul.appendChild(li);

	li = document.createElement('li');
	li.textContent = "Episode Length: " + program.length + " minutes";
	ul.appendChild(li)

	li = document.createElement('li');
	if (program.stillAiring) {
		li.textContent = "Still Airing:  Yes";
	} else {
		li.textContent = "Still Airing:  No";
	}
	ul.appendChild(li)

	li = document.createElement('li');
	let hours = program.totalRuntime / 60;
	li.textContent = "Total runtime of series: " + program.totalRuntime + " minutes or " + Math.floor(hours) + " Hours";
	ul.appendChild(li);

	li = document.createElement('li');
	li.textContent = "Streaming Platforms: ";
	ul.appendChild(li);

	if (program.platforms === null || program.platforms.length === 0) {
		let p = document.createElement('p');
		p.textContent = "None";
		li.appendChild(p);

	} else {

		for (title of program.platforms) {
			let p = document.createElement('p');
			p.textContent = title.name;
			li.appendChild(p);
		};
	}
	let btn = document.createElement('button')
	btn.textContent = "Edit " + program.name;
	btn.id = program.id;
	oneProDiv.appendChild(btn);
	btn.addEventListener('click', function(e) {
		e.preventDefault();
		console.log("1" + program);
		editProgram(program);
	})
	let btn2 = document.createElement('button')
	btn2.textContent = "Delete " + program.name;
	btn2.id = program.id;
	oneProDiv.appendChild(btn2);
	btn2.addEventListener('click', function(e) {
		console.log("2" + program);
		e.preventDefault()
		if( confirm("Do want to delete " + program.name + "?")){
		deleteProgram(program.id);
		window.location.reload();;			
		alert('Deleted Program with ID of ' + program.id)
		}
	})
}

function addNewProgram(newShow) {
	let xhr = new XMLHttpRequest();
	xhr.open('POST', 'api/programs');
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			if (xhr.status === 201) {
				let createdShow = JSON.parse(xhr.responseText)
				getProgramDetails(createdShow);
			}
			else {
				displayError('Error')
			}
		}
	}
	xhr.setRequestHeader('Content-type', 'application/JSON')
	let showJSON = JSON.stringify(newShow);
	console.log(newShow);
	xhr.send(showJSON);
}
function editOldProgram(editShow) {
	let xhr = new XMLHttpRequest();
	xhr.open('PUT', 'api/programs/' + editShow.id);
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			if (xhr.status === 201) {
				let editedShow = JSON.parse(xhr.responseText)


				getProgramDetails(editedShow);

			}
			else {
				displayError('Error')
			}
		}
	}
	xhr.setRequestHeader('Content-type', 'application/JSON')
	let showJSON = JSON.stringify(editShow);
	console.log(editShow);
	xhr.send(showJSON);
}
function deleteProgram(programId) {
	let xhr = new XMLHttpRequest();
	xhr.open('DELETE', 'api/programs/' + programId);
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			if (xhr.status === 204) {
				console.log('Delete Successful')
			}
			else {
				displayError('Error')
			}
		}
	}

	xhr.send();
}

function editProgram(program) {
	let edit = document.getElementById('edit')
	edit.type = "button"
	newProForm.addProgramButton.type = "hidden"
	console.log(program);
	newProForm.name.value = program.name;
	newProForm.imageUrl.value = program.imageUrl;
	newProForm.description.value = program.description;
	newProForm.episodeCount.value = program.episodeCount;
	newProForm.length.value = program.length;
	newProForm.totalRuntime.value = program.totalRuntime;
	if (program.stillAiring) {
		newProForm.stillAiring.value = 'yes';
	} else {
		newProForm.stillAiring.value = 'no';
	}
	newProForm.categories.value = program.category.id
	if (program.platforms.length === 0) {
		newProForm.platforms.value = "Netflix";
	} else {
		newProForm.platforms.value = program.platforms[0].name;
	}

	document.newProForm.edit.addEventListener('click', function(e) {
		//e.preventDefault();
		if(confirm("Do you want to edit " + program.name)){
			
		console.log('editing show ')



		let editShow = {
			id: program.id,
			name: newProForm.name.value,
			imageUrl: newProForm.imageUrl.value,
			description: newProForm.description.value,
			episodeCount: newProForm.episodeCount.value,
			length: newProForm.length.value,
			totalRuntime: newProForm.totalRuntime.value,
			stillAiring: newProForm.stillAiring.value.toUpperCase(),
			//category: newProForm.categories.value,
			//platforms: newProForm.platforms.value
		}
		if (editShow.stillAiring === "YES" || editShow.stillAiring === "Y") {
			editShow.stillAiring = true;
		} else {
			editShow.stillAiring = false;
		}
		window.location.reload()
		editOldProgram(editShow);
		}
		alert("Edit complete for " + program.name)		
		console.log('editing show complete ')
	})

}
