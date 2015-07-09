$(document).ready(function(){	
	//this function sends dynamically generated data from main to modal(data-product-name, data-product-id). Used to provide deleting from modal
	$("a[id=delete-product]").click(function () {
	    var productId = "";
	    var productName = "";

	    if (typeof $(this).data("product-name") !== "undefined") {
	    	productName = $(this).data("product-name");
	    }
	    if (typeof $(this).data("product-id") !== "undefined") {
	    	productId = $(this).data("product-id");
	    }
	    
	    var span = document.getElementById("name-from-main");
	    span.textContent = productName;
	    document.getElementById("dlt-btn").setAttribute("formaction", "product/" + productId + "/remove");
	});
	
	$("a[id=edit-product]").click(function () {
		var productId = $(this).data("product-id");
		var productSerial = $(this).data("product-serial");
		var productName = $(this).data("product-name");
		var productPrice = $(this).data("product-price");
		var productWeight = $(this).data("product-weight");
		var productDimensions = $(this).data("product-dimensions");
		var productMDate = $(this).data("product-mdate");
		var productEDate = $(this).data("product-edate");
		 
		var span = document.getElementById("data-from-main");
	    span.textContent = '"' + productName + '"' + " with serial " + productSerial;
	    
	    document.getElementById("edit-product-serial").value = productSerial;
	    document.getElementById("edit-product-name").value = productName;
	    document.getElementById("edit-product-price").value = productPrice;
	    document.getElementById("edit-product-weight").value = productWeight;
	    document.getElementById("edit-product-dimensions").value = productDimensions;
	    document.getElementById("edit-product-mdate").value = productMDate;
	    document.getElementById("edit-product-edate").value = productEDate;
	    
	    document.getElementById("edit-btn").setAttribute("formaction", "product/" + productId + "/edit");
	});
	
	$("[data-toggle=tooltip]").tooltip();
	
});