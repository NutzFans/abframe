/**
 * 初始化富文本编辑器的方法，创建一个Fckeditor
 */
RichTextEditor.prototype.init = function(){
	var ID=this.id+"_textarea";
	this.container = $id(this.id + "_container");
	if(/[1-9]{0,1}[0-9](\\.[0-9])?%/.test(this.width)){
		this.width='100%';
	}else{
		if(isNaN(parseInt(this.width))){
			this.width = "100%";
		}
	}
	if(isNaN(parseInt(this.height))){
		this.height = 200;
	}
	var editor2 = CKEDITOR.instances[ID];
	if(editor2) {
		editor2.destroy(true);
		CKEDITOR.remove(editor2);
	}
	CKEDITOR.replace(ID,
    {
          width:this.width, 
          height:this.height,
          toolbar:this.toolbarSet
     });
	 eval("this.richEditor =  CKEDITOR.instances."+ID);
	 var value = this.container.innerText;
	 this.richEditor.setData(value);
} 