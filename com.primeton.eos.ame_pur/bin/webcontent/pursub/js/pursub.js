	
	function changeMon(e){
		var prodmon= nui.get("prodmon").getValue();
		var servmon= nui.get("servmon").getValue();
		var contsum = parseFloat(prodmon)+ parseFloat(servmon);
		nui.get("contsum").setValue(contsum);
	}
	
	//“签署单位”、“最终用户”、“接收人所在单位”点击选择时的方法
    function onButtonEdit(e) {
        var btnEdit = this;	
        var lookupUrl="/contract/contract/MisCustinfo_lookup.jsp";
    	nui.open({
			url:paths+lookupUrl,
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.id);
		                btnEdit.setText(data.text);
		                nui.get("custname").setValue(data.text);
					}
				}
			}
		});
	}
    
    function onCloseClick(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
    }
    
    function setToText(){
		var fields = formPurSubCont.getFields();                
        for (var i = 0, l = fields.length; i < l; i++) {
            var c = fields[i];
            if (c.setReadOnly) c.setReadOnly(true);     //只读
            if (c.addCls) c.addCls("asLabel");          //增加asLabel外观
        }
	
	}
    
  //选择项目
	function selectProject(){
		var btnEdit = this;
		var custname = nui.get("custid").getText();
        nui.open({
            url:paths+"/ame_common/SelectProject.jsp?custname="+custname,
            title: "选择项目",
            width: 850,
            height: 420,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                        btnEdit.setValue(data.projectno);
                        btnEdit.setText(data.projectno);
                    }
				}
			}
        });
	}
    
    /**
     *验证
     */
    function onOkCheck(){
    	var filePaths = document.getElementsByName("uploadfile1").length;
     	for(var j = 0;j < filePaths;j++){
     		var a = document.getElementsByName("remarkList1")[j].value;
     		if(a == null || a == ""){
     			nui.alert("新增附件不可以为空");
     			return false;
     		}
     	}
        return true;
    }
    
	 var editor2 = null;
	 KindEditor.ready(function(K) {
			editor2 = K.create('textarea[name="content2"]', {
			cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			cssData: '* {font: 12px;line-height:13px}',
			items : [  
			    'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',  
			    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',  
			    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',  
			    'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',  
			    'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',  
			    'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',  
			    'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',  
			    'anchor', 'link', 'unlink', '|', 'about'  
			] ,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	}); 
    
	//关闭
	function onCancel(){
		CloseWindow("cancel");
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}