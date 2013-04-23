// NOTE: This currently only works in text mode.

// NOTE: Labels can be expanded here. I imagine labels might have more intermediate phases like PENDING or WAITING.
// I've included spaces in the labels in case you want to use other delimeters without changing the code
var labels = ['TODO ', 'DONE '];

var labelsRegex = new RegExp('^(' + labels.join('|') + ')');

$(document).bind('keydown', function(event) {
    // Bail if not in text mode
    if($('.textMode').length == 0) {
	return -1;
    }
    var theKey = event.which;
    // Since this will run on every keydown, I'm doing my best to make sure this is as performant as possible by excluding as many cases as I can outright
    // Is the shift key held down?
    if(event.shiftKey && !event.ctrlKey) {
	// Is this an arrow key?
        if(theKey === 37 || theKey === 39) {
	    var currentElement = $('div.active .concord-cursor > div > div');
	    var currentText = currentElement.text();
	    
	    //Check which we're changing, priorities or labels
	    if(theKey === 37 || theKey === 39) {
		//Labels stuff
		// Is there no label at all?
		if(!labelsRegex.test(currentText)) {
		    if(theKey === 37) {
			currentElement.text(labels[labels.length - 1] + currentText);
		    } else {
			currentElement.text(labels[0] + currentText);
		    }
		} else {
		    //Find the label and increment/decrement
		    var parsedLabel = labelsRegex.exec(currentText)[0];
		    var currentLabelIndex = labels.indexOf(parsedLabel);
		    if(theKey === 37) {
			//Left Arrow
			if(currentLabelIndex - 1 < 0) {
			    currentElement.text(currentText.replace(labelsRegex, ''));
			} else {
			    currentElement.text(currentText.replace(labelsRegex, labels[currentLabelIndex - 1]));
			}
		    } else {
			// Right Arrow
			if(currentLabelIndex + 1 >= labels.length) {
			    currentElement.text(currentText.replace(labelsRegex, ''));
			} else {
			    currentElement.text(currentText.replace(labelsRegex, labels[currentLabelIndex + 1]));
			}
		    }
		}
	    }
        } 
    }
});
