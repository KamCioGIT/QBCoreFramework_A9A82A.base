QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	unemployed = { label = 'Burger', defaultDuty = false, offDutyPay = false, grades = { ['0'] = { name = 'Freelancer', payment = 10 } } },
	bus = 		 { label = 'Bus', defaultDuty = false, offDutyPay = false, grades = { ['0'] = { name = 'Bestuurder', payment = 50 } } },
	judge = 	 { label = 'Rechtbank', defaultDuty = false, offDutyPay = false, grades = { ['0'] = { name = 'Rechter', payment = 100 } } },
	lawyer = 	 { label = 'Advocatenkantoor', defaultDuty = false, offDutyPay = false, grades = { ['0'] = { name = 'Advocaat', payment = 50 } } },
	gopostal = 	 { label = 'PostNL', defaultDuty = false, offDutyPay = false, grades = { ['0'] = { name = 'Bezorger', payment = 50 } } },
	tow = 		 { label = 'Sleepdienst', defaultDuty = false, offDutyPay = false, grades = { ['0'] = { name = 'Bestuurder', payment = 50 } } },
	garbage = 	 { label = 'Afvalbedrijf', defaultDuty = false, offDutyPay = false, grades = { ['0'] = { name = 'Bestuurder', payment = 50 } } },
	vineyard = 	 { label = 'Wijngaard', defaultDuty = false, offDutyPay = false, grades = { ['0'] = { name = 'Teler', payment = 50 } } },
	hotdog = 	 { label = 'Hotdog', defaultDuty = false, offDutyPay = false, grades = { ['0'] = { name = 'Verkoop', payment = 50 } } },

	police = {
		label = 'Politie',
		type = 'leo',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Aspirant', payment = 50 },
			['1'] = { name = 'Surveillant', payment = 75 },
			['2'] = { name = 'Agent', payment = 100 },
			['3'] = { name = 'Hoofdagent', payment = 125 },
			['4'] = { name = 'Brigadier', payment = 150 },
			['5'] = { name = 'Inspecteur', payment = 175 },
			['6'] = { name = 'Hoofdinspecteur', payment = 200 },
			['7'] = { name = 'Commisaris', payment = 225 },
			['8'] = { name = 'Hoofdcommisaris', payment = 250 },
			['9'] = { name = 'Eerste Hoofdcommisaris', isboss = true, payment = 300 },
		},
	},
	ambulance = {
		label = 'Ambulance',
		type = 'ems',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Rekruut', payment = 50 },
			['1'] = { name = 'Paramedicus', payment = 75 },
			['2'] = { name = 'Dokter', payment = 100 },
			['3'] = { name = 'Chirurg', payment = 125 },
			['4'] = { name = 'Directeur', isboss = true, payment = 150 },
		},
	},
	anwb = {
		label = 'ANWB',
		type = 'anwb',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Rekruut', payment = 50 },
			['1'] = { name = 'gevorderde', payment = 75 },
			['2'] = { name = 'ervaren', payment = 100 },
			['3'] = { name = 'gevorderd', payment = 125 },
			['4'] = { name = 'manager', isboss = true, payment = 150 },
		},
	},
	realestate = {
		label = 'Makelaar',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Rekruut', payment = 50 },
			['1'] = { name = 'Verkoop van huizen', payment = 75 },
			['2'] = { name = 'Zakelijke verkoop', payment = 100 },
			['3'] = { name = 'Makelaar', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	taxi = {
		label = 'Taxi',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Rekruut', payment = 50 },
			['1'] = { name = 'Bestuurder', payment = 75 },
			['2'] = { name = 'Event Bestuurder', payment = 100 },
			['3'] = { name = 'verkoop', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	cardealer = {
		label = 'Autodealer',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Rekruut', payment = 50 },
			['1'] = { name = 'Showroomverkoop', payment = 75 },
			['2'] = { name = 'Zakelijke verkoop', payment = 100 },
			['3'] = { name = 'Financiën', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	['casino'] = {
        label = 'Casino',
        defaultDuty = true,
        grades = {
            ['0'] = { name = 'nieuweling', payment = 50 },
            ['1'] = { name = 'Ervaren', payment = 100 },
            ['2'] = { name = 'Baas', isboss = true, payment = 200 },
        },
    },
	['drivingteacher'] = {
		name  = 'drivingteacher',
		label = 'Rijschool',
			type  = 'driveschool',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'Teorie instructeur',
				payment = 75
			},
			['1'] = {
				name = 'Rij instructeur',
				payment = 100
			},
			['2'] = {
				name = 'Vlieg instructeur',
				payment = 250
			},
			['3'] = {
				name = 'Examen instructeur',
				payment = 300
			},
			['4'] = {
				name = 'Baas',
				isboss = true,
				payment = 350
			},
		},
	},
}


            -- Jobs Creator integration (jobs_creator)
            RegisterNetEvent("jobs_creator:injectJobs", function(jobs)
                QBShared.Jobs = jobs
            end)