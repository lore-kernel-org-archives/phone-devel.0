Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE46357CF3
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727932; cv=none; b=IgBpSmbEyLRA9b+F9oGIAFOZGYBYikWdL/iiD3ToN+zaFeSuj3yIkNQkqVixlNNkOgcFsCELk0lU9CyLa+bSt4dyHrbVrzSQn1DfPXByuqHJmF09ZP4k69tIsxJXQDcL883sBYyn0OPwkJZG6Z6/BLM+2THPjgHq3wKkp0jG7Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727932; c=relaxed/simple;
	bh=paG+iWxysrSOpslrh4rSOqCKN6UNGGbeb3lknWMvHPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTO/Ui5gyaSO2SfU2y5aioJFVs2y7Tmx8EIrioTB/tPJnNOH9FdV/bzJNrgJ83eyOMvHW70MlbvS16QzlSI6rSGFxsySYaeT84lC3lJbUtaA1FHJypPNMW3vPv9Qjfqq7DSOYvOvvlXobYW7KhI9NNPKdRBzHKvXcJHwKXhcPuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7AUa+s1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTaUMMky; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7AUa+s1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTaUMMky"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWdIW891678
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 13:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dzTgcV6aGKBlGU956yU8LpsW
	tJh49NRiC/iioCtnUKs=; b=m7AUa+s1O38PGR2cVgic6D5tjjYwrJw9fHpuZ505
	tXdV3uLeVvkvMypAGTAfQXFqooPSrp23nSVXnaB0115aI2cHHR+tGp0e/uBd7Qgm
	6b/09c6MihWlyvfuVVtVZsodf/5yXSKRFRMP+3NnFH0ARjnjp8mMdfIS+FGkL8hC
	9NWny60dAFKRMJv3A5s6qXWpBXRaAfavcco5q9QMMfBio+RkgexfglO9/yPpyhzR
	pTCyZcGGGKvw7wKSa9c90W8wtgyMERqhevSRxl+OipBXVXfXmhAZ2fgooA8uE4SL
	rRVnosWUn73qIWDiqdd0ucf4ShLrq1tb20QtSGSmcHl1QQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm103qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 13:45:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so200666601cf.2
        for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 06:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727928; x=1785332728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzTgcV6aGKBlGU956yU8LpsWtJh49NRiC/iioCtnUKs=;
        b=BTaUMMkyMInJgoC0Lo6JSLTJsw7BEsUwDVHbz+ZcV7Dv0GXHZ4XxDmdyEMW+JtNaoO
         YtY7/+hRqunrOoNE9KNjPtBTSVeMZG6stl3AQfoD+us7VDvHKY4Juaabn6iZC8CeD7o3
         DeYS29X/9k/eTWoqltPIJzYtTW9EeCAZA+ad2Reid3Cf/qJAuEGLn7RrtUVX5qypnjQW
         9UXWqy2frEdSJPzJfpU5jYNPG7tNzXt3d0m8/15k2BcdMLlvPkvPXAcxsa1DKVIbSCdm
         nzT/dr7OnaM/x42wLQTxEm62g5F+MlTlo2z3Wtm5ep4aXcjAMbDXVD/0twS+qOd/Xi/K
         X+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727928; x=1785332728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzTgcV6aGKBlGU956yU8LpsWtJh49NRiC/iioCtnUKs=;
        b=Uz46UyJAMoTvyiCn4zHVSX4C5pS4NH+OFFlAN+iuKJekibjpZxgRAYvnZeFr4MwbMq
         mvIrJ+33Aa906Xvqqy6+O0UqOt8v2G/w3xKxnHdLcwW0trQy3RX4/agIG/HvG5NKIdoS
         hBAgqOLTONK/Q+ZVzL5zgNekCLRS0JWwetv0J6JUeZiNrf7h2apoKRt39iynb5QyRjXx
         Rwc0aEiZ0cbXhc9J3fcDwpq0JTvH4NgNbC0S9go9Zq9qhqlsImw+zQAU0F2zc3xKz2T0
         ilTK3MP4N6dtg/05Kn7EOYJd1/PLcqt7WQsYt7Pt6w3Hgss5uBoCYmY0PaYK5+3V2vNM
         L3rQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTmGLLoOtfjNt6QYy424jdMU+rWmp2vk9VC8alE7C8N7IDdBUkHMsj3M4Gw7PI1we7/3VmJZbSnZVPdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/833ZohcRZNtXZ+vzq/4y3retc3L9CzOUlPKKFk+b4teh4H31
	bzNoT1uiO99g+YBtl18fazyjUwU4cGELRTxuefoeCL5Yo21N8E7yLu/cZ8Kaw/yPVVd07GZWjYT
	a9eQM8aWFjdOQsUpjqpzL2J/IpKTgr2hy2qRyb7cQ1eacNsn7w6akxWjcctOcmejc0w==
X-Gm-Gg: AR+sD12KSlQr8SoEx5/YVdBBcaMXlmcCAXkhFSJmViE9mY66zQflZSc11/ddzjE0jWz
	d5aLQjSqVr6cgxAYacdnDYhb/ydeATzE/eT5LJ82U41VHgo9ZaQj8x/OvF7CDcWhBnOOP0S+X0/
	KlDxU3n6B8YTkPj8xhtAZt65md1wBL9gk7exMitz4EBXnvgz5aZCL0n+XIbV9GdZXG2XORX5XHz
	cNOiitUy2SiBqnMgn+/M37QRu1PhiNxVojurLxsH9TAIiPohe2URaumsjX3g/I12zlotfaZwnJ9
	eeUVG14/o9JE1K56aMFpCjQuAJ3+t+NZjfchO/Uo//gwvK8eGtB1ANAssZV6MRTAWgB/OPTVnHX
	s9CIlXGnI58RccsUazME5QuLihcngUkYbCVj6k9jGlWdFKypgnOLOz1K8j8gISlt2t8mW5E1OVZ
	gQ6BAbANH1SOnb5Q==
X-Received: by 2002:a05:622a:4d96:b0:528:3377:c2fd with SMTP id d75a77b69052e-5283377c640mr15418141cf.83.1784727928274;
        Wed, 22 Jul 2026 06:45:28 -0700 (PDT)
X-Received: by 2002:a05:622a:4d96:b0:528:3377:c2fd with SMTP id d75a77b69052e-5283377c640mr15417731cf.83.1784727927823;
        Wed, 22 Jul 2026 06:45:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c0a9sm510523e87.17.2026.07.22.06.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:45:26 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:45:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
Message-ID: <bmoq52hoycfks65xplep6ggavilr2xmz74njgfn4wyufl6vlhe@5l7rcyyb2qgn>
References: <20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz>
 <20260719-pixel3-camera-v4-2-48cab1236852@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-pixel3-camera-v4-2-48cab1236852@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfXzNDk63wfGTIu
 8Eq6WygmZIJBwRioVtQ4eILrb9yM5eJZ2AD8rpDmCYATn1Z9jgubxG44wm3gjd41uKm770cVBvd
 UOvICrh+0LBnHeAahe8wxTwEOCFrOGo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfXxyeQ/T2noGVa
 smY/IurGcwRo3zdwcRu5GNN6VJVdSfhZ87Sm8xJ4ttOz8rnV/UKtcX9O9KbW35BbhHD7x3SqCgm
 caORJHrk2wpgbjc02JEw+l/Uf0s8kIAN9PBOtcbrlOJcA3qQcMlUiwcj5Rx/dXUlJmrTZOCLxAe
 jEiLHijsVxmcNx1rNACckVEQR+1xc0a3S07/m1tOd100UAr6CSdNKJw7xAADnqT089hfZNVsk0I
 gz5vZRDHTB5seHbpYo95vvbh/rsKykgz3p1/WvWUJHOJVbeQ+myp2RhkPz95GD4yg+wJAeWhoae
 JGxFXBQ+zYdI78qt8UZgmYGHGlqHUd3qy5H7tcf3emMzyArlrt6PNKz1VPYM0/2LPyop47/lNJW
 rk8O47HEiEq88+Sxadizf2ETjEn2ds7oi/dBHMssm0dA+rRuonzmSrz4iO77sBgujgdU6HSczBK
 vtJsn2OoS0cfTKuNMNw==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a60c978 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=TWkwOYXMJnNHLyErFSkA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1JSQ5fsv3uvLVwngxvmQwf-g5nGIrtBv
X-Proofpoint-ORIG-GUID: 1JSQ5fsv3uvLVwngxvmQwf-g5nGIrtBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

On Sun, Jul 19, 2026 at 07:02:00PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe two white flash LEDs
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> In contrary to downstream, we can control both LEDs separately.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
