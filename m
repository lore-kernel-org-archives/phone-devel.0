Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E548F70805
	for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745019455; cv=none; b=qsRjnFIrh4jMAi7+gLW5gBLo9l1lthDMjgSQFudq0xt7gOi2kp3UkSxfcQ/vsW1bFMt2UdC5DBsOi78UBNax+CdCHaF6JLP7w1/ivHOFulQnjtERTtpOqvC10LOrI7ZcpnVVwILRZPiC0CqCrkYIwZPiSBUYuc4Rwqf5Kpx1u7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745019455; c=relaxed/simple;
	bh=ANmOQK44ikGowZWvDLPDAtsBlWAQRjP2uX3Tmv4yg/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtSbmAF//vG/GL4MjNX/zpDebOGZeyOtvIrqCfI5KEnfYx5+ovGlaaWjExBhuJtUcV8HQnyYr/EaIbNz3dnEZ0qQAD585LZPLbAiZcrgayTAMWAXfuhRUBiVdt7mOhLKltQ13VF8r6Uz0daTbqhSaplSa9++DhqbL/E47/xSn4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6WQwBj2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6WQwBj2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IFe8Ft013246
	for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 23:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eKUA3bj8EeSG2nYcgbu3ywuH
	9VSFY2PDx0okj4dv5ZE=; b=o6WQwBj2OW4RvwBxJ6XuGJtVbtwHDQD0U7r6EXQj
	gjtv28QpyFBHU2oGavA+D8r0KLVVDg6nKry9llAZDAWxMfGLS9uRGaI8+Y4kWSM0
	2uxCGwb2Sth5IknOLn2T1Wc0kujKx3NQi8EmM+yHu6lJbTVwnOUtcsDFbGy86nTx
	2O/be/BbA7oqsXn+amyuHZ70x59n1ApJiwwSYW8hYCX5IzsJZOvv++7gTueViZZ1
	jDuvgokt/nPm/EdA3LPaxJog1PlnL352QwbEbMKR9A39RZG5KyQ/rmsi4QLTcYe7
	4ktIRz2EFNEbjT/ksOjXMDRPhlvavByHvQ584JhzbP3bgw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvgfp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 23:37:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ed16cc6e39so42913766d6.1
        for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 16:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745019450; x=1745624250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKUA3bj8EeSG2nYcgbu3ywuH9VSFY2PDx0okj4dv5ZE=;
        b=vC0kYbaGgTANo5PfB7i0VCrxIEpkFg6TQ7T8e+DoAKZarHOGD7K0POxdIVchOval0G
         9RZCI3QYsCQloqvgMNUwXCLeVPZRxOqAYWnH2JojrWU274YhNLwluXDxXsK3EMiO6vW5
         tUxZo8312375EggGHddQArh60R10mJ8mKTcXqHvUpI32S1tVbknggND4dpDQpJB0XYGR
         7jFIrPVZv68ncUHN7SK8UmfhP6R7THl7PJEatyYTqveWRYRkW0NCGhk9q/cvOPx3oln+
         qJ0I8iH/goJ5U+P/puk8DD/XkkRGIEq7KJs1zsnbLVJV6JZ91PqbV2I+bRdXy5uRdWPt
         nMIg==
X-Forwarded-Encrypted: i=1; AJvYcCVPKnMSB0cL7rkqUY34qJh0ZY8zmKwYFMINXxDfnFPe21JKXepySHsJ1h+XniMqJrjm7nSpsWSisQ37AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlL0bWz3OChRlMl5gbxogFm7lHhlFkELyE5A8REvgHSeijyEs3
	JJso+A9nQLS1V3uuFw2IDI224AJUMaRwXs6IWRHlSW1OZG6BdZhwdaJBlK8NaMNmea+AIWrbAcA
	6G/EdwgkurjIJIGW9Kb3UghuSxYQzIzL3j7RhVZoOIHx9ao63uY4LEyobeE+glQ==
X-Gm-Gg: ASbGnctYsz2gUFDyCaik+sESjxNQkRjemgLSs1iWbTl4RnEm2Fl69nVBMgyRzSNvbI/
	Hmqs1kfM/R4XeFrsvziZG0d9tVm+H8yRSkdLisgVjw3glS0tcGjUvKC+W44j33AIMSdlcURlkLY
	Sx6HnQCx4L0sFrLalZh489EHHQI3pduGvACEC84bDAb1lQg2ugTtIC6s/dyq8gPmkIlyYeehCaN
	xRa0XQZIAbeTn6gzpJCttCYVKtXW7lqf07e8T+9lbkstWKtQGl1j71u99OVqrDyV7MyezNGMsLx
	F74BOEUwlTZ3NsqNirLEVaDN0uOEcnirb3CVdFG8TkD9k6SBilHGJ6A9PmUKsLya+6PyS5Hl8Ug
	=
X-Received: by 2002:a05:6214:5005:b0:6f2:b551:a63 with SMTP id 6a1803df08f44-6f2c450b587mr75957886d6.3.1745019450695;
        Fri, 18 Apr 2025 16:37:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrnZTHVGZqFXPA5Puw+FySMHQJHQ46VuEitEwFPJTF/qNvZ1Q9C6NJS/pbT3++86Ymlzp+LA==
X-Received: by 2002:a05:6214:5005:b0:6f2:b551:a63 with SMTP id 6a1803df08f44-6f2c450b587mr75957586d6.3.1745019450379;
        Fri, 18 Apr 2025 16:37:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f5fe8sm292796e87.232.2025.04.18.16.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:37:29 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:37:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
Message-ID: <zo2oc37adjjryesewvsnlk5gw25bol46zqqkshfi7yzwbr2rot@jocwv3ff4afj>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-2-05d65f084b05@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-fp5-dp-sound-v2-2-05d65f084b05@fairphone.com>
X-Proofpoint-ORIG-GUID: uQoyB4c0NcDbhBMaCjVb_N5IUg6igl0m
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=6802e23b cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=jUvTS9cEMoV-Kbj9yZgA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: uQoyB4c0NcDbhBMaCjVb_N5IUg6igl0m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180180

On Fri, Apr 18, 2025 at 03:13:43PM +0200, Luca Weiss wrote:
> Sound machine drivers for Qualcomm SoCs can be reused across multiple
> SoCs. But user space ALSA UCM files depend on the card driver name which
> should be set per board/SoC.
> 
> Allow such customization by using driver match data as sound card driver
> name.
> 
> Also while we're already touching these lines, sort the compatibles
> alphabetically.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
