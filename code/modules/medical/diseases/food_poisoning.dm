/datum/ailment/disease/food_poisoning
	name = "Food Poisoning"
	max_stages = 3
	spread = "Non-Contagious"
	cure = "Sleep"
	associated_reagent = "salmonella"
	reagentcure = list("spaceacillin")
	affected_species = list("Human")
//
/datum/ailment/disease/food_poisoning/stage_act(var/mob/living/affected_mob, var/datum/ailment_data/D, mult)
	if (..())
		return
	switch(D.stage)
		if(1)
			if(probmult(5))
				boutput(affected_mob, SPAN_ALERT("Your stomach feels weird."))
			if(probmult(5))
				boutput(affected_mob, SPAN_ALERT("You feel queasy."))
		if(2)
			if(affected_mob.sleeping && probmult(40))
				boutput(affected_mob, SPAN_NOTICE("You feel better."))
				affected_mob.ailments -= src
				return
			if(probmult(0.1))
				boutput(affected_mob, SPAN_NOTICE("You feel better."))
				affected_mob.ailments -= src
				return
			if(probmult(10))
				affected_mob.emote("groan")
			if(probmult(5))
				boutput(affected_mob, SPAN_ALERT("Your stomach aches."))
			if(probmult(5))
				boutput(affected_mob, SPAN_ALERT("You feel nauseous."))
		if(3)
			if(affected_mob.sleeping && probmult(25))
				boutput(affected_mob, SPAN_NOTICE("You feel better."))
				affected_mob.ailments -= src
				return
			if(prob(0.1))
				boutput(affected_mob, SPAN_NOTICE("You feel better."))
				affected_mob.ailments -= src
			if(probmult(10))
				affected_mob.emote("moan")
			if(probmult(10))
				affected_mob.emote("groan")
			if(probmult(1))
				boutput(affected_mob, SPAN_ALERT("Your stomach hurts."))
			if(probmult(1))
				boutput(affected_mob, SPAN_ALERT("You feel sick."))
			if(probmult(5))
				if (affected_mob.nutrition > 10 && !affected_mob.reagents?.has_reagent("promethazine"))
					for(var/mob/O in viewers(affected_mob, null))
						O.show_message(SPAN_ALERT("[affected_mob] vomits on the floor profusely!"), 1)
					affected_mob.vomit(rand(3,5))
				else
					boutput(affected_mob, SPAN_ALERT("Your stomach lurches painfully!"))
					for(var/mob/O in viewers(affected_mob, null))
						O.show_message(SPAN_ALERT("[affected_mob] gags and retches!"), 1)
					affected_mob.changeStatus("stunned", 2 SECONDS)
					affected_mob.changeStatus("weakened", 2 SECONDS)
