/**
 * @license Copyright (c) 2003-2023, CKSource Holding sp. z o.o. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */
$('.form-control-ckeditor').each(function () {
CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	/* Config General */
	config.versionCheck = false;
	config.language = 'vi';
	config.skin = 'moono-lisa';
	config.width = 'auto';
	config.height = 620;

	/* Allow element */
	config.allowedContent = true;

	/* Entities */
	config.entities = false;
	config.entities_latin = false;
	config.entities_greek = false;
	config.basicEntities = false;

	/* Config CSS */
	config.contentsCss = [CONFIG_BASE + ADMIN + '/ckeditor2/contents.css'];

	config.extraPlugins = 'texttransform,copyformatting,html5video,html5audio,youtube,wordcount,tableresize,widget,lineutils,clipboard,dialog,dialogui,widgetselection,lineheight,video,videodetector';
	/* Config Lineheight */
	config.line_height = '1;1.1;1.2;1.3;1.4;1.5;2;2.5;3;3.5;4;4.5;5';

	/* Config Word */
	config.pasteFromWordRemoveFontStyles = false;
	config.pasteFromWordRemoveStyles = false;

	/* Config ELFinder */
	config.filebrowserBrowseUrl = 'elfinder2/index.php';
	config.toolbar = [
			{ name: 'document', items: ['Source', '-', 'NewPage', 'Preview', 'Print', '-', 'Templates'] },
			{ name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', 'PasteFromExcel', '-', 'Undo', 'Redo'] },
			{ name: 'editing', items: ['Find', 'Replace', '-', 'SelectAll', '-', 'Scayt'] },
			{ name: 'forms', items: ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'] },
			'/',
			{ name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat'] },
			{ name: 'texttransform', items: ['TransformTextToUppercase', 'TransformTextToLowercase', 'TransformTextCapitalize', 'TransformTextSwitcher'] },
			{ name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language'] },
			{ name: 'links', items: ['Link', 'Unlink', 'Anchor'] },
			{ name: 'insert', items: ['Image', 'Flash', 'Youtube', 'VideoDetector', 'Html5video', 'Video', 'Html5audio', 'Iframe', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak'] },
			'/',
			{ name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize', 'lineheight'] },
			{ name: 'colors', items: ['TextColor', 'BGColor'] },
			{ name: 'tools', items: ['Maximize', 'ShowBlocks'] },
			{ name: 'about', items: ['About'] }
		];

	/* Config StylesSet */
	config.stylesSet = [
		{ name: 'Font Seguoe Regular', element: 'span', attributes: { 'class': 'segui' } },
		{ name: 'Font Seguoe Semibold', element: 'span', attributes: { 'class': 'seguisb' } },
		{ name: 'Italic title', element: 'span', styles: { 'font-style': 'italic' } },
		{ name: 'Special Container', element: 'div', styles: { 'background': '#eee', 'border': '1px solid #ccc', 'padding': '5px 10px' } },
		{ name: 'Big', element: 'big' },
		{ name: 'Small', element: 'small' },
		{ name: 'Inline ', element: 'q' },
		{ name: 'marker', element: 'span', attributes: { 'class': 'marker' } }
	];
	/* Config Wordcount */
	config.wordcount = {
				showParagraphs: true,
				showWordCount: true,
				showCharCount: true,
				countSpacesAsChars: false,
				countHTML: false,
				filter: new CKEDITOR.htmlParser.filter({
					elements: {
						div: function (element) {
							if (element.attributes.class == 'mediaembed') {
								return false;
							}
						}
					}
				})
			};
};
});

