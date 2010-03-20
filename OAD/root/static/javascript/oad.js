

// in the table:
// <div unselectable="on" class="x-grid3-cell-inner x-grid3-col-1">Agim Ramadani</div>

// the name of the street in the dialog 
///<label id="ext-gen191" for="street" style="width: 100px;" class="x-form-item-label">Street:</label>
//<textarea name="street" id="street" autocomplete="off" style="width: 243px; height: 38px;" class=" x-form-textarea x-form-field " title="">

// e is Ext.EventObject
// 
function handleclick (e , t)
{
    alert("clik" + t.name + " val "+ t.value);

//    var geonames_element = window.frames['geonames'].document.body;
//Ext.get('center-iframe').dom.src = 'index.html';
}


function executeOnLoad(e) 
{
               /* do some stuff */
    var addresses_element = window.frames['addresses'].document.body;
    alert("loaded iframe");
//    var addresses_element = window.frames['addresses'].document.body;
//('Ext Core successfully injected');
//    Ext.get(addresses_element).select('.x-form-item-label').on('click',  handleclick, this  );//update('Ext Core successfully injected');
//x-form-textarea
//    Ext.get(addresses_element).select('.x-form-field').on('click',  handleclick, this  );//update('Ext Core successfully injected');
//    Ext.get(window.frames['addresses'].document.body).select('.x-form-textarea').on('click',  handleclick  );
//    Ext.get(addresses_element).select('.x-form-textarea').on('click',  handleclick , this );
Ext.get(addresses_element).select('.xgrid3-c-ell-inner').on('click',  handleclick  , this);
//Ext.get(addresses_element).select('.x-grid3-col-1').on('click',  handleclick  , this);
//Ext.get(addresses_element).select('.x-grid3-col-2').on('click',  handleclick  , this);
//Ext.get(addresses_element).select('.x-grid3-col-3').on('click',  handleclick  , this);
//Ext.get(addresses_element).select('.grid3').on('click',  handleclick  , this);
//Ext.get(addresses_element).select('.x-grid3-col').on('click',  handleclick , this );
//Ext.get(addresses_element).select('.x-grid3-cell').on('click',  handleclick  , this);
//Ext.get(addresses_element).select('.x-grid3-td-1').on('click',  handleclick , this );

            }

function executeOnLoadWait(e) 
{
    setTimeout(function() {executeOnLoad();}, 300);
}


Ext.onReady(function() {
//    Ext.DomHelper.append(document.body, {tag: 'label', cls: 'x-form-item-label'});
//    alert("Hello");
//    var a = new Element('a', { 'class': 'foo', href: '/foo.html' }).update("Next page");
//    .x-form-item 
//    label.x-form-item-label 
//    var addresses_element = window.frames['addresses'].document.body;
//    var geonames_element = window.frames['geonames'].document.body;

//    Ext.select('.label.x-form-item-label',addresses_element).on('click', function() {alert("clik")   });
// Ext.select('#response_table')
//grid.Ext.grid.EditorGridPanel.listeners.cellclick
//Ext.on(WINDOW, "load", fireDocReady);
    //    Ext.EventManager.on(window.frames['addresses'].document, 'load', executeOnLoad, this);
//        Ext.EventManager.on(window.frames['addresses'].getElement(), 'load', executeOnLoad, this);
   // create hidden target iframe
//        var id = Ext.id();
        var frame = document.createElement('iframe');
        frame.id = "iframe-addr";
        frame.name = "addresses";
        frame.height = 1000;
        frame.width = 1000;
        frame.src="/autocrud/OAD/addresses";
//        frame.className = 'x-hidden';
  //      if(Ext.isIE) {
//            frame.src = Ext.SSL_SECURE_URL;
//        }
        document.body.appendChild(frame);
    Ext.EventManager.on(frame, 'load', executeOnLoadWait, this);
//    Ext.EventManager.on(frame, 'readystatechange',executeOnLoad, this);

//    Ext.EventManager.on(frame, 'ready', executeOnLoad, this);

//        if(Ext.isIE) {
//            document.frames[id].name = id;
//      }



//td class="x-grid3-col x-grid3-cell x-grid3-td-1 " style="width:103px;" tabindex="0"><div class="x-grid3-cell-inner x-grid3-col-1" unselectable="on">Agim Ramadani</div></td>

//    Ext.select('.x-form-item-label',addresses_element).on('click', function() {alert("clik")   });//update('Ext Core successfully injected');
//    Ext.get(addresses_element).select('.x-panel-body').on('click', function() {alert("clik")   });//.update('Ext Core successfully injected');
});

//    alert("Loaded");