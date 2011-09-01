function ThumbnailItemChange(thumbnail) {
	var obj_thumbnailimg = document.getElementById("thumbnailimg")
	if (thumbnail.selectedIndex!=0){
		thumbnailfn = thumbnail.options[thumbnail.selectedIndex].value
		obj_thumbnailimg.src = "../../static/img/demoicon/" + thumbnailfn + ".jpg";
	}
}