package com.example.semiproject3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map")
public class MapController {
	
	@GetMapping("/mapList")
	public String map() {
		return "map/mapList";
	}

}
