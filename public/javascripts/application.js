// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults 

$(document).ready(function($) {      
	
	$('a[rel*=facybox]').facybox() 
	
    // Binding focus and blur events for query input box
  
	if ($('.search-input').val() == "如:川菜") {
	   $('.search-input').css('color','#666')
	}  
	
    $('.search-input').  
        focus(function() {   
        if (this.value == "如:川菜") {
            this.value = "";
      		this.style.color = "#000"
        }
    }).
        blur(function() {
        if (this.value == "") { 
      		this.style.color = "#666";
            this.value = "如:川菜";
        }
    }); 

	$(".first_row_class").click(function(){         
	   $(this).find('td.collapsible a').click();
	});
}); 

var myTextExtraction = function(node)  
{  
    // extract data from markup and return it  
    return node.innerHTML;  
}

$.tablesorter.addParser({ 
   // set a unique id 
   id: 'price', 
   is: function(s) { 
       // return false so this parser is not auto detected 
       return false; 
   }, 
   format: function(s) { 
       // format your data for normalization 
       return parseInt(s.replace('<span class="rmb">￥</span>',''));
   					        }, 
   					        // set type, either numeric or text 
    type: 'numeric' 
 }); 

 // $(document).ready(function() { 
 //       $(".tablesorter").tablesorter({ headers: {0: {sorter: false},1: {sorter: false} }}); 
 //   } 
 // );         


