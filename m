Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E0F387585
	for <phone-devel@vger.kernel.org>; Wed,  9 Sep 2026 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945505; cv=none; b=nIOlTltVBiWlLET+Jb3enDdzAbpqGl/Zay+KvJpWDpscCWilgmnq31fmQN3SK6zfNfTNf/LGyd8Ed7Ru5QyXPEQWBacIGiyc3/BB2+6LIvsfDd8S6Fd22fev9fZ5ypBlAX3m0CukANNhOEcCLzrenss0+wK3WVRy2FGGrgArva8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945505; c=relaxed/simple;
	bh=SxRyqWCBHjHzWDAjeyEn+IJRbAXN37BviQxJFqbg22Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C8bV0gRihddx+Y4A+aiAVu4VsIxngLoD2hier6HEuKPt7ZEMzJcLZVmWZPD9Em+O6PzU6v0fcO48mLOzhKtWiRiMylbUOwKJ3Z4zOPgY55WGq4pP2TZgOJKtmAHatbDty2Eqd/6YfqyvsZGvljR25HTGPx3Lo1MrEDroGNrmHMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqg5tL40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWbIXbSZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqg5tL40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eWbIXbSZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896PEiU1274625
	for <phone-devel@vger.kernel.org>; Wed, 9 Sep 2026 09:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tTCnaPUXZPu+u+JFAUI2y1je+qTRzz+PfxElcpWic8=; b=lqg5tL40txC/Nobn
	gCWxF8hRx8Xb0YbEHSOoOMxpknm5kSJAdUL0Xy4CwRn5PXKmZpzbSwne/dYEYviV
	q40zad8lV008uaQ0Ki50CHqmMAO3q6ABB976fJ7lSwiSIX7TnBkSqyqaTC998QNR
	KVXoajZ576ZZXraSR8UL7+Q+AFaFTWfuMBO/6+DG65IMUQiiR4KFu7RnmP7fbKw0
	GjvUuQlJk4aoh0d9xXoz2+Of/yKH3OCHbiCtdOeCzTGzp51IuBATViO/FKAk0yxo
	F+ZNu3/TOsD9DVCMrN/yuVNn2PcDttfOxkjKiWdcmD1UusJE2WYrCxyy/j+v/s56
	w2oCVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw3atj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 09 Sep 2026 09:18:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-938fd633df7so73361685a.1
        for <phone-devel@vger.kernel.org>; Wed, 09 Sep 2026 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788945503; x=1789550303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tTCnaPUXZPu+u+JFAUI2y1je+qTRzz+PfxElcpWic8=;
        b=eWbIXbSZ+Zf6AcpmBogjFWV8Sout6fScrqWRKMV6LfklELIbEm9ceq1KvZU7Dz0Boi
         0EhFV9k61yitNwrZ/sfcklVTaJ40An+0QB2hSI8fXoP604pTMfYW4Al2rSlK5d8kpscN
         jsXHCBeeY9JEdjH5Cvi1WS8t8UjRPF8DIVU7lLqYzou9Yww4zlnv9/IKYijbsLoPCjM8
         /gE9WxNGgZztieGeR40cs2vvdYyYaokVO2vQttaJfsV89+rQL1myYXgQ3l2QdQydKfNX
         r8Kk8oZDgNJ7JPKrNQEhzf/dG+7EZFoIORGDkH0DrIuTcU2AbXyzXcG4LcbneQSXjkot
         2Zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945503; x=1789550303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tTCnaPUXZPu+u+JFAUI2y1je+qTRzz+PfxElcpWic8=;
        b=WUIb7xQkTobGmYnL6OGR7YmF77pzaipIeBugZeirNZdoVswfOXyue5bSvn7vDj0gfI
         6aoJO2M/ZoqI+pb9pmrsCl9H8zBmE1BOVOD2fslxjvj1U41iPi1+xxHnPH9W1Y4wWbih
         7Z9VxpbL3QH8FuGbMct/8uNOMIqFZA59cMpk6Rskwb//o0lM1DZ/fcWvBRTl3jGIHX6i
         6PvE80tzZOPMQsn2BKBwZfh6bKiMo23P819M7O5EJZqWL5D0FLVYZT9fTROtqHIWIV37
         lVL1Ux+btmAaYJ5VLh6Qm3K1E6XJKqflEaSZPYO04MJId5ZdBoUfjMrM3k2x9Ilvxr9t
         i2Og==
X-Forwarded-Encrypted: i=1; AKwUvBzT5Q375Tlw2O5mau5CUwcbBdYfYMUjpbLrc64JdN6XkyyN60zaQk73nNfpkeMhpXBhVAmUYoxCtzCk6w==@vger.kernel.org
X-Gm-Message-State: AFuF++myCTuVGv0hkKFZfLkmk09WcZB5IXuZSx0FFVx/8uzFKVkDmUt7
	i4H+nqDak+7gLaa6WAjr+CoTquhRf1C1sUFVSzPM5IdOh5ZJWTaTW7lsPjcwm6vbHPXyeB8bReN
	GTzD/2lnJkZomsy2F4SBHIhhyMf7y0ORcyscmpuSqs9GFqQKLrlKN4EcQp33whf2UWg==
X-Gm-Gg: AYBFou3Ys3aGVT8t51VRufdGTj5UtOYdrlrVUCH1Dfl8HSU/nVSU6u1LxG+FkcQPBcg
	ONjMi61NX4ep9uhURGcKZODdAFAzbJUPm3revDxSxr7XsGUyFIMo+6LESBJn21+8PbBJ9oJ9LbS
	sPt6AJctI+srOMSAkfRMp/xyv5LHsv3ULrkzXp3ZQ974xJJy7z1kazB2oMCAKegY8FxUaKAUmEj
	PIhfOxV9mn+wruRs9FRsuh/lphw5uajF+GdkmZ2vkMxkegTAbCfQ12yptm7lYlgRZS+75qE+BHn
	qULjCnbBd6TLXZTzYUjp3QzL/XlHk7/IQE66PW/bAzGX7flVKMZfyIdGrKVG5/ttPGiSOgCXs8K
	oYYoY+NhH1rg7RMKOrT8Niw==
X-Received: by 2002:a05:620a:1a06:b0:934:95d9:85fe with SMTP id af79cd13be357-9399180ba67mr2231679685a.3.1788945502735;
        Wed, 09 Sep 2026 02:18:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:934:95d9:85fe with SMTP id af79cd13be357-9399180ba67mr2231675485a.3.1788945502185;
        Wed, 09 Sep 2026 02:18:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261e24a9e0sm680491466b.4.2026.09.09.02.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:18:21 -0700 (PDT)
Message-ID: <9db74716-b0f7-4560-a5ed-9ecaca6a31b8@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:18:19 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] backlight: qcom-wled: Fix unbalanced OVP IRQ enable at
 probe
To: david@ixit.cz, Lee Jones <lee@kernel.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Marco Mattiolo <marco.mattiolo@hotmail.it>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, stable@vger.kernel.org
References: <20260908-qcom-wled-backlight-v1-1-c4dd4eabda07@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-wled-backlight-v1-1-c4dd4eabda07@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o5YAVxkiQK3Rmdckzo0_76Mi67PxFgU7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwMyBTYWx0ZWRfX5/UF5If7NMh7
 4U7ZQQUa588GoGjwsZE1wnVQV+lKblchyYYzAHfunKMOAH1fKsIaOV7lFRp0Pd3TYgBiCOigPpS
 4+I9fqNbg73TN5/FbIsWWbFZHAiRvXg=
X-Proofpoint-GUID: o5YAVxkiQK3Rmdckzo0_76Mi67PxFgU7
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa1245f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=FSV59ufblPRWrHBwF98A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwMyBTYWx0ZWRfX1146wClWzrfy
 Njh8tUCqQpZNEHbalQpLK9QXORFYCgtjJKFGw2sf4sh6g+ON1C5G68YOWvAtsSO2K+PiHnkTa2w
 QpB2ZLhvQb36vWKrDWRTbSHDQg3C1pdUzcyNEYGWM9P5XQIE/9xpoaL5Kfy6ghbnHDlT/+ZFaxR
 3zxNedFJWrRASr/rYFtk37RuQJRnVAp3RulVkJowJlap3cRxkecrvPyf2Pm9BxsH3kFe4swLBZM
 rkaOn4PoJaXAbYzzBG6Aq9eNqk9jC6kL4kD2hsmem8csnMlqw477reI3lb3j0O+vTVrRkGB1Cwx
 Wl+qu/ygoHXf6yOS2Dm8wZcNYhIFVqgO6W1Hazo84ZR/Fya4QJt1tp/1PXneR9yedF+6IfthUpN
 bIPgl/YbcKm16GSBNX37nyR1dqIgVCHP9O7Fd2xyMcUoMVwF8PERNLXJJkbhq81pnoZkNs3qJvL
 MJDxSzXakK3UrgcgjMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090103

On 9/8/26 10:53 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> wled_configure_ovp_irq() derives the initial state of the OVP interrupt
> from the hardware:

[...]

> +	val = WLED_DEFAULT_BRIGHTNESS;
> +	of_property_read_u32(pdev->dev.of_node, "default-brightness", &val);
> +
> +	/*
> +	 * The module may already be enabled, either by a bootloader that left
> +	 * the backlight lit or by the setup above. Record that, so that the
> +	 * first brightness update does not enable an already enabled module,
> +	 * and so that the OVP irq is armed from probe rather than from that
> +	 * first update.
> +	 */
> +	rc = regmap_read(wled->regmap, wled->ctrl_addr + WLED3_CTRL_REG_MOD_EN,
> +			 &mod_en);
> +	if (rc < 0)
> +		return rc;
> +
> +	if (mod_en & WLED3_CTRL_REG_MOD_EN_MASK)
> +		wled->brightness = val;

This won't work for WLED5, you can implement backlight_ops.get_brightness()
and take advantage of having that function pointer

Otherwise I believe what this patch is good

Konrad
