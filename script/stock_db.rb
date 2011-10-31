# Place the initial vocabulary in the database.

INITIAL_DATA = {
	:VirusType => [
		{:name=> 'A(H1N1)'},
		{:name=> 'A(H1N1pdm)'},
		{:name=> 'A(H3N2)'},
	],
	
	:Country => [
		{:name=> 'Argentina'},
		{:name=> 'Brazil'},
		{:name=> 'Chile'},
		{:name=> 'Colombia'},
		{:name=> 'Peru'},
		{:name=> 'Uruguay'},
	],
	
	:Season => [
		{:year=> 2012},
		{:year=> 2011},
		{:year=> 2010},
		{:year=> 2009},
		{:year=> 2008},
	],
	
	:Gene => [
		{:name=> 'HA'},
		{:name=> 'NA'},
		{:name=> 'M'},
	],
	
	:Resistance => [
		{:name=> 'Amantadine'},
		{:name=> 'Oseltamivir'},
		{:name=> 'Oseltamivir (MUNANA)'},
		{:name=> 'Oseltamivir (NA Star)'},
		{:name=> 'Rimantidine'},
		{:name=> 'Zanamivir'},
		{:name=> 'Zanamivir (MUNANA)'},
		{:name=> 'Zanamivir (NA Star)'},
	],
}


## LOAD DB

INITIAL_DATA.each_pair { |k, values|
	kls = Kernel.const_get(k.to_s())
	pp kls
	values.each { |v|
		obj = kls.new(v)
		pp obj
		obj.save()
	}
}


