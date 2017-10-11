/**
 * created by: Monydara
 */
Ext.define('App.view.Menu', {
    extend:'Ext.panel.Panel',
    alias:'widget.fmMenu',
	border:true,
  	layout: {
	    // layout-specific configs go here
	    type: 'accordion',
	    titleCollapse: false,
	    animate: true,
	    fill:true,
	     // multi: true,
	    // activeOnTop: true
	},
	defaults:{
		listeners: {
	      afterrender: function(panel) {
	        panel.header.el.on('click', function() {
	          if (panel.collapsed) {panel.expand();}
	          else {panel.collapse();}
	        });
	      }
	    },
	    showSeparator: false,
        floating: false,
        hideHeader: false,
        collapsed: true ,
	},

  	fn:function(field){
  		var controllerName = field.cn ;
  		var viewName = field.vn ;
  		if (controllerName) {
  			// check if form already load
  			App.app.getController('Menu').loadStore( controllerName, viewName+".Index");
  		}

  		if (viewName) {
  			App.app.getController('Menu').showPage(viewName+".Index");

  		};


  	},
   	initComponent:function () {
   		//App.app.getController('admin.User').getMenuList(this);
   		// var menus = [] ;
   		// menus  = [
   		// 	{
   		// 		title:'Sale',
   		// 		xtype:'menu',
	    //         items:[
	    //         	{
     //                 text:'Lead',
     //                 style:'font-weight:bold',
     //                 iconCls:'icon-usermanager',
     //                 vn:'sale.lead',
     //                 cn:'sale.Lead',
     //                 handler:this.fn,

     //              },'-',{
	    //         		text:'Lead Opportunity',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-usermanager',
	    //         		vn:'sale.leadOpportunity',
     //                 cn:'sale.LeadOpportunity',
     //                 handler:this.fn,

	    //         	},'-',{
	    //         		text:'Customer',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-usermanager',
	    //         		vn:'sale.customer',
	    //         		cn:'sale.Customer',
	    //         		handler:this.fn,
	    //         	},'-',{
	    //         		text:'Quotation',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-staff',
	    //         		vn:'sale.quotation',
	    //         		cn:'sale.Quotation',
	    //         		handler:this.fn

	    //         	},'-',{
	    //         		text:'Sale Invoice',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-invoice',
	    //         		vn:'sale.invoice',
	    //         		cn:'sale.Invoice',
	    //         		handler:this.fn

	    //         	},'-',{
	    //         		text:'Customer Payment',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-payment',
	    //         		vn:'sale.customerPayment',
	    //         		cn:'sale.CustomerPayment',
	    //         		handler:this.fn

	    //         	},'-',{
     //                 text:'Sale Representative',
     //                 style:'font-weight:bold',
     //                 iconCls:'icon-staff',
     //                 vn:'sale.saleRepresentative',
     //                 cn:'sale.SaleRepresentative',
     //                 handler:this.fn

     //              },'-',{
	    //         		text:'Contact',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-staff',
	    //         		vn:'sale.contact',
	    //         		cn:'sale.Contact',
	    //         		handler:this.fn

	    //         	},'-'
	    //         ]
   		// 	},
   		// 	{
   		// 		title:'Item',
   		// 		xtype:'menu',
	    //         items:[
	    //         	{
	    //         		text:'Item',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-staff',
	    //         		vn: 'item.item',
	    //         		cn: 'item.Item',
	    //         		handler:this.fn

	    //         	},'-',
	    //         	{
	    //         		text: 'Item Category',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-staff',
	    //         		vn: 'item.itemcategory',
	    //         		cn: 'item.ItemCategory',
	    //         		handler:this.fn
	    //         	},'-',
	    //         	{
	    //         		text: 'UM',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-staff',
	    //         		vn: 'item.um',
	    //         		cn: 'item.UM',
	    //         		handler:this.fn
	    //         	},'-',
	    //         	{
	    //         		text: 'Location',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-staff',
	    //         		vn: 'item.location',
	    //         		cn: 'item.Location',
	    //         		handler:this.fn
	    //         	},'-',
	    //         	{
	    //         		text: 'Adjust Stock',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-staff',
	    //         		vn: 'item.adjuststock',
	    //         		cn: 'item.AdjustStock',
	    //         		handler:this.fn
	    //         	},'-',
	    //         	{
	    //         		text: 'Opening Stock',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-staff',
	    //         		vn: 'item.openingstock',
	    //         		cn: 'item.OpeningStock',
	    //         		handler:this.fn
	    //         	}
	    //         ]
   		// 	}, {
   		// 		title:'Service',
   		// 		xtype:'menu',
	    //         items:[
	    //         	{
	    //         		text:'Maintenance List',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-staff',
	    //         		vn: 'service.maintenance',
	    //         		cn: 'service.Maintenance',
	    //         		handler:this.fn
	    //         	}, '-', {
	    //         		text:'Terminate Maintenance List',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-staff',
	    //         		vn: 'service.terminateMaintenance',
	    //         		cn: 'service.TerminateMaintenance',
	    //         		handler:this.fn
	    //         	}, '-', {
	    //         		text:'Rental List',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-staff',
	    //         		// vn:'maintenance.vender',
	    //         		handler:this.fn
	    //         	}, '-', {
	    //         		text:'Terminate Rental List',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-staff',
	    //         		// vn:'maintenance.vender',
	    //         		handler:this.fn
	    //         	}
	    //         ]
   		// 	}, {
   		// 		title:'Purchase',
   		// 		xtype:'menu',
	    //         items:[
	    //         	{
	    //         		text:'Vener',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-staff',
	    //         		vn:'purchase.vender',
	    //         		handler:this.fn

	    //         	},
	    //         ]
   		// 	},{

   		// 		title:'Set Up',
   		// 		xtype:'menu',
	    //         items:[
	    //         	{
	    //         		text:'Area',
	    //         		iconCls:'icon-setting',
	    //         		style:'font-weight:bold',
	    //         		vn:'setup.area',
	    //         		handler:this.fn

	    //         	},{
     //                 text:'Payment Term',
     //                 iconCls:'icon-setting',
     //                 style:'font-weight:bold',
     //                 vn:'setup.paymentTerm',
     //                 handler:this.fn

     //              },{
	    //         		text:'Code',
	    //         		iconCls:'icon-setting',
	    //         		style:'font-weight:bold',
	    //         		vn:'setup.code',
	    //         		handler:this.fn

	    //         	},{
	    //         		text:'Company Profile',
	    //         		iconCls:'icon-setting',
	    //         		style:'font-weight:bold',
	    //         		vn:'setup.companyProfile',
	    //         		handler:this.fn

	    //         	},,{
	    //         		text:'Position',
	    //         		iconCls:'icon-setting',
	    //         		style:'font-weight:bold',
	    //         		vn:'setup.position',
	    //         		handler:this.fn

	    //         	},
	    //         ]
   		// 	},{

   		// 		title:'Fix Asset',
   		// 		xtype: 'menu',
   		// 		items:[
   		// 			{
   		// 				text:'Trasfer Asset',
   		// 				style:'font-weight:bold',
   		// 				vn:'fixAsset.transferFixAsset',
   		// 				handler:this.fn
   		// 			},'-',
   		// 			{
   		// 				text: 'Depreciation',
   		// 				style: 'font-weight:bold',
   		// 				vn:'fixAsset.depreciation',
   		// 				handler:this.fn
   		// 			},

   		// 		]

   		// 	},
   		// 	{

   		// 		title:'System Administration',
   		// 		xtype:'menu',
   		// 		cls:'my-menu',

	    //         items:[
	    //         	{
	    //         		text:'User & Role',
	    //         		style:'font-weight:bold',
	    //         		iconCls:'icon-setting',
	    //         		handler:this.fn,
	    //         		cn:'admin.User',
     //                 vn:'admin.user'

	    //         	},'-',
	    //         	{
	    //         		text:'Department',
	    //         		iconCls:'icon-department',
	    //         		handler:this.fn,
	    //         		cn:'admin.Department',
     //                 vn:'admin.department'

	    //         	},'-',{
	    //         		text:'Role',
	    //         		iconCls:'icon-setting',
	    //         		cn:'admin.Role',
     //                 vn:'admin.role',
	    //         		handler:this.fn

	    //         	},
	    //         ]
   		// 	}

   		// ]

        // Ext.apply(this, {
        // 	items:menus
        // });
        this.callParent(arguments);
    },
});
