package com.taffle.controller;

import java.util.Date;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.jdbc.StringUtils;

import com.taffle.pojo.User;
import com.taffle.service.UserService;

@Controller
public class UserController {
	@Resource
	private UserService userService;

	// 跳转到登陆
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@ModelAttribute User user) {
		return "login";
	}

	// 跳转到注册
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String regedit(@ModelAttribute User user) {
		return "regidit";
	}

	// 登录校验
	@RequestMapping(value = "/login", method = RequestMethod.POST)

	public String login(@Valid User user, BindingResult bindingResult, String code, HttpSession session, Model model) {
		if (bindingResult.hasErrors()) {
			return "login";
		}
		model.addAttribute("user",user);
		User result = userService.findUserByIdAndPsw(user.getUserId(), user.getUserPsw());
		if (null == result) {
			model.addAttribute("error", "账户或密码错误");
			return "login";
		}
		String conform = (String) session.getAttribute("yzm");
		if (!conform.equals(code)) {
			model.addAttribute("error", "验证码不正确");
			return "login";
		}
		session.setAttribute("loginer", result);
		if (result.getUserAlice().equals("系统管理员")) {
			session.setAttribute("loginer", result);
			return "server_index";
		}
		session.removeAttribute("billCodes");
		return "redirect:/";
	}

	// 实现注册
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String clientRegist(@Valid User user, BindingResult bindingResult, String ruserPsw, String userAlice,
			String userEmail, Model model) {
		if (bindingResult.hasErrors()) {
			return "regidit";
		}
		if (!user.getUserPsw().equals(ruserPsw)) {
			model.addAttribute("err", "密码和确认密码不同");
			return "regidit";
		}

		User result = userService.findUserById(user.getUserId());
		if (null != result) {
			model.addAttribute("err", "账户已经存在");
			return "regidit";
		}
		user.setUserCreateDate(new Date());
		if (userAlice.equals("系统管理员")) {
			model.addAttribute("err", "昵称非法");
			return "regidit";
		}

		String regEx1 = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		Pattern p = Pattern.compile(regEx1);
		Matcher m = p.matcher(userEmail);
		if (!m.matches()) {
			model.addAttribute("err", "邮箱格式错误");
			return "regidit";
		}
		userService.addNewUser(user);

		return "redirect:/login";

	}

	// 跳转到忘记密码
	@RequestMapping(value = "/client_forget_pswd", method = RequestMethod.GET)
	public String forget(Model model) {
		return "client_forget_pswd";
	}

	// 忘记密码
	@RequestMapping(value = "/client_forget_pswd", method = RequestMethod.POST)
	public String userResetPassword(String userId, String yzm, HttpSession session, Model model) {
		User ue = userService.findUserById(userId);
		if (null == ue) {
			model.addAttribute("error", "账户不存在");
			return "client_forget_pswd";
		}
		if (StringUtils.isNullOrEmpty(userId) || StringUtils.isNullOrEmpty(yzm)) {
			model.addAttribute("error", "账户和验证码都不能为空");
			return "client_forget_pswd";
		}
		Object object = session.getAttribute("yzm");
		if (!yzm.equals(object.toString())) {
			model.addAttribute("error", "验证码输入错误");
			return "client_forget_pswd";
		}
		ue.setUserPsw("000000");
		ue.setUserUpdateDate(new Date());
		userService.updateUserPswById(ue);
		Properties props = new Properties();
		// 什么邮箱就要使用对应的服务器，比如163邮箱服务器，就写“smtp.163.com”）
		props.put("mail.smtp.host", "smtp.163.com");

		props.put("mail.smtp.auth", "true");
		Session emailSession = Session.getDefaultInstance(props);
		// 用session为参数定义消息对象
		MimeMessage message = new MimeMessage(emailSession);

		try {
			// 加载发件人地址
			message.setFrom(new InternetAddress("a256949@163.com"));
			// 加载收件人地址
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(ue.getUserEmail()));
			// 加载标题
			message.setSubject("密码重置");
			// 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件
			Multipart multipart = new MimeMultipart();

			// 设置邮件的文本内容
			BodyPart contentPart = new MimeBodyPart();
			contentPart.setText("重置密码成功！新密码为000000");
			multipart.addBodyPart(contentPart);

			// 将multipart对象放到message中
			message.setContent(multipart);
			// 保存邮件
			message.saveChanges();
			// 发送邮件
			Transport transport = emailSession.getTransport("smtp");
			// 连接服务器的邮箱
			transport.connect("smtp.163.com", "a256949@163.com", "WQHMXCBWOQKTIZVK");
			// 把邮件发送出去
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("error", "密码重置成功，请到邮箱查看");

		return "client_forget_pswd";
	}

	// 客户端登出
	@RequestMapping("/loginer_out")
	public String outToIndex(HttpSession session) {
		// 移出session的loginer
		session.removeAttribute("loginer");

		return "redirect:/";
	}

	// 后台登出
	@RequestMapping("/server_loginer_out")
	public String outToIndex2(HttpSession session) {
		// 移出session的loginer
		session.removeAttribute("loginer");
		return "redirect:/login";
	}
}
