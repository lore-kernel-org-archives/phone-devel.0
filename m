Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56ED188596
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745606981; cv=none; b=NTk5xI0sdfa0Wn5rVLkUq6s4NOrlU3t9nTYgdwpithfvROMf2Mxs0y2x+CCP7RgFL0CAyRKRC24mxCxtvKUwQpZKB7mNp6EBy6c3gz7LT8gAGrEPzU4yrSvOT3rljCIBRecdedx5SWzlW6wU/siQCiq6Pt99G5SEeW7ilHtm+mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745606981; c=relaxed/simple;
	bh=RneatS8jBZNd3NEWX3fEjnR61uPY8UIAAgxyzxoZsMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WddvJKbzBPHtCHaJyx0JwkEI4sBmcNU5RbtwCKljNpOMj0GXpWDA2PThySlagRI6STh8orv4bYVS9bI0JGktJAqB6kYTVQxpC5I+3Bd4dru1PLRxD9eIxkANxCejg298jQ9csGeEDXiZJ1Hd1VOIIspl4EDMO2lw+MLplIp0NrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxhYNBXn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxhYNBXn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrcW004021
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x1Wut12kvCNJz+De9wNvp9Hw
	b3L5Js19Bom/bF2EeKY=; b=lxhYNBXnlKsP/l8aCYiQmV6P5tw7E2BocR7YKujm
	oTDtmGQoPf4boqnnvUX8YT1cZkFvPsalIjfvb4jLU5iWvzgWc9UACXUukBDJcMnR
	y6qP+0soiw3rWxn86VlnOyZ+gShpaSvIw0wv2UoWeyX8cz5KJs8i5cl5Ka0SIWaa
	iy64rfVKv3wO8IBZnQSCfcsMvmpol6rntsKOsSuDNhfn0vkwq6qahyBc+1TEhKg0
	k9TX3iuUCdo1/LJJIUbjnC+NnPg70PZggYljCBuZL5f5V8Ku3aFRqOi6VAN4xeRE
	a66WcX85YToo93+jSlRchsqDG5faBFAm/xpVLoUFFpcsDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2a3cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:49:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5bb68b386so728302385a.3
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745606977; x=1746211777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1Wut12kvCNJz+De9wNvp9Hwb3L5Js19Bom/bF2EeKY=;
        b=fGpTjaWeQgRhJd1ciPCVpCLMS2cZx4ErlK+Ec26yJ55Cq5ufJo6BU9o2xE7p1UTj6t
         I1CvWDCmQlyw6ifJ2sw37JB3YjUSy5r5kWHEj/PVuFIRd7p0wCoKZNKGSuERCGXwdcZz
         wBwWrmm65aO3XPHdnUlWFAfCbaBj6gbxVSHkyJynfRlmgqLBn7gQQJ7vCOibu5sP6vwG
         z+fSNPXWCD7VyUeTvIDA4CxikC+ilg+9X8mU0AOAFErERze2a8cQa1X0bqJPFaDJUJWT
         vesDljFp+0EHkt0E/BYhO9Ga2YpACTEARlMhj9ttxpoOEa8aVL3uJ1XJbZVIIonr+4BL
         M29Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1Ub0mwf0XWvVUQd0eEJcgzu18TqppYRoC2g/sLJxu3E5nR3PtKxLJHdI/A9Ipqpyem2hsfNyfJzYm6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC+GphceM2nQYZ3jN8yA3Wa8ylcQUJxLx/Zu/yuRJMjBkdyCdi
	EegfknXq+LrH1p0MXWbshzb9TyzVfW+l3oKci2YUuCddr5zAA8Nyvs5EC35lSWt1ttEmUtVBfyv
	2VJBTWa8GaUVLLrVkmBvdd3SYkfgTVlti/gmg6dHxP4hkSIg5OgY/O3qqCN3tfA==
X-Gm-Gg: ASbGnct34iJrPrmADvcsOVf6ltYi8KAB33jdrBCXlEJxPjOQLbIVlpSsLtl1Jm2kb5N
	L4K8aQULsupJzGSSrpUpEhmKhx7mMzx18EejPrhhXSfmX9oVfNXchJBcoXul3jZSZNp5R44iTjN
	1/hOWTCwBLbX1+e/w6xjy0YHOYjbPpVNnm0IUKz/OuoP1rLDY5fIgWDVQrLjsINENJ/zcKsrCyB
	pgJS97/VWr+QAmG0xsgLk0h7woo9VIL6iThBtjICUTn0l49w9ZMLrw6U3I8vWW+iJsd6PcxnYRT
	WvVtkpEJbP1jfHsfXmf2o5GbfK3RoZqyNG9PyW+2Ou1YbBFk40J/PA3Fr8Mzve9PuiTEu1kC0dA
	=
X-Received: by 2002:a05:620a:4628:b0:7c5:4de8:bf65 with SMTP id af79cd13be357-7c9668bfda3mr136847485a.36.1745606976784;
        Fri, 25 Apr 2025 11:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFixpTIh9UohupnTvYjAkyQD8NuRNclkRjUtv4PU0Loqn4qq6wPUiPcvzkwrjCCdxtuuH0pgw==
X-Received: by 2002:a05:620a:4628:b0:7c5:4de8:bf65 with SMTP id af79cd13be357-7c9668bfda3mr136843885a.36.1745606976430;
        Fri, 25 Apr 2025 11:49:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca8677sm687754e87.175.2025.04.25.11.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:49:35 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:49:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] arm64: dts: qcom: qrb5165-rb5: Use q6asm defines
 for reg
Message-ID: <e3s3jlwayij4uxtdcekvs6ei6cfkynbolvp4tmkac7elehosih@76m5wond2dyx>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-5-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-5-28308e2ce7d4@fairphone.com>
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680bd942 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: Yx_VWKn8JPOFSahT7SgfLETFas0A_E8l
X-Proofpoint-ORIG-GUID: Yx_VWKn8JPOFSahT7SgfLETFas0A_E8l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfX79IxRHIsaxxJ 6XcbYf+WyFNWb4HQw4bgpnq2e/d2iLiUHc4x5Qr4SuvlCUZYv2mAl1MhvRiS3T9r3DXmC8LMTSq dv/PvzcvGmfvj7iHicdoo4yY5sloVo+HSbtNlLX0cfkuo3Fvy/dHxI46iYHv/+LyfUAEvjtVwu5
 CfnuCl6IAMZGxJJ2GviYDsElQxsOIXGsKPvF4WDN6tah44QnrenS3dJHi1fthOq0UxXzjvD7aFT DJ36DJNMfZlvqvSMGyy/g15jwS1q6mFFeG/bWmqnntnzz1teKjEcU60KzRT6EJzL71mMGIL1GaX BwN5PsK+63Dr8j6YfUOK0k1fGj/hFt0CzcEPxp+bUXzk0yiyItJ/tEcFxF5WOs1757dTJ1hNa++
 6vPBZ1Ehds5+MfsCk7knqs5FFiSmKzrYNQrPGVd/ppuyQkLn3D2rR4NguIVHVJMhR3KwMg5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=670
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

On Fri, Apr 25, 2025 at 01:53:44PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
