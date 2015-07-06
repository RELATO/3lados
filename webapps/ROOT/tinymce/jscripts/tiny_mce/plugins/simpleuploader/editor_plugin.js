(
		function(a){
			a.create("tinymce.plugins.SimpleUploaderPlugin",{
				init:function(b,c){
					b.addCommand("mceSimpleUploader",function(){
						b.windowManager.open({
							file:c+"/simpleuploader.jsp",width:400+parseInt(b.getLang("simpleuploader.delta_width",0)),height:100+parseInt(b.getLang("simpleuploader.delta_height",0)),inline:1
						},{
							plugin_url:c
						})
					});b.addButton("simpleuploader",{
						title:"Upload de Imagem",
						cmd:"mceSimpleUploader",
						image : c + '/img/insertimage.gif',
						icons : false
					})
				},getInfo:
					function(){
					return{
						longname:"SimpleUploader",
						author:"Willian Bispo - Relato Consultorias",
						authorurl:"http://www.relato.com.br",
						infourl:"",
						version:a.majorVersion+"."+a.minorVersion}}
			});a.PluginManager.add("simpleuploader",a.plugins.SimpleUploaderPlugin)
		}
)(tinymce);