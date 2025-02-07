#include "DistanceTable.h"

DistanceTable::DistanceTable() {
    // TODO Auto-generated constructor stub
}

DistanceTable::~DistanceTable() {
    // TODO Auto-generated destructor stub
}

void DistanceTable::insert(int id, int mn, int br, double timestamp, double rssi) {
    // if mn is not in the table, insert it
    if (distance_table.find(mn) == distance_table.end()) {
        distance_table[mn] = distance_table_entry_t();
    }

    // insert in front the new entry to the table at entry mn
    distance_table[mn].push_front({id, br, timestamp, rssi});

    // if the table is too big, remove the last entry
    if (distance_table[mn].size() > TABLE_ENTRY_SIZE) {
        distance_table[mn].pop_back();
    }

    // TODO CHECK MOVING PREVISION --> here
    // TODO PERFORM HANDOVER -- somewhere else
    // here or somewhere else?
}

packet_entry_t DistanceTable::getLatestHighestEntry(int mn){
    distance_table_entry_t entries = getEntries(mn);
    // find the entry with the highest RSSI with the latest timestamp and same id as the first entry
    packet_entry_t highest_entry = entries[0];
    for (int i = 1; i < entries.size(); i++) {
        if (entries[i].rssi > highest_entry.rssi && entries[i].id == highest_entry.id) {
            highest_entry = entries[i];
        }
    }
    return highest_entry;
}

distance_table_entry_t DistanceTable::getEntries(int mn){
    return distance_table.find(mn)->second;
}