Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE714223DD4
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 20:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762806702; cv=none; b=TWOxPaM9DFMopiKCTzU0ipOnhnEbgd39e+rjnEsiUU1FjsTfQeCu33HPLlII5CMXTnmDIIvlS6eiOwlGG/6CPv4RVdi0e2E6efBAJE1AyTm/cuXPf8pYeWHHTCuWkZ1leoYrvLZlUxT86tC+rDhWFOfQV5CxX3ZIoOcVnoNhVbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762806702; c=relaxed/simple;
	bh=YE6PuNDtpQDapq03SWpJdSQuLlfFhMnJC90bI0n3BiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLH0RfaEFHPcpl33Ge8XGngQN0ICgkSzzYNv3nSauislo2ZTujoNqupfW7xPpb159oq6ns8SPz6CwAX1uG0ad2AfJvyYDsyMw7pxVyXnoRTNM0QNUn/7GZnsvYbywJ4KfyoDMOcDLxqa7xplU8ELkRz38upa+D6VBGW4SeXtRoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xri2h24q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiGlFDqc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xri2h24q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiGlFDqc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGF1lj2993175
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 20:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bIdT5At54DZoymEfDUiwR7h4
	Ocq8orpRWmJMZbcs1fE=; b=Xri2h24q+2MyT9XbcNYp5uUoakuMlmxSRkINmbfl
	wP1Rah4R74hwrw2N5lXsA+ZYK03HZOYndVsaq996VRMCUsO7ftiT5dsdrVz5RVHq
	vmdFljS0ZbsUN7ZZDLoV2vhQ/Iw6BTXJMziUjn8ylic9tQcVwlPSAk+6mEjIzOme
	BuhvgXW8xBpp6iKkNi0YaQXMmQ3yaRrpMpaZ6drxKF0GuQWTb4QFvIv+8VWTp6JB
	ZsGKdQMAu/PFInWyQbWZFvJJFIP0bT0B6hXtH7oZWEtB/FwSWvCvYzj/7VYLi+TW
	CGe+MayQiKVNueU/Mqs1YBqk9Xkm4F1bEBalqhVufohLww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88t145-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 20:31:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed846ac283so4687771cf.0
        for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 12:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762806699; x=1763411499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bIdT5At54DZoymEfDUiwR7h4Ocq8orpRWmJMZbcs1fE=;
        b=CiGlFDqcpyzvywIflRzieMSfSAYI5rq3xJp8Bg+QXLCvrDtFEQF+fWNVFjnFrHWR7v
         lzsW7EBfwD0pkcnVqNHoMdKpdTznshYf3MuKZEvXJ/bo7yMs518slyU7MoOMUV6nG4HT
         iBy/E/AmfBMEazZGV4a7uXoro5cILHale+KBWuVt09VNroGQtJMH0ogpMUFqfKkAeA0f
         O5gzlNDz9si4TNaXuaFP4AZ3YoymNHE5O30LR9Be/1x5FIbui6qfWupTuHII4tPRjs1R
         91x4WzZNX8SAvOw1NdeUfUxJIM++3hSVBPS2x7vXY4GCQMMBPfo9lLRp13WGu8YzozVV
         7p1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762806699; x=1763411499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIdT5At54DZoymEfDUiwR7h4Ocq8orpRWmJMZbcs1fE=;
        b=XzgP3MPhBa/jmcMSo2YsH11JYN1DMZXwRrDWu7AOCZJdd0/lG4sXM5p+t5j8JfeOkQ
         pMPdQFO8I7CY+tsPySUNyCJg+p8r6s11bJoe3y6szPqYOMXYQSywF2khizK99krIPcUP
         reVQ8KiR5JM3Xl2Mm1VCHgdvG1NA7uGtT9fxaM6203vpwdQDHbUzMaUw1nC11lECyz6b
         6ZENfCKdyO79TiufFg4MVIyUdUeQ1b04NWht44vWWHTx5WKvIbiKgPswzwBdiYR6fdpr
         O7K/tNBm5/iP/pAS/KEH1t5Xj+9jXOZVIRJN897VTwjnjkVb1W2P/Ym+++PY/nQU1MFT
         deIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFxJtU/t7qxffoYY1wnFg/kSWYWn6v5Bd7hmUiXNHHjP303Lgl4H4Olb8Ui3z9cYWIYT9+3UGOl18JcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPStrNiyJXp7a3GW/xubVsbLjE6ynPtjo6AEFiml4h50TI70cR
	PjBk6fWmPNw8hLNg5H7SpXRsbVeeEFQ/jJdRIRguH6wtHenQk+vDUeW6XcX7SC8YDRtkfdru8g7
	H3/oBY4Q8onHGvqJFG8hokEHKrmr99KQNmceZ4KketDr2Q4BZSV8aE0Cj9cNV53DX8Q==
X-Gm-Gg: ASbGncuFpUTTSBpdtfzNnpShJUpKZXCxzTO+/QnbFEi01H6ZllDSAPU0evE6jPF9Gb3
	CeUu/9RxgrkRgNkAwTGpzPZFRkP5ciVhoKd91D1wnJYCtndSZk+CTs5+9LlMFhRY3bbplaocxZX
	tPIGxR/iyaZkKSuLM64vue7RgDZRLUQw8bOCZrvS8xbYXlAXqaUGlb0Lnli3UPmmwIG/kvuZXHo
	QFznQHf6KITksp+lINboVmY2jiFvDUOTUATcn49+gz1rjmxftMmtd7ufhEaeiV5dcbNWx7F8rYT
	KS7WznJD9Zd0YDHD+XYV8I5cShh+qq5E5y5NwF5w0Uk3ilu1RooULU52NRnoPt5o0l7rosL27bX
	RAgWZ1Pk/+AYpKLqYN3EX+rIGspOqBVOOyXMIBd5Wi+tNx31AuowhRwDtgpBDDSkHRwUJXH55py
	OaOkF4Wsmq4C9M
X-Received: by 2002:ac8:7f89:0:b0:4ed:5f73:f82c with SMTP id d75a77b69052e-4edcaaca4ecmr10918741cf.11.1762806698780;
        Mon, 10 Nov 2025 12:31:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIZbcmmVUaYDitCUIFZPjdhrCzCbtSzSkTsWaMEcYAfRyoi2LFGBk+O42E4nfXG+YHNcdP/Q==
X-Received: by 2002:ac8:7f89:0:b0:4ed:5f73:f82c with SMTP id d75a77b69052e-4edcaaca4ecmr10918211cf.11.1762806698332;
        Mon, 10 Nov 2025 12:31:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a59c4e6sm4254424e87.102.2025.11.10.12.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 12:31:37 -0800 (PST)
Date: Mon, 10 Nov 2025 22:31:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Dylan Van Assche <me@dylanvanassche.be>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-oneplus: add ath10k
 calibration variant
Message-ID: <oufiptvhpgr47xekpex45wyp3ysoz27ko2jlygoeho5u7e7n5r@maz7m7wmwkm3>
References: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
 <20251110-sdm845-calibration-variants-v1-1-2c536ada77c2@ixit.cz>
 <wqjil4hhrbsozvhwdf355dqpwu736z4x2nwnurug2bpx23ed3g@c4shkwfyohky>
 <5fbe9d10-5d6d-404c-8f47-e4a12ebe7eeb@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fbe9d10-5d6d-404c-8f47-e4a12ebe7eeb@ixit.cz>
X-Proofpoint-GUID: ateASmR3kffHCy6ZY9wwMx_ZropYw29u
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=69124bab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=uFkZ6A_fq3OJCtIxTy8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE3NSBTYWx0ZWRfX4+jjo43q2Bef
 3jJfoD7gD0dPWVl0hz1WUXHtnMhVUUb00R3AKFdcLJVC3wgTMyFYQo1SSZIxDt/Vt8AhXqcmLsh
 4+GqThWN6RbcKFIT0AIlEE/h0P6OtcmD7so78m2wy4cwjvYjk4HtM7+QpLWq5cI/ek3E/ciAFC0
 fBwGHhFUcaCkBx2xpNmYn8yiXn5Co7virfO6l2Kt20prtbdfGFejkhvLspPzYIj55hH9+WgBg6k
 lQPe+EUzcS5ni+/ypWPtwRqz5URIXq9y5X/pR29aslgF8CWpHqmJt2yvwiBWkONk4eeSKtoNP37
 ZhFqaSTjb7uyeokSUbL4dU2/pxWEnca+NjbkrJZA0yFOx6ghPirpGPRCgPT+u7B2jArXsXf6FOg
 hRpkYtXdOd10F1R9AK8RovCxzzmlgg==
X-Proofpoint-ORIG-GUID: ateASmR3kffHCy6ZY9wwMx_ZropYw29u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100175

On Mon, Nov 10, 2025 at 05:04:35PM +0100, David Heidelberg wrote:
> On 10/11/2025 16:58, Dmitry Baryshkov wrote:
> > On Mon, Nov 10, 2025 at 04:37:46PM +0100, David Heidelberg via B4 Relay wrote:
> > > From: Dylan Van Assche <me@dylanvanassche.be>
> > > 
> > > SDM845-based Oneplus 6 and 6T have their own calibration files
> > > for the WCN3990 WiFi/Bluetooth radio with the ath10k driver.
> > > Add the calibration variant name to the DTS to reflect this to
> > > allow using the calibration files from linux-firmware.
> > > 
> > > [David] Adjust the compatible as ath10k-calibration-variant is deprecated
> > > Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > index db6dd04c51bb5..a0c2f6efec59d 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > @@ -929,5 +929,6 @@ &wifi {
> > >   	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> > >   	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
> > > +	qcom,calibration-variant = "oneplus_sdm845";
> > 
> > oneplus_sdm845_6? or oneplus_6_6t? SDM845 is too broad.
> 
> I verified with https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ath10k/WCN3990/hw1.0/board-2.bin
> 
> $ strings board-2.bin | rg oneplus
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=oneplus_sdm845mmm
> 
> $ ./ath10k-bdencoder -e ~/Downloads/board-2.bin
> ...
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=oneplus_sdm845.bin
> created size: 19152
> ...
> 
> Since OP6/6T should have same WiFi.

If it's in, then we dont have other choice.

> 
> David>
> > BTW: Were those board files sent to the ath10k ML for inclusion?
> > 
> > >   	qcom,snoc-host-cap-8bit-quirk;
> > >   };
> > > 
> > > -- 
> > > 2.51.0
> > > 
> > > 
> > 
> -- 
> David Heidelberg
> 

-- 
With best wishes
Dmitry
