
#include "maps.hpp"
#include "rtmaps_cmake.hpp"

// Declares a new MAPSComponent child class
class MapsTest: public MAPSComponent 
{
	// Use standard header definition macro
	MAPS_COMPONENT_STANDARD_HEADER_CODE(MapsTest)

private :

};

/*------------------------------------------------------------------------------
** Defines and Macros
*/
// Use the macros to declare the inputs
MAPS_BEGIN_INPUTS_DEFINITION(MapsTest)
MAPS_END_INPUTS_DEFINITION

	// Use the macros to declare the outputs
MAPS_BEGIN_OUTPUTS_DEFINITION(MapsTest)
	//Output image, 16bpp, 1 channel
	//MAPS_OUTPUT("oImage",MAPS::IplImage,NULL,NULL,1)
MAPS_END_OUTPUTS_DEFINITION

// Use the macros to declare the properties
MAPS_BEGIN_PROPERTIES_DEFINITION(MapsTest)
MAPS_END_PROPERTIES_DEFINITION

// Use the macros to declare the actions
MAPS_BEGIN_ACTIONS_DEFINITION(MapsTest)
//MAPS_ACTION("aName",MAPSFCW::ActionName)
MAPS_END_ACTIONS_DEFINITION

// Use the macros to declare this component (FCW) behaviour
MAPS_COMPONENT_DEFINITION(MapsTest,"MapsTest","Tony&AmO",128,MAPS::Threaded,MAPS::Threaded,
-1, // Nb of inputs
-1, // Nb of outputs
-1, // Nb of properties
0) // Nb of actions

/*------------------------------------------------------------------------------
** Functions
*/


void MapsTest::Birth() {

}

void MapsTest::Core() {
	ReportInfo(printRTMAPS_CMAKE());

}


void MapsTest::Death() {
}

