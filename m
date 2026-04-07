Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1C739EF1C
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567238; cv=none; b=fCr7MiJ+UZaTS1Xur23ekSTKHZc7QvWk2zi9zzbtR1GrpA7buqpYwLJZTpOjxp4eMdpeYhtyF7eH7dkM7W5lPHIzrzvUJFAW0XJIBnA6Kb0ivEil+Zktl+nMm6UtuG3WLCsuTjgUJBc7lgri+VFvk/QYFYTSFIce3LjBnbOrjzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567238; c=relaxed/simple;
	bh=if4a0dZt5o+Js5rWKrjRO6Yoegf2GTe8BpeTLvHP3ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIhcQ5aPhFpgsJaNOKq1buvUZjsUB9D15+iWmwDWNTM+7DqomnfpSztHg+JDQ42VuwUq/D94zuwdBtDxEMroQtFI0FHp3p5NGTzOuEvH8SsFQ9cQilc/J6mu4db+jN2CXCKvE9zmpk4zCNRLPiwgG6VsaXwukiEmHY0r1TH9CoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6vtKFvi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JUsrmYsv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6vtKFvi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUsrmYsv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637Ca1ES492506
	for <phone-devel@vger.kernel.org>; Tue, 7 Apr 2026 13:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+FbRRZF91Di0ErlZa0qnpdWS8M+hjG9ECkw3xgzzD8=; b=L6vtKFvi0BKAvIus
	Ovaz0JofGQwzOahDSHZaFeXnoe7KLPDcOZHeeVMXh/IuqUpK0UNgoTd+4plPVRva
	9VxnD/YorZDO9lvibGjmJk1nzQPeKBTxF9pmUSbCEiX6btGi1hjyhLI+SRv3gbZr
	pd6BIHnZtvpRY2ihYSQoyrAdt6PKgpkW7Ton7PiDPO+noY8cK4nyjawuyNArovr3
	WoL1qnK0WapjQ4l+JS32hJ5bAcpxb6cwvVB25Wsorp4Lm5HXYV+CS4sPPqqhrPo4
	9m4TXpTFLtCDcI3vR9Ngw5WdjqNOHpTLbgrm+qx/UBtTk8J/N23D2GX4UCguZcZA
	gwawjg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8ts5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 13:07:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6058daaee1fso184254137.1
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 06:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567235; x=1776172035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+FbRRZF91Di0ErlZa0qnpdWS8M+hjG9ECkw3xgzzD8=;
        b=JUsrmYsvO4O4LzxCze3uePWl7Zo7EROwHNr/3NM2Q6ndFBdZpN3NHSwI7+ZxcDjeeH
         iUYRGk/kRh5mSDZtYEMn9UGBpjT5bszZ9wWQ0MU5qgMOXRSh2Ig94bTVY124qsFb9fSe
         xsUf32ZdGeSE3oKiS1Jo3Y+eHMVkoGSIjZ6zhxPLvv4YfnISQ6aSO/OvzpJRREaH2o06
         F5x1dO/Ga8pth4iu2yP6kJTdmHBijZTUHBmrOb40Z376FO7xd0GwiMld22wX5WUAYMVJ
         DcTXJyQqViLDbbvT8+9HhAXShZZ/9l1RD/yOzQzC9Neo7neydh3U6rhKmeD7G2wcPshx
         iNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567235; x=1776172035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+FbRRZF91Di0ErlZa0qnpdWS8M+hjG9ECkw3xgzzD8=;
        b=aQKjfGL2svVPGU6gmatZzhBDnBCWV5xYllBQGo+hSLRa+N8dhV+Cy+ZKenEmGza4EU
         uSgWBPT98ua4KPd2WUUyDfGkYlcLSrTGTpvEKl7knXeVoVYONNk+4dn//d2lv/Pbp04n
         KLJPpG3tvyMRExeYyCTQ4ZxYSLgSmo+xUFRZZOhs7qOhRZgBs0L5OVI+SahJQvJewjne
         aoGpNcsNUfGUccXIF667n5LSuGxKyB6NAikQpj0bMZUpNP5ZQKfQ7EfzrZb4aLw6Me/y
         dl7atgSYKJr4ctmA2QQYNFJFD/nB8pyf+y4CzebzXJ5hw68Cw/QKdI0sFWBoGi2laSwm
         my7w==
X-Forwarded-Encrypted: i=1; AJvYcCW/9x1eHEIBMSWMHmLuz/1bVJcM0KCKT//YfEZjCCyCUMQGhJp6wbLLiTqa8nBCNVkJA5EcUy/zmJGqEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiDDaprE9LoWpXvxwA6kKrSit6MXGNaW7VQIA2buQJNpTLyM+z
	aOiMrMsNEu57KmnwNPwAg7iGT5GBrMsS1Nh2b6wIJKPNNXsqVWQRvCLMcQGcrQ2VtMQGc41Goqy
	kl8i5NDfXnEgDUDDyrdNQP8PTecphYx0tgxnjEluHD5jgAIf8ECt4lIG9nuzu3UYGrA==
X-Gm-Gg: AeBDievQ5d3kTVrYI4YQiBsWyKMwjiV2XuL3bhGc4Mt913osRAl2HcvsWZTNDIVaIs2
	VYmnMMYCQ2EGVpmRnyOJ0ogPl/ZdF1pL2IAMywSaHRphy0mmvD2ByprMFKAclZ+ZXNVRRNmBIPg
	oh+p9hfETG5N8y912itY4Tznm/YcVgGB71FFjDyYfl1HqlXWpcLqpwICHanwUDFjW3vp9NDTgD0
	uykM3fgiuaev7LSWW9xMbL5Q4JBtSQDD8m5V0EF1rTChENyI7YJDyTHqzdvWqkHcvx4wCm4sf4B
	KFGFN0QyiuQI702Ljw73hiBjwb8c9KFVF44XLPN5dhHmpMUeXvVUvMNuxaqEhv/N7kFNNDXR/CQ
	tl6LU2sLX3Xu4pxd/pM5iXmy6x3wQu0xSu01PkU6+DEVPcV2OVM1UcaYdZF78RJGZ0LIitJlVqa
	xLR2A=
X-Received: by 2002:a05:6102:225a:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-605a50da5ebmr1992215137.3.1775567235212;
        Tue, 07 Apr 2026 06:07:15 -0700 (PDT)
X-Received: by 2002:a05:6102:225a:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-605a50da5ebmr1992173137.3.1775567234769;
        Tue, 07 Apr 2026 06:07:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec7csm550660466b.14.2026.04.07.06.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:07:13 -0700 (PDT)
Message-ID: <fd0919f7-e510-4560-b355-15b86ee9e5a3@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:07:10 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: milos: Split up uart11 pinctrl
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9E19CxQwrILJpRkrmkUcrAhWg1cZuo1q
X-Proofpoint-ORIG-GUID: 9E19CxQwrILJpRkrmkUcrAhWg1cZuo1q
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d50184 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WCMWw2a6SM-JmIkApqcA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMyBTYWx0ZWRfXwQm6Zx/H6+Mv
 YON3dg/Qogx+7+CwTzGipEL+Cr4sOXUaDEGTIXTdQGBRoezCFcIAGENJ3OFep0DQuRqo/Deu/GH
 OHZ9uhxz+uI32RL/CSCEAFw+vSuSrPH3eJhUZqmZ5/R6HV2xOmdzUwq0I7dSJ47V5Lk3UkrXs/C
 s/xHtyActghTdtntOy5H3p/74SxnYlv6t8b+PWBRnZ3A/Gs9sHJ4N2pZp60yXzZcJuS4EXjen+h
 B2SZp1uVxgcYeBKTJulEaQ3LkKc/jL0lbVrOpR0IY0+6VS2w29mBZLpPBzPioWHyjO0FI4qwQui
 iFat98xqnUyBMNMiECdMwLARPbwk68HT3Wwvf72WxlzET3V7+ZaBBo3De/f0TVlWwsPR/09bftM
 k/A18XLXrZrtRTb8QT9SZ4UxPK+yQE3IeR3bMhZ0fd3HcTKq3nM1NVgXdIHX2EidJKlcIcAvfjS
 ek3glG6PXVD4es9ZEWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070123

On 4/3/26 3:52 PM, Luca Weiss wrote:
> In order to set the pinctrl for the individual CTS, RTS, TX and RX pins,
> split up the pinctrl configuration into 4 nodes so that boards can set
> some properties separately.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
