//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package mobile6tisch.application;
import mobile6tisch.application.IApplication;

simple ReqResClient like IApplication{
    parameters:
        double upPeriod @unit(s) = default(1s);
        double downPeriod @unit(s) = default(1s);
        double upDelay @unit(s) = default(1s);
        double downDelay @unit(s) = default(1s);
        
        string ietf6TiSCH = default("^.ietf6TiSCH");
        string ncCore = default("^.^.nc.ncCore");

        @signal[packetsSent](type=long);
        @statistic[stats_packetsSent](source="packetsSent"; record=count; );
        @signal[packetsReceived](type=long);
        @statistic[stats_packetsReceived](source="packetsReceived"; record=count; );
        @signal[packetsDelay](type=simtime_t);
        @statistic[stats_packetsDelay](source="packetsDelay"; record=vector; );
        
        // new statistics
        @signal[packetsDownstreamDelay](type=simtime_t);
        @statistic[stats_packetsDownstreamDelay](source="packetsDownstreamDelay"; record=vector; );
        
        
    gates:
        input lowerLayerIn;
        output lowerLayerOut;
}
