package com.yoojung0318.Dailygram.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PostController {

	//메인화면
	@GetMapping("/post/timeLine/view")
	public String timeLineView(){
		return "post/timeLine";
		}
	
	
	
	}
