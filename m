Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4113932DE
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405208; cv=none; b=NSobMCD4TGrmbIUCEprGcDlh8ahwge9P5StkJv0ZviUrQmMXx6xAKycYVihtqqr90UXbB6WqQ00DpOw4W4XFtjO9ygo6mS80y6dwbOmC36Aumcz/iTb5cWE2NCg2X4uB9yEScbAKtPHz8W1ZfNY3eXgTUAyzkOpvZSYMNFhjves=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405208; c=relaxed/simple;
	bh=0Emjr5T+xCmI+Wpk+ng3/CK6Am8XEeesykcL3lCtcBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jO+hTebMs8GodBqraz4qw4gtwaLSosFQGqIcLgzKkzJLaKJnYbbi7hL8Yi/5HIYhGjqspxbLx08DZ/290EP/Jud1hOCqYxyfBKlFrX9pXovUlYK8svHeSILyAKv3USaNZj9NcGjCAsAuqocveZPr9G2HppFi51hhSIXsdZKgT40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2LE2tGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjF2oGLf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2LE2tGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjF2oGLf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DBnpEH3229734
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BDSd6M3ADucBUh7vaHNmBoAw2ElUft2U7rcIQs+bGmg=; b=N2LE2tGsId8fohuo
	cpgbtYagjGt1ueDsCHwFSzVhhDSG5ASaiHRm3AE3TXTbc4zyfJbGQlCGglenjJx+
	FFaZm518+/X6bIJ/+9R4Jur6nHWQFlF1su6J/r6zBrZnOm14W9JfgZeswk/90WjL
	XVsbLjl9fcqXCt4gDz1rYXb4O2EFt/AmS7ij365mmSoub+HLVW/GmIzLzCvyVd+n
	d+fFcAwG+EphWz3jrzcbcKH9k+ZR5Krge8GyedeixSzCRtFIpYXtLkdmX0ZOOF3/
	TmFfJqd/KmZ0Kc7JoAZztv0w+nX1dIDiVfUCY6pCfCpd3uMqzPKqnqho6lKfdI8L
	+q8uSg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7j4h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:33:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8198fe16so135292585a.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405204; x=1774010004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDSd6M3ADucBUh7vaHNmBoAw2ElUft2U7rcIQs+bGmg=;
        b=kjF2oGLfsP3ExIoe5QG5GlBJdcAXAN5bE6IuW52JeoqFUVPxGcx5pvkBGFB2M7Cvyw
         /WQuMCdghrmkTGK2VnvirJJMHNNQ7QCDJDssXWfNxBj1xiQWnFN/H7L4w1/LwrpsQVu8
         kRs8QrirU7sVQmhglZSWCiDFC0fMB/eb57qHqXjx95WmaSG8m8dhUxSTLU3IYyeKRnAx
         tv5RUWHcD6egl1SyDRyO8RSwQqET9BJai1S2mHPDh/VFaCxODzLpf+Ae6MskTjUVTN1K
         waire71yo/uJrF0ZeGIeDN4JsK+KNBE/mbNBPO2KNJrMFYdaO2BJ7a326ZE/FoRgWVxG
         dnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405204; x=1774010004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDSd6M3ADucBUh7vaHNmBoAw2ElUft2U7rcIQs+bGmg=;
        b=aawIvlc4rHJUESW3FavCypmwXkGpk9bNtgHPMT/29+UpabMgHmYEled8QI0DMEPQa+
         7VnBcl6J3xzjYH3K5gyUaJxkQ4MxEhHTy+dE1/Ms/WhHg026VL0AD+yo85SGzPsTy/YR
         LfD4Tg1B1ijSEX8VKCNvW3o3DIK/nLhWuX5TD+ysNVK21yDRQvFRqLHBz8VajYhNxHEh
         GLiOtpy10MhUDJoL8Sy8GfigdSUnb7t9KyEVI8rH2MBIjjCUmVVpBYA+Gb62Wz6bzRkn
         towwTEGwTIDILbTMlWQUNVc0817yVDp+/qAJfyrqKtP0lfKWYD3pKJJka4P5ndW8Lgn3
         jT7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkHospsiAtMFS5o7k7vJ75sHMMSk1FvuMCeZnL14A/4d0Fh0BjV3iP0Dr036te9g3+ZrhGF4iX34qdtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSsOclghu53mZ1IFdbfEjatgyph6QSrwD9f/TDPg4pj6yKP/Lf
	76K3CDphcyk6RVvTg6kJ0liGCUOx8ec6VpBktiNkcoXRuHNvXqGSgfU/aXgNVD4KOg5tWzFd3ig
	H1CR3ypTwq+/nRZ48RqJrz8+HAoOyZX1Ba0XzxKqtqsb9W0fup8UMsuvRHME59PUKmw==
X-Gm-Gg: ATEYQzyvxLkc+nMiMNOZJdHUJyJpGdJv2sbSLMp61w6GulLna5daVkkczwzh+61CV2i
	U7MX4rryZZGvp38S6/lm+JIwwUrPK4tmOinkcQtH0mJVL8uterSwcfajyoAuh7djqC3CNRgKFlI
	BTM+NNTccdu0dWbIn3t33parTB4IHmvNIQGGkdwBssi7MLKk2vSuuYCK/q14QlUoox3lkIvAGla
	QpcGtDdQcbFfD6t6N04gUxsizq0OMYAYIuQgNTNAKxOUER7CTEFaxiY6mKw7bIP3LwcNGOioHxD
	GKZOBs4h0sQkmKXtRXPrGuAHryc6I8jQeu6YynVN9PX6zl8XhZWUqVbHfh0jx1T+DMZs8ni4D+Y
	U7Afqsv6DzDl4qw60lxIp68KRPY1V1TsXOk/jgjVvbnv7P8EAEOTJ3FMusMLy6eTYlJSeFatK0h
	RV3NM=
X-Received: by 2002:a05:620a:44d3:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cdb5bb356dmr351085785a.8.1773405203727;
        Fri, 13 Mar 2026 05:33:23 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cdb5bb356dmr351079285a.8.1773405203234;
        Fri, 13 Mar 2026 05:33:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d0b7722sm41877066b.66.2026.03.13.05.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:33:22 -0700 (PDT)
Message-ID: <4d5d0fe1-9aea-4ace-a369-275cbb728afa@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:33:19 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
To: Yedaya Katsman <yedaya.ka@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?Q?Kamil_Go=C5=82da?=
 <kamil.golda@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
 <20260312-panel-patches-v3-3-6ed8c006d0be@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-panel-patches-v3-3-6ed8c006d0be@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fvZq_IgW5daGjzXq1A8IHw_tHArS64OF
X-Proofpoint-GUID: fvZq_IgW5daGjzXq1A8IHw_tHArS64OF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5OSBTYWx0ZWRfX+9SMiZwo3mlY
 6KS3jBc92fhjyNnVa/2pkf/9hoK6SFz4ep4J4dJ8BZ5uREE6GHy/DnHKQCR5A4oEGK8Qy30RHMI
 GSYbVcYlfXPE9hdRbG8f73/rFJ79WSllDzo9taThpM7JML5kyaHdBuH208Qj6mB64AyeKfRKhMb
 BXl34UsIkFuSoCvnUt/8K2Xz/e9+XebP7zUTQa5Xyh0xs4XYwWzGc7/aoJDcs25sPdTrfC3wGp8
 m9N0Puv+RzXclfA+7PRR8TUHvYMduDLH4e1lVl6bv994vXMXRqQGU+siV8HGbLT/4j3IaXN7uOg
 gnHG71Ab7i6UnTo2mmKz1JGO5iIX/GMc12DvpDesksCFEdM5sXXLlsTDbNUqaWbqK1KVwwPccpa
 3pBBgppgikIEBvbE0fEiUo+GZsGqkLmSdECmNMenJ3u0yfpVIAYDsjhyX8RG8rPc709oISwXiCk
 AuidKpcRBZ9HJHQPk1w==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b40414 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=sfOm8-O8AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bqK5-dEd6McJkE9xslgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130099

On 3/12/26 12:55 PM, Yedaya Katsman wrote:
> Enable the MDSS nodes and add supplies and bindings for the Samsung S6E8FCO
> DSI controller for the M1906F9 panel.
> 
> The ldo and iovcc gpio pins boot up with a current of 16 mA, but they work
> fine with 2mA, so I used that.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
