Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E401DC1AB
	for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 16:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766249001; cv=none; b=Yog8c+YS8eHVwwOdWjFQcj662lAG5LCho+595O+uzezBbLmmsvTIAuLzBVzW4Dec/Ch4RbKdhs+JwWlLda+9AmN0VebXP6fz6na6hK7b3Z8If6TDhSlVuQFuKbSUwIUTQrmL3JS40IW0xmhv+qsh7GvpHQ6fQUEGxTTynt/xx78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766249001; c=relaxed/simple;
	bh=ma/va1xuUA+E++ZNGOD79iybJzKWBcfWFHkG8XZUVds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFONm29KrOFw1gSxBS80Eki1ris1l1VPl91l9p+EAP7BfanlzS5ujAmn/3aEPKTt+g0rQHng4gvnipagZu/IIE1Yo72ihYLTryk3QlgeIgtZXBzRMvR+hX1/dYjOjJZRUej4b2/D7uaCigVy35PMU+OeQb4tWgfz9HYPqE+JeuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X55yvZpo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YDwRPS0H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X55yvZpo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YDwRPS0H"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBsCna4153136
	for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 16:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ohdhdwiC4FFMEEaMOcvAmr6l
	y1HKYTiQl6IXfBOvxWM=; b=X55yvZpozrjBaV6bBMoYJgTxMDqXI5TP7cSzxD7R
	D6rE4dhUmWkwZtbw34m8FtIIqn7p2175nF/J2Hw8NJHiEsY4eqE/UTn7jyEq5QVE
	Ah0LDQQNxK96f2JFOexYtJ7CCoJgNhVwidavYIW2Uz0LkYvC8bqfQeWBsOnlEBjD
	BdmieJ0UvLp26cs1BfvwTpU9YLqTY+lhmn0NPJm8xUGe3qTOwJH8fFQSDHO5k7IS
	SdDzQUo+Cq5RudouZdKHCVXQ/ZY3o53gIMy5ZQysrxz7jAPI6dYCCZBJ1MCCYj8g
	cQ2khI7Ja2g19bMlliYBwpZ1xVe/KesEaXPIYP+z3LZWkQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux0xmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 16:43:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d60f037bso58058011cf.0
        for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 08:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766248998; x=1766853798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ohdhdwiC4FFMEEaMOcvAmr6ly1HKYTiQl6IXfBOvxWM=;
        b=YDwRPS0H4pt9JDCS3jvTRc6dgkVFzUb93owSX/4HHAYRBgCDSomX5p5dASU09KR5vx
         gor865GxGuk+o8AZXJOvHWMiMArO2VSHPVXmfAFRpS+eEw7tNOp+xMPcSOf/LWzt9r05
         l8Qe8pkLEirpPhjdTBTwEjRMXX2U5Z4B9jhFrjJUGMHBYAa4J2MF9HCxeteT+6pZVgCn
         dh20i4vEaHjraiQj6/B+KxK0l8CtLFj/7RVvt3MNS2e0DCfLh1ivw56sPTi9V7V0WqS2
         n0zzyzF0QCOETCQ5Ut1dV2CAMqDybsE0WBdEntZ3yuR+5KL4zIAlKCBFSzHxyvhTP1BW
         /Feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766248998; x=1766853798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohdhdwiC4FFMEEaMOcvAmr6ly1HKYTiQl6IXfBOvxWM=;
        b=jFH5etHsWIIReU7PmQGuJJpvH9h87H6HzWAVWUhUrTlgiCMMAJ0Pa6qNaMpYkInB1a
         kUgb2MYsd2N6vOaKyg3AGFUTzuRbieKKi5xhBIkZE4D9qa4IoE3I7gEuKJFdACNDhvHo
         7WAWGrhdfljEKK9dgOeF8XKtCb1KtSrgOMofedTAo4VF5Dsy/in3qVMxZSZvS47VZHSc
         xbwJBfvROy+gyLzxKdUAs0viOAjN98S+yfKluG2VvQXF3RaH7By59gIItGJ3hXWif/G/
         mNVl0Cgv9EFzWrCY9wElgEYnfs2ezzRMm4PPIr8v6JMvP+ybWa0zhE09pBZCDbZOHVYI
         v5Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVDCC7i6pniV5F1QbXk8ThhPHGdFdhnBSnMK1KFvhWapIrcQmwma0q8UbunQ7Ju01FmIvr3XO/duE+xLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6NN6qD4ySasAmeYVzyAOGlH9c6dW7VTefjQwGAYSeYLOlGN9R
	SkIXAFl5w+fp57wFeASEboG9niW5e7QYknJuAuaV0FuGLPDgPl1vm1C68X1pOYwizysW2cWxsM3
	ZwDsJBLeuRZ1HGp8gH6bbDsTKFOfM3WTkFwg+D5pPN8UUC5rQo1WE5h2jV4wDO3lWQw==
X-Gm-Gg: AY/fxX7sAiqkbzIt3XcPWehyBW8oLlexofpAZD14Y2xIDLvBJ3Rrc26vGA9lzzRKsCA
	Aqo21ZDtZQlORwVK6zUni4m8mZiv/Wy4rOMaViDcOV5nCL4KNEYM6EqPCRwhhkMvitxh15Y69e7
	sQ08VRnX9Zr1xXazB8zF5HfGHjNX+TweQ0mPcPFRAPlrHVogcMCDyjrYyWREqOBnk4htRx1gGry
	f8XfYnzmOMKKneUIzQ0/pFEE7i5K0yJ8yZYZfniLvc7T/UlVHxKR+h8eEGV0lAg2m9fjib99sOV
	YtPgQzi7UaIbVvU8Da7iEFLyx43sfl8ESm0Cwa21eH8sjkVrcG6sRXLjp8RDtRwHnHLJYZSilC5
	NZmiTDjhU62EVJC56tRLiKV3Ss9ugkqXuxjSUmVfRAXgN9vCQuDSqR/IjjWX13AsfdXb7DR/Gp9
	pQPuKed05JGZHKvdAfYbcDGZ8=
X-Received: by 2002:a05:622a:480c:b0:4ef:c5cf:ec0e with SMTP id d75a77b69052e-4f4abdb2eafmr104522491cf.55.1766248997740;
        Sat, 20 Dec 2025 08:43:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEeDG8QliabZqhFL6L/XSpUcLdYtvjSEWOrUClzCVnxv/MT1Uc5hNOfXtSD9CVyj8/GL/WqQ==
X-Received: by 2002:a05:622a:480c:b0:4ef:c5cf:ec0e with SMTP id d75a77b69052e-4f4abdb2eafmr104522171cf.55.1766248997321;
        Sat, 20 Dec 2025 08:43:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122501032sm12106451fa.14.2025.12.20.08.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:43:16 -0800 (PST)
Date: Sat, 20 Dec 2025 18:43:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/6] soc: qcom: ubwc: Add config for Milos
Message-ID: <i2nbit2dqu4ajefx44ky5aijqhieflocnkilbvo46vdq3ywd22@kpyomui5i3mx>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
X-Proofpoint-ORIG-GUID: T_L2NmzqTzpl4HpPSY1fATuru_XaoC9z
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=6946d226 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=KB0s8L93-oSB63ZrkccA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: T_L2NmzqTzpl4HpPSY1fATuru_XaoC9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NSBTYWx0ZWRfX97Uum28ojHaK
 DOtbDrVOCE1GXBKLtBZefr+jv0vheY6azbTe+XDLJuJANylotYXb7xE5qFzqkPPFdVtl/Y6Gc30
 MtJBtsSeim1XACAdXMRFlyJdod0VknoXoQTQTzgl7CGgqEc3TNp1NuAk2ycqDeGx1nyiqiFeEHD
 1BmeujB3/8JunvCg8JbcWcIqM0PRJa7WaZl6n1ApPZZgYlV0ykK0x99gQKwtrAAuaZKRXMepUfW
 e6laxA74qLk8sg3D+2eDpuppySGzem2Wpmltch3toxXbizTqzFHKCjPmemlD9SL1h9K83tTSzlB
 Gy/EwiJ/BIvp+YJ2IR0xW6CmSO2uPfMwu+FdEathkUP8LUf422fTGnoaXY0fu5FFQQrPGOzwiCS
 jWKRzdibcIwIw4hnEuVmsDiYG9BAHzuNKjSzStKNnvQKwuj196cQRzbudfRFY7tBNM+FVkvrdoq
 7IjxpBVMBIR0g2hBfLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200145

On Fri, Dec 19, 2025 at 05:41:07PM +0100, Luca Weiss wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
