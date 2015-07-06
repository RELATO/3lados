//////////////////////////FUNÇÕES MANIPULAÇÃO DO DOM////////////////////////////////////

/**
Retorna o valor da property 'prop' que é um nó de 'node'
@see get_property_value
*/
function get_node_property(node, prop) {
	var res = null;
	foreach_node(node, function(n) {
		if(n.getAttribute('name') == prop)
			res = n;
	});
	return res == null ? null : get_property_value(res);
}

/**
O valor de uma property pode vir tanto no atributo 'value' quanto no conteúdo da tag
Essa função facilita o acesso ao valor de forma uniforme
*/
function get_property_value(prop) {
	var v = prop.getAttribute("value");
	if(v == null || v.length == 0) {
		if(prop.firstChild == null)
			return "";
		return prop.firstChild.nodeValue;
	}
	return v;
}


function append_xml_property(doc, field_name, field_value) {
	var el = doc.ownerDocument.createElement("property");
	var content = doc.ownerDocument.createTextNode(field_value);
	el.setAttribute("name", field_name);
	el.appendChild(content);
	doc.appendChild(el);	
	return el;
}

function append_xml_obj(doc, type, key) {
	var obj = doc.createElement("message-object");
	if(type != null)
		obj.setAttribute("type", type);
	if(key != null)
		obj.setAttribute("key", key);
	doc.documentElement.appendChild(obj);
	return obj;
}

function foreach_node(doc, func) {
	if(doc.childNodes == null)
		return;
	for(var i = 0; i < doc.childNodes.length; ++i)
		func(doc.childNodes[i]);
}

function foreach_node_name(doc, name, func) {
	foreach_node(doc, function(n) {
		if(n.nodeName == name)
			func(n);
	});
}

function del_childs(node) {
	if(!node || node.childNodes == null)
		return;
	while(node.childNodes.length > 0) {
		node.removeChild(node.firstChild);
	}
}

function set_content(node, text) {
	del_childs(node);
	if(text != null && text != "")
		node.appendChild(document.createTextNode(text));
}
/**
Cria um documento xml para ser utilidado para realizar um request
*/
function create_request(cmd) {
	var doc = XmlDocument.create("request-message");
	doc.documentElement.setAttribute("command", cmd);
	return doc;
}

//////////////////////FUNÇÕES DE TRANSFERENCIA DE XML////////////////////////////////////////

function xmlQuery(query, xml) {
	var xmlHttp = XmlHttp.create();
	xmlHttp.open("POST", query, false);
	xmlHttp.send(xml);
	return xmlHttp.responseXML;
}

////////////////////////FUNÇÕES GENÉRICAS////////////////////////////////////////
function trim(st) {
  if (st == null)
    return "";
  st = new String(st);
  if (! st.length || st.length == 0)
    return "";
  var psi = 0;
  // Procura a primeira ocorrencia de nao espaço
  while (psi < st.length && st.charAt(psi) == ' ')
    psi++;
  // Procura a ultima ocorrencia de nao espaço
  var psf = st.length;
  while (psf > psi && st.charAt(psf-1) == ' ')
    psf--;

  // Retorna string nula
  if (psi >= psf)
    return "";

  // Retorna substring
  return st.substring(psi, psf);
}



////XmlExtras /////////////////
//////////////////
// Helper Stuff //
//////////////////

// used to find the Automation server name
function getDomDocumentPrefix() {
	if (getDomDocumentPrefix.prefix)
		return getDomDocumentPrefix.prefix;
	
	var prefixes = ["MSXML2", "Microsoft", "MSXML", "MSXML3"];
	var o;
	for (var i = 0; i < prefixes.length; i++) {
		try {
			// try to create the objects
			o = new ActiveXObject(prefixes[i] + ".DomDocument");
			return getDomDocumentPrefix.prefix = prefixes[i];
		}
		catch (ex) {};
	}
	
	throw new Error("Could not find an installed XML parser");
}

function getXmlHttpPrefix() {
	if (getXmlHttpPrefix.prefix)
		return getXmlHttpPrefix.prefix;
	
	var prefixes = ["MSXML2", "Microsoft", "MSXML", "MSXML3"];
	var o;
	for (var i = 0; i < prefixes.length; i++) {
		try {
			// try to create the objects
			o = new ActiveXObject(prefixes[i] + ".XmlHttp");
			return getXmlHttpPrefix.prefix = prefixes[i];
		}
		catch (ex) {};
	}
	throw new Error("Could not find an installed XML parser");
}



//////////////////////////
// Start the Real stuff //
//////////////////////////


// XmlHttp factory
function XmlHttp() {}

XmlHttp.create = function () {
	try {
		if (window.XMLHttpRequest) {
			var req = new XMLHttpRequest();
			
			// some versions of Moz do not support the readyState property
			// and the onreadystate event so we patch it!
			if (req.readyState == null) {
				req.readyState = 1;
				req.addEventListener("load", function () {
					req.readyState = 4;
					if (typeof req.onreadystatechange == "function")
						req.onreadystatechange();
				}, false);
			}
			
			return req;
		}
		if (window.ActiveXObject) {
			return new ActiveXObject(getXmlHttpPrefix() + ".XmlHttp");
		}
	}
	catch (ex) {}
	// fell through
	throw new Error("Your browser does not support XmlHttp objects");
};

// XmlDocument factory
function XmlDocument() {}

XmlDocument.create = function (root) {
	try {
		// DOM2
		if (document.implementation && document.implementation.createDocument) {
			var doc;
			doc = document.implementation.createDocument("", root, null);
			
			// some versions of Moz do not support the readyState property
			// and the onreadystate event so we patch it!
			if (doc.readyState == null) {
				doc.readyState = 1;
				doc.addEventListener("load", function () {
					doc.readyState = 4;
					if (typeof doc.onreadystatechange == "function")
						doc.onreadystatechange();
				}, false);
			}
			
			return doc;
		}
		if (window.ActiveXObject) {
			var doc = new ActiveXObject(getDomDocumentPrefix() + ".DomDocument");
			doc.documentElement = doc.createElement(root);
			return doc;
		}
	}
	catch (ex) {}
	throw new Error("Your browser does not support XmlDocument objects");
};

// Create the loadXML method and xml getter for Mozilla
if (window.DOMParser &&
	window.XMLSerializer &&
	window.Node && Node.prototype && Node.prototype.__defineGetter__) {

	// XMLDocument did not extend the Document interface in some versions
	// of Mozilla. Extend both!
	//XMLDocument.prototype.loadXML = 
	Document.prototype.loadXML = function (s) {
		
		// parse the string to a new doc	
		var doc2 = (new DOMParser()).parseFromString(s, "text/xml");
		
		// remove all initial children
		while (this.hasChildNodes())
			this.removeChild(this.lastChild);
			
		// insert and import nodes
		for (var i = 0; i < doc2.childNodes.length; i++) {
			this.appendChild(this.importNode(doc2.childNodes[i], true));
		}
	};
	
	
	/*
	 * xml getter
	 *
	 * This serializes the DOM tree to an XML String
	 *
	 * Usage: var sXml = oNode.xml
	 *
	 */
	// XMLDocument did not extend the Document interface in some versions
	// of Mozilla. Extend both!
	/*
	XMLDocument.prototype.__defineGetter__("xml", function () {
		return (new XMLSerializer()).serializeToString(this);
	});
	*/
	Document.prototype.__defineGetter__("xml", function () {
		return (new XMLSerializer()).serializeToString(this);
	});
}
