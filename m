Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87FC3BF66E
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869777; cv=none; b=YJ73yAPsxmdKtd3lweXyVP16/1McTMaOnpaiD4kBvv2Uiz68yTrIpwpZMKrKICWD3U5J2HNXvAp59CMJORTRL6h1UlKENDkdIB7McBnft1YUZyPfaV02TFhfEXmQYbNj0riufENapi/v10/Jj5zh+c+ovsJkkuogar2ZyqLQkDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869777; c=relaxed/simple;
	bh=EcbnKwvlMQtKZ8zaJ6Pf3gDfNFf7RB2favD1ONugsJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uCKTrYxOuj+FSwAV623Smb+N6d4Ua3ZdANGpPYGTKNdvUf2t279GA4zu/p4Ol8slwiHIhaFw2KnhNq+/qjrADoL9kWlxYBWCis0nr1m4fBXIvxXz4VEUKuW7zMXIeENAVKunYX/oBmu0DApfqQRDRsEPMkxEpceX0piSUD4cQ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eN+/nEud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BA1GI7z3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eN+/nEud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BA1GI7z3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UA7k323539676
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 11:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	plDxEJIEjCNBQg3n0O4+/HclwzWxwaqEltwNdOaJVbs=; b=eN+/nEudwXb+wVXd
	Hlj7gMrI1Nxnan1OU5Gb7o6sIQo4OdbCDAH4gPtAgRNax21N9Xr9M0jB1l5xU1O/
	NYdr8qQcwIQf370OTMeLJ5WZvl8PbCgsP4DoLpSzEN++Lqws3njCQZdYgzbVJ96b
	r+n8VPsSbKkztsg30WPBqSzztDGn0NODb7bTqrOUH/2v38d6Gnlvz9I6OLiEnvgm
	oGNOhtNNcnz/z+3IRGjPaRqziSaSLqA5n8WciNbzISDKkkWpBsVbzQyuiPvJGPFx
	d9mckR9y5Nbg9ODrq91rWBoXs6Ibz4kEg+0o+0VPy1Gu57k4ZwH6uKFHpG2qdaoZ
	y7dKxg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59r8w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 11:22:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89f3e41fc17so9117636d6.2
        for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869770; x=1775474570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=plDxEJIEjCNBQg3n0O4+/HclwzWxwaqEltwNdOaJVbs=;
        b=BA1GI7z32qTodTtLUs2BCOoK6RSRRMmAXCFJxVxj5bgsQVUcLliG8WidnjhKGBxhBX
         5RsFq/PMzYxmQmYDKnasJi/WPp6DyFL23b9w4jztp8JMKQUx+iF3e5tx89TxY42MJfCF
         rTD/rPbCcNXFiuuWVsE0HJpgSos4A+rPHQTOfVAFbfITO36Y70oCmMcHrGqEusR4f0MF
         csPglzzQ95sIasABAvOwkPglAt/bRTYmKPLMxdNGmId0bNOxCZvXhDfICMCBQG9GZgqg
         k458JKFWna7JTLNLQQyJmEt3z9sCPACNDklO9YZUQO8iFbzVoz1/8JZOiPiWSf7FcGNU
         MP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869770; x=1775474570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plDxEJIEjCNBQg3n0O4+/HclwzWxwaqEltwNdOaJVbs=;
        b=d7Xfn6WzkjpN7oDb4lyz008gOzJ9cem+uHFHdm2jP6Tq+h6ymoeAblAZehi/rvHjEa
         V3f+G+ofFDkA0+wh0gu7wkPdzbleQ+BPseWz15Mdw6z/RBbgBBLfD8ZpnZWaVgsdDor7
         wg79l0DBL2Kuo+OHRgPtNp3PdAfwm1qFoTbqzN8rDVnIAByOm3dTG6NUQ+m4lETaVsxZ
         RhuTNKKp2psbZY8cWBH762SK4QW9/kgQCQmC25ACOA7bDIb72Bp2QnOinyKspzs4Hszw
         YfwLxtoyy0rYkY/lbDWBoyorhQqwEZjSYakg/qe2kRqHlVrvVV66T+4//cVeQcWYBzkL
         m3CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIDutoU06i8ZY/v0zhiluVriOBX71BG1RIz3e+AMidPoPIpixHemf8c6NuP5dbYmZo2wEbhi3bp9jxMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhfvlYB9DCVF0NUSAygFPLJDowr7HbCikjzIuJYQMIvmb8gJgg
	tF94YtdaE2+3Y0nikzwoL295hUYzXX4ngT6neITUJ5taCGrRIrvtw9DdhEMl7Q5Zf2Xqh7HibTl
	hgIYFTuxQQLKdfO6g7Ci9/mBF4LfChrNidKVYFYPYdn7STlyX3Y1PMM4KW6IYRDvPoQ==
X-Gm-Gg: ATEYQzxCH6cDqKioqsXose69oriyJdOvF6iFY6IrsYVWCu6sMQGAjPtjuereEdAsB7K
	KWJBSGV8w2ucJiNf8NebHNaVw8a30c4LzTb9l9Rz/0xdSiSoCPRpigy40juTyD2J2Oa7e3blj4i
	AfRB1HZu5D9Hcm8awOV8T35GNJ/IinXTvt4DaabCjtrDJIjLhDUcLv/J7twlqR2l2uqKED5BpcV
	Qb/qbjSejZzZIc+zm9Btt3yLPVfP4QGs+PlEvzmi9pcfOWtkLamVrgqbnO8RGTgfCT/yEdAsDmu
	mrPEOXNS66gFluQvzbnkxRAgmmtm0fWAKEq7OzovkfQ4e15n/vsG4Tiz7sSYUCCE5L6u8WOPJKN
	Oe3PrsFfC0/dDK51kiXF7JFiNZbDd7EphJPaPy+WOVQ1sn9adRo+x5v55P/J3LhkJ/bA5cxXtIe
	wkNa0=
X-Received: by 2002:a05:6214:528a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-89ce8df70cbmr125942736d6.4.1774869770146;
        Mon, 30 Mar 2026 04:22:50 -0700 (PDT)
X-Received: by 2002:a05:6214:528a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-89ce8df70cbmr125942386d6.4.1774869769508;
        Mon, 30 Mar 2026 04:22:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae24d6bsm276245966b.6.2026.03.30.04.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:22:48 -0700 (PDT)
Message-ID: <ecfae618-b2fd-426d-ab2c-c13ba5d764f1@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:22:45 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
To: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gIiCKiodxxfQjFBQ8EgBAkw6Plt87sqS
X-Proofpoint-GUID: gIiCKiodxxfQjFBQ8EgBAkw6Plt87sqS
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69ca5d0b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=ER6jexHYGgKHINCZH0oA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OSBTYWx0ZWRfX4hlGzFA5PmCb
 PDMhlLjgXhjGpgvza4IMwEMz6I/C15+e+Y362wGb75CBQ/Km+itn2NmximIobtr6VYrn/qqojqJ
 HU2mZNx6csaF7E9ukU32/5vPod10YrY582ElPRw4Z+2FPPDw9gzftPEtkjLhc70QZtNpN5QuDMD
 qAMNwQzxjZYtw7MTPLY6jE0Tsr5OaVW1HcJFKkzCNvWe+HIypA4lvb6yZSWJjyHR9vWFFfBJXMk
 pzlJptRitPYZxRvzc/wO0fzbFwo+fa7x9Y6B/8YuOGXhshGiLONJNr4sqJTIkuuQTBtuAPc06wh
 ZdoMi+2/H+XUMTqlE412Beww+kZQrr2ymluB5D9jQMnFbAUw+B+bo9mzTbBIxnZ0crwsbDr5Bkv
 dgNh5E4OwgV6aDaZmgsfVbEtfbRC4KVb8FQ925ujmzCh5pun7LGOD2dEXLmhkFuIY34Y56/Fnrh
 qvnHQTFffLBXSFgDdhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300089

On 3/27/26 3:30 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add the description for the display panel found on this phone.
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

[...]

>  &rpm_requests {
>  	regulators {
>  		compatible = "qcom,rpm-pm8953-regulators";
> @@ -244,6 +310,13 @@ gpio_key_default: gpio-key-default-state {
>  		drive-strength = <2>;
>  		bias-pull-up;
>  	};
> +
> +	panel_default: panel-default-state {
> +		pins = "gpio61";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};

Nit: ideally the pin entries would be ordered by the GPIO index,
via:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
