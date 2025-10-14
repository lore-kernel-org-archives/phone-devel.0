Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210B23002D6
	for <phone-devel@vger.kernel.org>; Tue, 14 Oct 2025 19:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760471587; cv=none; b=FQxr9OpdGtUpIxf/er96bCHrZZTng4OGdzNkBzsrt8Ur9zT3++rtPE7uoZcgrVFNtTunkVajv0ApLpSHynmSoJGJ1X8hyXAOHF4I7NgQxPWn7o/gZayFbMCUNkxP73zA5oyFN5VWnZg/dLJMS/pEUVz325+ePV35fd68C0Mew2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760471587; c=relaxed/simple;
	bh=FxikLTHrJ6GZsIh0W3emB/71ocHdeBqTFQnZHycYjNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IC9DfAtdX1Jk81a6Qvk9IWckGYQhWNPu9Gf+/L1zAh6oBVorEl00rlvJSpRhwAIeh4RiH/D4a0mgFPIqX0Ov+gTHQIvbMmCJPD97PT+THz1SKKMyVApRP02JoYq72MkT/560cssQEz1qNorlCs3xECh8+7e7hoRqzRZ91nhvY5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVq8LOo8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JVq8LOo8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFLq7L001502
	for <phone-devel@vger.kernel.org>; Tue, 14 Oct 2025 19:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cGd4TA9o+Vio5ktUC73FiRYo
	+k7HIpMv84SqIFKls8g=; b=JVq8LOo80oZ51vDVqJXnYHFSeQx+uUg1bMxp6H3W
	AK1jH08KSrfZWuNmd6lFzDO9r3RrfmYIdQllFx6Trrc7q8cs2TV6yRBJ+b3lErSI
	VZQYG6evZH2SfdilXFWjFF2wQ4SyeAAhT2n9rF0Td7GqX02alFp5FnTm76NLO2a4
	Gg/kcPt69fgayHybuIVZ+63BdFvk0oOvWnrEjDh2CU8ZJtKy6oMS49GWq+cCgGt5
	u6uHHdOIbTLi72LuoWdfqVQo1DYN0Hv4Klq0iwLNVlG/fbAMjxmRENXv5xNJlWSt
	JuFBf5ZGhHGk7JO7ApcFkcZfBXYNE9PNn2VTi7uOTVQ/nA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa89tkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 14 Oct 2025 19:53:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-871614ad3efso2745402385a.0
        for <phone-devel@vger.kernel.org>; Tue, 14 Oct 2025 12:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760471584; x=1761076384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGd4TA9o+Vio5ktUC73FiRYo+k7HIpMv84SqIFKls8g=;
        b=rY12rPn8VlOwwdmU5xWH8X/3Tawg5yxIa5z1WVITZ1DNFAqMIp74dczIa5vr493Tp+
         XucN5hdhKkm5USnmSBLHig3yjInH5BhXmqKgRH2pH1NJFLUZbBFOzIASKTJY3lMdvKTy
         DHa1NbNO63/DqKLTNriq/8zjn18ZtkXQEV2BunX8FulYDCY//cJLgRiEHuqL9zG1Wsi0
         j93/yTXdpVVIy1c1sBlRE0ftvYYRVSvLnvlvsGL/sbkcJDCegdaiAiZsmKg3TUk+RDUb
         WjqE+Q0h9Gr68xSO8FMbjObpy15rNAs/oXgeZgvOkHFUwb+epv2fto9WBXRM7PJzMY1F
         NGaA==
X-Forwarded-Encrypted: i=1; AJvYcCUC8gOeNvQjYIC4BLaqSR0dpCBgncGU69tB+DSGMClL4IPOXo7PUFRItYdFVtO49eaPR4VIa/iH2f1vfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx10CLZ9M/uKHbxXjnfP9ZWVc66W8pp1JAPWpN+bIrPtagusqB3
	FjTG5VmCpR9LykNNh2ELpRr463YuNv/6tF1LpJ411MEltI6AmEx+0PMxugvEjnalrb7veaSK02p
	CYIznj4ixXiM6tZO044EFcs9RcTyGBczEpCFKZhOygJirREq/jZ0ijj7XFD6xhxlPZA==
X-Gm-Gg: ASbGncub4Ut6VeclRafwtBi4TsD71G8UiYRasM7iqShD3gRR02Qbf5tYJaKoiKQcyUM
	y5HefbzAI5impDsoj5oBK2mO9L02TyLKI78p5nu8tUBxAqsmj6/rpHTLBmPvWFlsm02hAzOr0R6
	Nd6+rsRE27A10SuLv9Kls0aknrrNxta7kFnew/aQwdnkL6y4QZYNYlMD+tZx7rNT9NtCOyEtGKk
	bcUdtzTHDDC2G8Q0c5lATuEyz7jeGOhtYbYalwbjcJKTEJV9XN73lUgxlDLD9XDiWTuJuiYop0W
	OhBGLP1/uMqcPR0dA2Q6Wi9p2wo2mhzj/OeEC7yUtzke1wGRBwuuHNpx2xEWH9VD1JzW2iJGSxV
	5r8jGY0CpPIRkuiuogmwDbbia9B/4BIFm4OkXIpZj/R0hZCPN/NRl
X-Received: by 2002:ac8:588a:0:b0:4bd:a790:e485 with SMTP id d75a77b69052e-4e6eace79b4mr360740691cf.25.1760471584258;
        Tue, 14 Oct 2025 12:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGPrQWfVGmlyceG0rRofi8QeJmqTvZTVemdfvMnpoDpgz12So7EC+ErDdSO7Uh+ov6m1EjCw==
X-Received: by 2002:ac8:588a:0:b0:4bd:a790:e485 with SMTP id d75a77b69052e-4e6eace79b4mr360740301cf.25.1760471583775;
        Tue, 14 Oct 2025 12:53:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088577571sm5520194e87.102.2025.10.14.12.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 12:53:03 -0700 (PDT)
Date: Tue, 14 Oct 2025 22:53:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable configs for Fairphone 3, 4, 5
 smartphones
Message-ID: <kho3w4ksrtah4zm3qlllf3bkjst6364tga57tvxzlc7ajt4ysm@ri6fuhhrh6ei>
References: <20251014-arm64-defconfig-fp345-v1-1-53fe1eeb598d@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-arm64-defconfig-fp345-v1-1-53fe1eeb598d@fairphone.com>
X-Proofpoint-GUID: _loQqBI-Y_VWLGFRh8O9eRTT-GYN6CVF
X-Proofpoint-ORIG-GUID: _loQqBI-Y_VWLGFRh8O9eRTT-GYN6CVF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX6LdOorSqg2PM
 /8gUTyqCTvajMRapdFkjfPKBjvoVG/Ofny2HGhygiPr6NyJTbtGeN6E1f+ApJcEREUKQdfz6FZF
 Y9xYnHwKByvV1AK71WgqCzYbp4FGxvpOrqteJZg67nopWaqGSlFRXOXWd4rL39vdasyRG+0kzoG
 Rn9bzjbVR2tc5fQ6npDrWYwGnBa1gN+hvk2EKcFoSQvWBtpVPUAton9Gqr1XaKd4PX37Gh161t9
 xdEhIeI0L1YAIqM9byJhd3peAGr5xh+WrpgduLPIy+95VsFTkekrfE7BY5Acco0kgTaoZA3btgi
 j5Y4LD4aiulV3ruUYjZYjA1cL6VQp2hm+9x+azsJGco35xnEzcgnD/JjCP3dmzw3C8dnia/Qwhm
 o0bOCcE9epfN8or7YAePC6uQ1iHWnQ==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68eeaa21 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=7Rb80dcyciYG-_IqtnEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On Tue, Oct 14, 2025 at 02:11:18PM +0200, Luca Weiss wrote:
> Enable base options for MSM8953 and SM6350 SoCs and device-specific
> options which are used on the Fairphone 3, Fairphone 4 and Fairphone 5.
> 
> * MSM8953 SoC
>     MSM_GCC_8953, INTERCONNECT_QCOM_MSM8953
> * Fairphone 3
>     NFC_NXP_NCI*, TOUCHSCREEN_HIMAX_HX83112B, DRM_PANEL_HIMAX_HX83112B
> 
> * SM6350 SoC
>     SM_CAMCC_6350, SM_DISPCC_6350, SM_GCC_6350, SM_GPUCC_6350,
>     SM_VIDEOCC_6350, INTERCONNECT_QCOM_SM6350
> * Fairphone 4
>     DRM_PANEL_HIMAX_HX83112A
> 
> * Fairphone 5
>     DRM_PANEL_RAYDIUM_RM692E5, TYPEC_MUX_PTN36502, INPUT_AW86927
> 
> * QCOM PMICs (used on multiple of the devices)
>     BACKLIGHT_QCOM_WLED, MFD_QCOM_PM8008, REGULATOR_QCOM_PM8008,
>     LEDS_CLASS_FLASH, LEDS_QCOM_FLASH
> 
> * USB audio offloading (enabled on Fairphone 4 & 5)
>     SND_USB_AUDIO*, SND_SOC_USB, SND_SOC_QDSP6_USB, USB_XHCI_SIDEBAND
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/configs/defconfig | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
