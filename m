Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D466F23B63E
	for <phone-devel@vger.kernel.org>; Wed,  2 Jul 2025 22:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495634; cv=none; b=vF61rdBA47PqYF7i3BCE8An6CvbpgqZlImbnZVo0++zjYKJ3ZxXXFohTa1+HQGP4gR4m7SPVff+dcUulBLfYekXrIghpwBcVSi8lXSFVikT0UTuB0FhiawtjjMuipCxTaXx8/DmRYHdaa4GNdlqvTsdJCSmQUZ5tRHxLquhEqm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495634; c=relaxed/simple;
	bh=fKYrShfy4eijBV7nECTRWv3J853kJl0gn/F00vK+lMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSFKU7u3HELQA8S6gx2LyDG5TKLxEDaQ2b+K3NszZbqWcC6+8So1mVQBdYxypFXae95i0tNrHcuc43sbvo04Pvug8MjtCHdlIZ2qgajpUidjzBGbXxAptW+5jS4Sxr/2TuNhnp6IF27Z+POQ56mdGXXfpSw+MrQRhoufRyhGprU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrfFrXe+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrfFrXe+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562DITSg018559
	for <phone-devel@vger.kernel.org>; Wed, 2 Jul 2025 22:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9m75rRNh/55YNUo8oud19uqS
	Nh7ztNCNjf7HEJhz4Jw=; b=DrfFrXe+I0mvhum2HRzezn+EXJKPyXEcy+lFpiXD
	yOW6Cz33OviCyc9FH6nvXpgJomdo/eHdhOG8aJTRmhOs1ghywi8LT3qVJZ1pxOD3
	GyhruPTn6GEwW0yJPm8ALH1doE311dSlPuVVheig2nl/QFP/k3H5UtbRBlkFzk0R
	64iMHYOn5V68PVk5s7LpCywTIpe72+rDeaQuJwMGen2pcr4W34h3ccIptIGUDJoP
	z93TGYaaZMIRmax/U0SdcL8yN9FvAE53uNRVqNPy01th9lcZOlKG+K/+ZSrD0CUk
	2AYUnGEcREoX4z71rFOJ3ex5ZlmLHJFGznZITV1RC0/zXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxp9s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 02 Jul 2025 22:33:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09bc05b77so150348685a.1
        for <phone-devel@vger.kernel.org>; Wed, 02 Jul 2025 15:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751495630; x=1752100430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9m75rRNh/55YNUo8oud19uqSNh7ztNCNjf7HEJhz4Jw=;
        b=KEe800l+k+4GEWTwb2OjVqQH8hFdv0shDPmstIxGdAY0ar2/+dXXDsaw2X4aly7hD7
         wRwTiz/qTspkpRiV+jWlfx77kStAWmWHkf0NTrjLigQexChKZvEZhPeoTgxjDgxZB/dT
         BXetYKnHToPNR0aO7qPfPTo1R3eANoKxMiUF+vGz8nh6JkP2wAlUB8RHsJG1uI9baOVp
         /PXnxvUTZJrIyJF5HhlxRgs7SO5zCaIjECIvkuqdAQTXUg23ZT+xUm0VA8SSzqME6VKc
         b+qwnTLBqfin4xNflE4hKCBCXVbVkhEIvGOeNt1U3ilueD5bAzZ5v12L7BiNA0q4QJxg
         iibA==
X-Forwarded-Encrypted: i=1; AJvYcCVNlx4MBALlG1hyH2qfnbukK+rvda4ccdluF+RVMIpYThOT+RSUMpTB9Grf4ttHNqDxgkbZwi35SJnT4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGVZdR0hKopKUH9xtk+mDKSVgZv/o8zkLEinI3rZZN/FSZOjOU
	eGgPhShueqRp8gY9ELtfbJWNpCoOp13PGo4vxFithEZFFMjsR+pyFO1B4celvu7WYUPeVpbOxlc
	8MyWe3F8Wsq4pAjdRoXqPJXLILLQmrN3BG7QcXojdjSSQdReU77XJ4hy+7LI4tEFbGvhkJ+dGNb
	joQMk=
X-Gm-Gg: ASbGncupmkOq1NGsuB9D23YrPE2hvyzpQC9xSbJlR9BZVPdE58fYz4y6Ahddqz9R5z8
	evcYPdW984naI7ziY7J+W5KE1jAQrnEYOt+Z1DH3vtKWA2vYNDUvqGcw1mcbR5URGiihIhlX16f
	cq88k/27SF6xK4FfLt7T8nqCTD6KbQOZPBnliuXdC9a9U3kpr0VkKOzj0VJMF4ELaQ1p5XxnhGR
	3UprWsKhQ+NsIvhj3naTbOd7qDJ11THbybC+q3lBua+6opUf4jkDEWvPU1j3yPKndXUiirG4QuD
	V5zTDdwrABKMeT5avqf/C68HCgcj+19EKwBvgxUgaVFYZp6YYFK3x4p25Dm1wGrvzowHKjL4Fjz
	oSuBOqdJ91v+fAMJ5OgiUexeLdoNnfY/HaSM=
X-Received: by 2002:a05:620a:394a:b0:7d4:5a4a:ceb1 with SMTP id af79cd13be357-7d5c4798da0mr884198585a.47.1751495630590;
        Wed, 02 Jul 2025 15:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqHg8DuS5Rl+xyDTUq7jRwAVjwOfUy86K5mPVVKk/oqcQL3wgwaOndDK7teOB2+3l4vN8JRw==
X-Received: by 2002:a05:620a:394a:b0:7d4:5a4a:ceb1 with SMTP id af79cd13be357-7d5c4798da0mr884194685a.47.1751495630175;
        Wed, 02 Jul 2025 15:33:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f00aa6sm18743291fa.99.2025.07.02.15.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:33:49 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:33:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Milos pinctrl driver
Message-ID: <xtcfzqhwmxgyui7fyn5bsms52nnlflalhlkvkinhdc2sxdu4l3@logrn3cjupez>
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-2-c138624b9924@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-sm7635-pinctrl-v2-2-c138624b9924@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4NyBTYWx0ZWRfXzUpWsq9fb83f
 zIGiU4TbtR6pOod/bEenzjQ3FMWfn/+tvRdcNhxoupCD95Gnw1QpOugmzMvBECDR52IZ1cNuc8z
 9A5k+Ipv+o7/VHnxuhTJw6PwDkxGK1xfRbWFRA2436x6jLW8lpxP50MOqpRnmR+8xcTQbNqhlwB
 irkKrJjW/rvwDWt9tgAAjkVFM3KHK8dlTbWdQwU/YRQwRLSq3cpa+0TxXyCBd8zZBnJroPggVgO
 1Fm2OgfKDltQixXaEh6JbgENEhGlUwhwfTubgibVNZnPSWbCICBLkQDQwIBcg36qTOZCZ6wWC0G
 IQ3ga6upYi788LGd+YFJtaZSL9yoptFrdGikwIBAGq3EJ95Wy1KFF7TF+TAUmfG48m4HK+8ABP3
 +s6nc9vJO+D2F9oY4BAqOddC96ceGDuyGxCwg4zUZ0jRIry5+ylYfHGeBR3FmwM1Q5kzgMBx
X-Proofpoint-GUID: J3lYEGPzdLdSSnLF-v9L7Qe1mTO9jT9I
X-Proofpoint-ORIG-GUID: J3lYEGPzdLdSSnLF-v9L7Qe1mTO9jT9I
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6865b3cf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=JBPsfPNCSnIN1veHQUAA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020187

On Wed, Jul 02, 2025 at 05:56:17PM +0200, Luca Weiss wrote:
> Add pinctrl driver for TLMM block found in the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm     |    8 +
>  drivers/pinctrl/qcom/Makefile        |    1 +
>  drivers/pinctrl/qcom/pinctrl-milos.c | 1340 ++++++++++++++++++++++++++++++++++
>  3 files changed, 1349 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
