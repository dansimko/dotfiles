eqs = {
    {
        matches = {
            { "api.bluez5.address", "equals", "70:26:05:3C:0E:5C" },
            { "api.bluez5.profile", "equals", "a2dp-sink" }
        },
	config = {
	    preamp = -6.2,
	    bands = {
		{
		    type = "bq_lowshelf",
		    freq = 20.0,
		    q    = 0.61,
		    gain = 3.1,
		},
		{
		    type = "bq_lowshelf",
		    freq = 70.0,
		    q    = 0.7,
		    gain = 1.9,
		},
		{
		    type = "bq_highshelf",
		    freq = 14717.0,
		    q    = 0.59,
		    gain = -1.2,
		},
		{
		    type = "bq_peaking",
		    freq = 188.0,
		    q    = 0.92,
		    gain = -4.1,
		},
		{
		    type = "bq_peaking",
		    freq = 1630.0,
		    q    = 0.49,
		    gain = 8.8,
		},
		{
		    type = "bq_peaking",
		    freq = 8807.0,
		    q    = 0.83,
		    gain = 6.5,
		},
		{
		    type = "bq_peaking",
		    freq = 5648.0,
		    q    = 1.21,
		    gain = -12.8,
		},
		{
		    type = "bq_peaking",
		    freq = 1517.0,
		    q    = 1.09,
		    gain = -12.2,
		},
		{
		    type = "bq_peaking",
		    freq = 6559.0,
		    q    = 3.52,
		    gain = 5.5,
		},
		{
		    type = "bq_peaking",
		    freq = 71.0,
		    q    = 1.72,
		    gain = 1.6,
		},
		{
		    type = "bq_peaking",
		    freq = 967.0,
		    q    = 1.73,
		    gain = 5.9,
		},
	    }
	}
    },
    {
        matches = {
            { "api.bluez5.address", "in-list", "33:01:00:00:00:BA", "00:33:01:00:05:A2" },
            { "api.bluez5.profile", "equals", "a2dp-sink" }
        },
	config = {
	    preamp = -3,
	    bands = {
		{
		    type = "bq_lowshelf",
		    freq = 105.0,
		    q    = 0.7,
		    gain = 3,
		},
	    }
	}
    },
    {
        matches = {
            { "api.bluez5.address", "in-list", "66:A0:1C:00:D1:5E", "00:13:EF:A0:05:D7" },
            { "api.bluez5.profile", "equals", "a2dp-sink" }
        },
	config = {
	    preamp = -6.7,
	    bands = {
		{
		    type = "bq_lowshelf",
		    freq = 107.0,
		    q    = 0.7,
		    gain = 2.4,
		},
		{
		    type = "bq_lowshelf",
		    freq = 669.0,
		    q    = 0.54,
		    gain = -1.7,
		},
		{
		    type = "bq_highshelf",
		    freq = 12060.0,
		    q    = 0.7,
		    gain = 6.8,
		},
		{
		    type = "bq_peaking",
		    freq = 3233.0,
		    q    = 2.13,
		    gain = 5.2,
		},
		{
		    type = "bq_peaking",
		    freq = 205.0,
		    q    = 0.4,
		    gain = -4.0,
		},
		{
		    type = "bq_peaking",
		    freq = 65.0,
		    q    = 0.47,
		    gain = 2.6,
		},
		{
		    type = "bq_peaking",
		    freq = 9973.0,
		    q    = 0.89,
		    gain = -4.4,
		},
		{
		    type = "bq_peaking",
		    freq = 804.0,
		    q    = 0.5,
		    gain = 2.3,
		},
		{
		    type = "bq_peaking",
		    freq = 4199.0,
		    q    = 3.35,
		    gain = 4.0,
		},
		{
		    type = "bq_peaking",
		    freq = 6240.0,
		    q    = 3.96,
		    gain = 3.8,
		},
		{
		    type = "bq_peaking",
		    freq = 12327.0,
		    q    = 5.81,
		    gain = 3.1,
		},
	    }
	}
    }
}

load_script("sink-eq.lua", eqs)

-- load_script("sink-eq-wh1000xm2.lua", nil)
-- load_script("sink-eq-t3.lua", nil)
