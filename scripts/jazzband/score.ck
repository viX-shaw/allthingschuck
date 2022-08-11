// score.ck

// Start piano
Machine.add(me.dir() + "/piano.ck") => int pianoID;
4.8 :: second => now;

//start drums
me.dir() + "/drums.ck" => string drumsPath;
Machine.add(drumsPath) => int drumsID;
4.8 :: second => now;

//start bass
Machine.add(me.dir() + "/bass.ck") => int bassID;
4.8 :: second => now;

//start flute solo
Machine.add(me.dir() + "/flute.ck") => int fluteID;
4.8 :: second => now;
//remove drums
Machine.remove(drumsID);
4.8 :: second => now;

// add drums back in
Machine.add(drumsPath) => drumsID;


