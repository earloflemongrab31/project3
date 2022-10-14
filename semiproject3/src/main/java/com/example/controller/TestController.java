package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	@ResponseBody
	public String SongMinyoung() {
		return "SongMinyoung";
	}
}
