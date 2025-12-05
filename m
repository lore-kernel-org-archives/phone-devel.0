Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA463249EB
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 20:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764965337; cv=none; b=cEKbX8sQSuQscRimXuqcrW7zQO4YevDMxLXVL6OtIXSxiwk1C1sUm/Pqta9FFp+tCKADW5OQiEyiz3J1pO/JAS3HZsXJJlzuKOF/WHdMOQ3rNwvRz8IQgBoxKKHEPL/07kQm4Xmj+Jl+NDl5TWJEs8DPT82dwilBSSDtBtLpXGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764965337; c=relaxed/simple;
	bh=vigY2/+4S+dcshygC8cgR4hp+bMwZvN+/Iyrgv7ubq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4PGReNNjBD5a6kX0x88ona3K9WEN1GBe3LFhEpHr8+f0xBXCqdsNu3Z4FDfiFgXIuyEdolcfK0FzsOXDM5+p3Be7VeQk5Q5Bg2O8TLcc/fwgjMN/VSK7SSiPdxItYbWTrUe6IYbr8WCNXZOp0kKLtK2jOGiQsE9clqEkh/Tji8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mh2+Uxaa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4US8uce; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mh2+Uxaa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4US8uce"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBGVr1075456
	for <phone-devel@vger.kernel.org>; Fri, 5 Dec 2025 20:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/APX3SKzRzRQrC49KOpCOBlj
	yQ2a4+U70ImT3ofQZTU=; b=Mh2+Uxaa5IoDQFOLvoWfL5u/MYCT/04hArEbK4EI
	zVofEMy9B/3bOebDxdQ3hX+ZKYxal9OV12b6FvYIxcyudnsuUP8GVIsWowTgipD6
	sZZlAjZKuO1E39Qi5ppUZwQ89ndnKhBuvNQLS4o3+k9N2JKQuOdMxYbNOmfvcBHJ
	t6EeOOI2kQ78bWg2QJc871Q/EpFCkADi+FhCEq4kNvBbdYN9eAt30kzbeL7/Od4B
	2KtflZR2I4fc16s9Mzz+6jOEha5rPW4gstCnh/SzM+tp3pkg42l/GUhMVSPKpQzY
	xXrHPv9uWAwfBT0Knwc/4S4WmBJmfmYwckRxI91gNKN+nQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av0ngs3fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 20:08:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b53c30bb59so587220785a.1
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 12:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764965334; x=1765570134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/APX3SKzRzRQrC49KOpCOBljyQ2a4+U70ImT3ofQZTU=;
        b=a4US8uceSKsE7/fIiGPQcEX/f8dDJV0lnl0WdNC4K73ft/wgN5SpIlAOA5fLtc3pA/
         ep2k5eTeav0rBmCi4RshBxpV5yoojz5kikEmKtik2/x1waT4bRRFmVnhsCoFSIDn0CZG
         DQXy+wdQnyDGWmktyjPfrKxbj/iMA5Rs4rnX10btsv+Gy0OQ1fgHG6j/Kf6T9pcauNc7
         /A7J2M2nulp+dII+wPfHj8S5BY0LqBINDhJS9RkhPtRziPVmwVXvArxISp4ukzqZNLrF
         AbL6PpfOCwR/SNidHkPtYRVOyHCIkc9L/WV0q77TNps+KdJhwwyLE6vKOj71XO18yahY
         YgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764965334; x=1765570134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/APX3SKzRzRQrC49KOpCOBljyQ2a4+U70ImT3ofQZTU=;
        b=aGb4Dfn0rtgpvRLMVeCtj7wImu6PTbe/m4D9EA9VkHubZp5XZjmy4VSatMjfY/oncd
         TQ0zT64NJtV0QNu5oTpx5btpqaVPQ/ITg6aIy1GU6OCug+fvVWFiAXC9wjcyJtM7G3Jt
         9E525+I6Rx5pqnsJfbkzEj8HcGLyEwAv2QPF3nvV2SVfpTny6Lva5gz6wnoJmXHJhohp
         PHJVFncirdexwH0L+1aJ1BvUDcvafpPAY1ZZ8wqFA3i69cyjH2fJPZsazhlJwJnKWNvF
         P6Mc0ULEtTeVIOTyePY5DzsEklwl7QYeqAq388Xqf6qM8mxJBZZLWHj4wmuRVAbFFT+7
         mLJA==
X-Forwarded-Encrypted: i=1; AJvYcCXxMB6ZzM8zy8C3plvogcZ2vH47e1zspxBM+yHr3I1GyePEZFXy3lMltUtwwBa8R+1LpsU050tIVa+3Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoTeUPHAKlHOUF6qNgX+/uXZEkrZJuBR4j1qSb5jDnUqHEZGiR
	9r3NWUqAojVObQ84KfvxkFTbtwNoXHdrog3caMlKB9AAp1mancE1OGoe3xHztryQZbrIneSERWp
	Ps1QcJGBKNjV8VwDGBkyit70NvuceFkhccBL4XPbQgVnIGKFIsvPVYMeW8ij5C4N5Hw==
X-Gm-Gg: ASbGncsmBimbgDZF32t39S50jUE/NQUJ+5IWkvjZCb8VZ57msxDtpT1mKUxNYJO4y2r
	B39yRjwhj9YntEWlOqDWgzDC1zhVvxu+V0UXMXpMiWUQSNgce9CC4WSI1f0g9D2oldcUGlhBbHc
	RAvQEkM5hpl3UC0Kh6P/nOsmAgeD/OaIUeJqZWDxCi8Npx/VI3leZTfM2bd/1W9zlYPDF797zTJ
	AkMeWKCfmNgChHSqZ8OYB+PeU3ZpNeRnh3MZnYCloaZcUaJeB1/u9vRbU2ksYnz0CLzmpaODIAb
	PuTCLAjmfO0XYYV6V6pYlBRG3sfph0MIEwNE2QiuKsI9QAd0e2vs2RQqLdSCgr4wjCwesQxYTnk
	nW6T/B1aLB2Ss13MixSGq29Xuyqvu2glrWBCnqB9pX20mqmCTfiqIdPk/lsTB41oxZjmTQLSGgb
	ZberDPPFPImrKObqUFlGUgoTM=
X-Received: by 2002:a05:620a:4805:b0:82e:ce61:f840 with SMTP id af79cd13be357-8b6a25a1750mr41529285a.84.1764965333907;
        Fri, 05 Dec 2025 12:08:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGr/2QpqSA2EBmBu9tulOdTNzGFSvOR5YarKCvXXll9K74qqwvmZLVgH3FfutAOvTPlfELH7g==
X-Received: by 2002:a05:620a:4805:b0:82e:ce61:f840 with SMTP id af79cd13be357-8b6a25a1750mr41523585a.84.1764965333424;
        Fri, 05 Dec 2025 12:08:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70595ff7sm16610091fa.30.2025.12.05.12.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:08:52 -0800 (PST)
Date: Fri, 5 Dec 2025 22:08:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Robert Oscilowski <drgitx@gmail.com>,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH v3] ASoC: qcom: sdm845: set quaternary MI2S codec DAI to
 I2S format
Message-ID: <zepvg4nhpihycmkaynemesuvurrp5hwafdqyvxu4gtfojllhw3@a6sy4dwlbndm>
References: <20251115-sdm845-quaternary-v3-1-c16bf19128ac@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115-sdm845-quaternary-v3-1-c16bf19128ac@ixit.cz>
X-Proofpoint-ORIG-GUID: 1ekCsYwIYmhaobEIfErAqkBFin1eI6ZA
X-Proofpoint-GUID: 1ekCsYwIYmhaobEIfErAqkBFin1eI6ZA
X-Authority-Analysis: v=2.4 cv=DrNbOW/+ c=1 sm=1 tr=0 ts=69333bd6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=bXZNhGde0p5SeuC4Rl0A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1MCBTYWx0ZWRfX3C1TbfBMUlTK
 4ZRC/DjEoqnnaQsQ0Z1/sd1TOlgp1uKZhocZXZo1Dj+MEAU1HsjEeUfmdQSI2O84LIssKua+FjS
 PXXDXQNyb4dEPrr4+8xyVH5QipPCft/KVBxl0ABUHlKE73uJa81KD5iZktL7liLTISg6jpLhNAC
 4XZzBZQ8JJldfE2byaiXElPJjLr7a2xR3JBF3Y3Mj1tt+2u8HPIzmyoI8TqeXLVGDnq4APGW+58
 huQSQfoRgmI24miPWrrCU/Q37YjeV6VbEMdPaz1JpfsfQ0/68Wm8jaoanLcv7AkXunSHkUGfMp4
 tzov8NX8oWgdqMHdIP9y8Ui8zBTwNbwtUEv2JR3PNCu9TyhrW2GsRllQTzk8lRRQX/n5jEfSiu6
 Cp382zRstGOPM9jbspfcy1c73Bu5Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050150

On Sat, Nov 15, 2025 at 07:43:58PM +0100, David Heidelberg via B4 Relay wrote:
> From: Robert Oscilowski <drgitx@gmail.com>
> 
> We configure the codec DAI format for primary and secondary but not the
> quaternery MI2S path. Add the missing configuration to enable speaker
> codecs on the quaternary MI2S like the MAX9827 found on the OnePlus 6.
> 
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v3:
> - Updated DrGit name to real name.
> - Link to v2: https://lore.kernel.org/r/20251114-sdm845-quaternary-v2-1-9d803bf5f7c9@ixit.cz
> 
> Changes in v2:
>  - Rebased on top of next-20251113
> ---
>  sound/soc/qcom/sdm845.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
