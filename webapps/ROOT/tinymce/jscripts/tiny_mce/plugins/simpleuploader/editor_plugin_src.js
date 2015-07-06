(function(tinymce) {
	tinymce.create('tinymce.plugins.SimpleUploaderPlugin', {
		init : function(ed, url) {
			// Register commands
			ed.addCommand('mceSimpleUploader', function() {
				ed.windowManager.open({
					file : url + '/simpleuploader.jsp',
					width : 400 + parseInt(ed.getLang('simpleuploader.delta_width', 0)),
					height : 100 + parseInt(ed.getLang('simpleuploader.delta_height', 0)),
					inline : 1
				}, {
					plugin_url : url
				});
			});

			// Register buttons
			ed.addButton('simpleuploader', {
				title:"Upload de Imagem",
				cmd:"mceSimpleUploader",
				image : url + '/img/insertimage.gif',
				icons : false
			});
		},

		getInfo : function() {
			return {
				longname:"SimpleUploader",
				author:"Willian Bispo - Relato Consultorias",
				authorurl:"http://www.relato.com.br",
				infourl:"",
				version:a.majorVersion+"."+a.minorVersion
			};
		}
	});

	// Register plugin
	tinymce.PluginManager.add('simpleuploader', tinymce.plugins.SimpleUploaderPlugin);
})(tinymce);