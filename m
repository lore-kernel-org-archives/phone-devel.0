Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5494236426
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572082; cv=none; b=WbK6I0ufwkZLqD76TLPCJOQHujYrniPFCS9ArWK4KaCtvpwK5jfe6RR2GM5GEfhtGJ7Hr057cnOc0nd2WIFKXNewoMH7cwhzxUk3olh7tmVT74A8+t0WpxHuZkFBYTslnq1GYfmoTmekYL3hx69oHymB2eO4mw3K4NR4o0VBFOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572082; c=relaxed/simple;
	bh=DsjDnHtiCgBweWj2Z9rRF9NFYYy/5gSoExnp430J+Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zxv6PLZJTDa7ApSfkTzaCWs2Sqi7IGJ3aMgl7zW9HLGbAX8wNDm2D3fdXaT9tMZXqjcCy1yjXXEd1P4WNh0OgPzpyB80W5xiiM7mRzolVwjCjtI2VTtcVQktjlohElmoaU1CXcCJZeSCDBYIVfYvJ+GtiBOm6enmIRa0TWrkOX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R37HHpOU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R37HHpOU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8THF7012293
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 09:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E7YGT9JoWm91VFNYG/u4ZzAL
	7c7lgU5OKZbu1IKjJ28=; b=R37HHpOUIk4ozHJYiR/Vf6YEkpL6IJnwmqdF+5D/
	Efzded7xua0q/u+CyTp9Zv6jKWBABfo7lgKiFApdm9UcbKC4jIf1amT0KxH3bbLZ
	FLWfEcCHT3wCUpHOqxSJ7752t7yf0yAv6XvetfRfvEKikA3uUX1Yx5HM8+azt9hW
	YQv78cpdaniUK/Bln8YCUxYmNVgQ0UJOsyyrXtNUb3FO/+vSAjCe90T2z5pPzFea
	mU1OG55KJ7uNj0zotoSiZhxPf0x/2Mj4APd9uY+bzL8UGZlotVbymTdvZ8o4b9Db
	zxKz2YpdNGirhCI/apCdUe3tRMWdP2hG2BDSbijWsWmAPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh18ar9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 09:07:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so253840285a.3
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 02:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572079; x=1746176879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7YGT9JoWm91VFNYG/u4ZzAL7c7lgU5OKZbu1IKjJ28=;
        b=NuBCiKLINOK8Ay1DFfH9uukqR/9dCefLaAiahcsMp7OHD0qQniQ3dQbKnGqIHVNKLu
         mgqV2YZPPBxmbrd4wwvQXupqeOOERF0WMVcoB55YdH+dnUWEVWhfPYLan32sxqHVWrUz
         orsQFKdnxEXbqh3nU9oMAANim5gJORADzGM/JZ8IeeEovxSfRAd4Mp79H2B9eYmC/JF1
         zb+FkeItrvZwk90wdpyz3sDrg1sjSeoXNE0KMMKxQfmS+kahw26w5WDLOh2zATLpAQjf
         cV0cepLZ3fWGMis+6+R6r8TUr4mdPr3Drc/BPikrzQkGtjyE3WDlRnydW21yRSEufnRW
         VuLg==
X-Forwarded-Encrypted: i=1; AJvYcCWuGycuzEw6R9lHa1J47OFNiXg0RinXnKe5mi7HIMzITR3ek6AaSkjvPsT34axMGU3J6tQaKJ5br4l92A==@vger.kernel.org
X-Gm-Message-State: AOJu0YweVtojl0Hs1J8dEbe1LEczO5DwBF4OMXsBw5aKlcrCbCcFICVO
	2TRbN0G0YhFjTjGVD7K+2pOc/BwEI9DiAxqYVI5RNg1Vo41+tMAEMNka2h+FdNYSZOQd5R5Gsld
	PY2naH8NB66vPNe5Dzg67a4wb5e+rIW4qZld9AxGYP2Aa7yz1qQHlGNoabM4VxQ==
X-Gm-Gg: ASbGncud/1RLZ9BILRLzoX0M6nhJ0jY4p8HJlC4x+1Gbwu159wTy0Tj5mk71hZ1pKVa
	7kVFbujqVWi2GJ/VN4EC22gFAFxVaO4C+sOTIUKMRj4orUqoSiQkhWZEatzo3RpKcrNIkp/O2sp
	VgkmXRA6MLAepB1Za+7/vyefwFtMztJtIMXyy/5rTbxqKtvVo4cYYoFUwrH8FyPNHZ7L+dNRq2J
	05p0vYfRYoiHSegTTtfgXyCw/dId9ohD5pyssJPSGKWruIHBRRXbuzx5E9UPLf6axz7erXupuWW
	9EYnxAY1WD6HF/wgqIm/Vbbme/3GRtDjAJOi/HyQMAoA0RH9Y1cixOy0xKpgqAI7aBYtsH5dl3M
	=
X-Received: by 2002:a05:620a:1b99:b0:7c5:a463:397b with SMTP id af79cd13be357-7c9606e0b7dmr246311885a.20.1745572078688;
        Fri, 25 Apr 2025 02:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHpqKgmY/joCABcKakjj51b/bf9LSO5bp8KVEFf7NSYBd5yr5G0Dj8JO9ClMIekjeU5G8jvg==
X-Received: by 2002:a05:620a:1b99:b0:7c5:a463:397b with SMTP id af79cd13be357-7c9606e0b7dmr246308285a.20.1745572078331;
        Fri, 25 Apr 2025 02:07:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb83dasm520591e87.249.2025.04.25.02.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:07:57 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:07:55 +0300
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
Subject: Re: [PATCH v3 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Message-ID: <cgog34zs3e43n23mkt35swvu2ibuoaav4ccrhjoizg6b4kgc63@36blexv25aud>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-3-7cb45180091b@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp5-dp-sound-v3-3-7cb45180091b@fairphone.com>
X-Proofpoint-GUID: 8kGPED_-t5ZbYHHImbRScPhbVxDjIpWI
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680b50ef cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=EBsx7UlYEkoSbB8InyQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 8kGPED_-t5ZbYHHImbRScPhbVxDjIpWI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NiBTYWx0ZWRfXxm6NBl8DDg7s BODZHZuXniFB630hOK7m2pF+Q6gbQEccc/nNa7G/Hoa1NFj1sOx8lW6p6qfFbGq8es0RGLgKQ7K 4R7BU6xB1fbfEHyKq52Y4Sl/RmXxa2X5EsOnhmijf+zchaDlfImHmEY7POltQP/EgkT8ipCDpS3
 +EinwigohJR9FzzLrG4I+X0wbMF0Rpsv5mg33PCNN6DTlYi8FLsY8tPgAal5YpBVrVuwxtsOtHa N9apt1gzQszSHvhP4KzmCaNqcqAtuykayHid1vbb1ImJJoaFIKyIGQBDQYeUbmHLSttDUuQos85 6GUby0omGGJ0iqtzEVO513tOh9sUCyoK819fKZTIqvdsGGTbQQF5T4AEZDBc9JWiu/HGaitKiFm
 mLxu7YiGjan0oDcKeuf/S7guhCcSe1/J8dcMNBk9evl5x+DzgoZv7zIwHhd4GgM2WU1+GX/8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=940 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250066

On Fri, Apr 25, 2025 at 10:07:27AM +0200, Luca Weiss wrote:
> Add support for DisplayPort Jack events, so that user space can
> configure the audio routing correctly.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
