<?php
// $Header$
// Copyright (c) 2004 bitweaver Tickets
// All Rights Reserved. See below for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See http://www.gnu.org/copyleft/lesser.html for details.

// Initialization
require_once( '../kernel/setup_inc.php' );

// Is package installed and enabled
$gBitSystem->verifyPackage( 'tickets' );

// Look up the content
require_once( TICKETS_PKG_PATH.'lookup_milestone_inc.php' );

if( !$gContent->isValid() ) {
	$gBitSystem->setHttpStatus( 404 );
	$gBitSystem->fatalError( "The milestones you requested could not be found." );
}

// Now check permissions to access this content 
$gContent->verifyViewPermission();

// Add a hit to the counter
$gContent->addHit();

// Get field definitions for listing tickets.
$ticket = new BitTicket ();
$fieldDefinitions = $ticket->getFieldDefinitions();
$gBitSmarty->assign_by_ref( 'fieldDefinitions' , $fieldDefinitions );

// Display the template
$gBitSystem->display( 'bitpackage:tickets/milestone_display.tpl', tra( 'Tickets' ) , array( 'display_mode' => 'display' ));
?>
