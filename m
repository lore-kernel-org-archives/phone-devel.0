Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C36C278772
	for <phone-devel@vger.kernel.org>; Tue, 10 Jun 2025 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593770; cv=none; b=Hxw5lfkUo4QLLTMWGcuzRH6cK5x6MyHR+ObWpLSLxTe18RL5xg022H31L7MeeonOoo0hEYtjot3cZ75SbkaYSUt2oq3/Ma1YTkXZVwMbwETyIT9HnOPrET87/nwiMopZuLpqGPcaO8eJK6GQVywZkqlwqFhdnXIwhMTOlElmX7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593770; c=relaxed/simple;
	bh=AdckpzHORZ04nz52khFJp8hY694kPNdQO93ZPbWS0Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgVbIKf/axHEhqRHDahz4n3LpJ5M3eZXF87gyxzoKX0sSplX9tMV2m3DgWjs4Ith/UGBrqaL4gnSXcxEk1M2UpoirLJwiomgATpqk72q/HkfW7uuha7xKManouW439n5lS727ylN1YkGpX9ubAjwVaYf/WTAaa5XnGiHdhvP2hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOLrrqEK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOLrrqEK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIQ1HE022355
	for <phone-devel@vger.kernel.org>; Tue, 10 Jun 2025 22:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9pZN1HLKcnKZHer+eXfm+cc/
	DOSG+5TIvmhgIGDFcyE=; b=mOLrrqEK003d+TjbzN+MMJvU0R/CMQ3T+77usO0T
	p/2wQJsNA7kaxxfjlZGNU9A9muJ4KQfEEtlTsPKg3YA1HbnamQNXVaaguG72LL3B
	4VqroCwDQEUxDOHGdmNWwv/ww5iPkhAZecz4pTyEwBEFFn7JFnAf79ID/gN8fnlD
	D04bFikUpEdcKGrdNaJdYKTa639fEjQ09fFffsbIZ+nKZY9VY0scX6UtoSdN3ffP
	6vCEMsjHA4BfxOyzn8jgwwVbqFajm3XKptDvdbIOCM17H2EFNy8knTJRjGL4pO2p
	OhrsUtT2I0JOyaPQkU0cGjsV23WPxIl7CoyYeaKH1gvbQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekptn0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Jun 2025 22:16:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so1079826485a.0
        for <phone-devel@vger.kernel.org>; Tue, 10 Jun 2025 15:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593767; x=1750198567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pZN1HLKcnKZHer+eXfm+cc/DOSG+5TIvmhgIGDFcyE=;
        b=rbg9poNNcGcz9NpzX957+TnRUH/OhHWt+CP9LhuR5NFQoj+d3IfCEkYouePoS0gEfU
         dI2ajDAFlfc3aRIpsJyEToPQ/+XE6WcbKpN/JheLAQE+jB6RFcsSO7bTUPwRs6Szty/F
         941SIrUtKUrlsUvPHca6EPRmAa18dzYyd+Q1a6lXjhRYJZZJ/HS7q5383jZ9lCuBhXQY
         XLWq7LXjS7ssbCMRtySDepXa+4OwtfAp493cAnGiu0f8fL/N7tQ/4yIP7ZXr50fnEaKb
         Ow1DdhKDMoFxVeCovSLGDoUKD8+2euVqUzClUll+90cLqDs5fOLVuGJc4EGE5VA8Zxcu
         EICw==
X-Forwarded-Encrypted: i=1; AJvYcCXWuwfX4qGXRZOo8MH3q++/UsgSqOUKHUGoUTrfd2d9IgcR4vqxi2XZUhuck8EZ/z9SIm5daLErOfY/lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf4oJ0n86X3Y99ZIDiDSLcsCV+npIGyTiyrNGZ1xDlCT6FoR7j
	5qxDKIfjvF/kBVUnoDue08hiL3mpGzsPysjK7ep0ZOfoW7LJtJFrJ6+OaDLAcJOQn6mobrw8bvI
	POM7DDYihT3jQAwLcrqawAQB4NoIpJrJi0bWcLk4PAFssTxVChfXerPtXBmMrQTTI4w==
X-Gm-Gg: ASbGncv5k+Sj7h0qF3GX+CjOPRHBfn1pe6/5YQ+imlWj6M2mX8IJpl4eaUGLgKpb22s
	+DQN93uNvGIqU16hBr/Xd01FchIivq2ELCA+VUgsDqvS8w/ihGxR/xZyyS+gWY+GYFQAgzA/EX3
	fa59I6aqwTE10NSE48ZrBEv1YgFka1VgSQf9Ye0Csi3Yzv8oF5ghrRfILQPXA0F5dUcD/MuGwjc
	FuGqWpeqfF4Scfpm0aiRzCLfTSPVNVcKJTgxqBWqXy7/eOp4DnXOzHwMDEekjNvd+hw0OmHJYLC
	EfoJvdCXUuF8eUXkc3uZeZ+tXBv7utigGayWiMhM3N51A8yOdk43XKEqt5F+UcGbWrRyemPowI+
	vtwJaV7QbsJT11ziug86bqBcXNFPh9/Q2nTs=
X-Received: by 2002:a05:620a:440f:b0:7ce:ba1d:400a with SMTP id af79cd13be357-7d3a88e40bcmr167394185a.30.1749593767233;
        Tue, 10 Jun 2025 15:16:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/M0hvJvyIKxc0xXO1KKdRvRgsx+vq+O0zU4EI6ADE1ohAPsKxZG+F+D2prd/gjcYfYouQdA==
X-Received: by 2002:a05:620a:440f:b0:7ce:ba1d:400a with SMTP id af79cd13be357-7d3a88e40bcmr167391185a.30.1749593766930;
        Tue, 10 Jun 2025 15:16:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d765esm1718734e87.85.2025.06.10.15.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:16:04 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:16:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Widjaja <kevin.widjaja21@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] ARM: dts: qcom: msm8974-sony-xperia-rhine: Enable
 USB charging
Message-ID: <kgbfmd6ql75nw37eocsdhoj2mrvibdhnv5hixxakv75uycgujc@6umcwrjo2d5o>
References: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
 <20250610-togari-v2-1-10e7b53b87c1@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-togari-v2-1-10e7b53b87c1@lucaweiss.eu>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6848aea8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=UvBUG8sCUGYd-mWNjhcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4MyBTYWx0ZWRfX0Kfxar4pQOzV
 2S9yFXGkxAVYPCbyMhNzCL1w/6+JZXFccw8VjAvJUFzOLXaCP/YUjPuCVLIMCxz4B8Jk6Fy5Kz3
 P0fhGgVbOApDgkKBW7UOFZuKpmen27v2cm4dF6cbDmM3x3pH+1zi4xuVCDulGO6sNpJtq7veJcG
 0SB/V09yRb8ILtX/nh38R2465sICVrGK4kBRGMUaarfG57hAhOqbprQM4SukjKOkxHFjPz+atgs
 g9fbv9gR4DDVFArndzpV+bovP0VcjGPtsibZsYQqiFHEFb/r2qLEX42tLbCkt91QIa/E2Z6Qx6f
 WieL0rPTjwkdYv2Le410Ih4zpULcZ9BYsO9FwhCCM7I6npWNwCKQkRp64bx+XHRKYVp33fioUXo
 rfwZhbQddfXsEOeTnD2DRV13cvZtjUwDXUupX6us1xR0e/6M8X0vGpetINIRcVuNFfuawXl+
X-Proofpoint-GUID: 0gOrcDg-jX3wS6gNJEiKUZEqvj_1Qm4O
X-Proofpoint-ORIG-GUID: 0gOrcDg-jX3wS6gNJEiKUZEqvj_1Qm4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=667 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100183

On Tue, Jun 10, 2025 at 08:34:52PM +0200, Luca Weiss wrote:
> From: Kevin Widjaja <kevin.widjaja21@gmail.com>
> 
> Set usb-charge-current-limit to enable charging over USB for all
> sony-rhine devices.
> 
> Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
