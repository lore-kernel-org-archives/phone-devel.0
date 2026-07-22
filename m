Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DD2346E47
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728527; cv=none; b=uBSoq7KYBraOE8wmmnFPU85svJR6DebqsFTFhdb7KfoRzbOwQFdZVZ/i6bsaXXF7Ec6Vkvth2FjIBPBNpEe7Bxm0823AaWvzY6FMQ2VK8O7OCopUHgOpprS7qucxfFY51bq4PvvlVpzk3JywSSYoWSkJOw8JJ/cVCMGagfNPyeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728527; c=relaxed/simple;
	bh=apMF4onMMKGeoyRXbjdc24RW9Ik+vI+CDP3tUozGxyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlRHMLT0uu2jS+fHbDW8N4CNR/RABjbuQEqp0aOMT0MZ7xYJdYgSQ4ccuMz6a0E6chN2Vu5ceBp/hO1VkZK3dhlgQm6If2QB8mgZFctJlrcy2j3QaoslqrVodyKuXQbdGckHaWO8pmhDUCOibaitiCK8vGXftMQp047bH8DXUWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuR+YL+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUhr5mL9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuR+YL+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUhr5mL9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWPMd1155261
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 13:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ovmlg0nl0GlPWIERCFc1imTf
	ytD2OgF+m1sgbG310T8=; b=OuR+YL+jAZzRfD8ZaJNbpC1ocuIzXYzCB/vDxXny
	LRQ5KtNaDXOTvRg/OFfGJHpGr9d2L4wGah/dWgIJeOmlGxpUGrIQ9bINFGS0ntoY
	N9PC2KtDw9WeV6bwOCLD0c8BPDso4VAtVJa2PXomcEnrQ7DrQmpU66H/ApbC4FCU
	xygG4fsU0NKlvDirM4vcd8hYYoN2IEl9fYx6nsAyr5A6muuI1hF7uTvIaCEsErsK
	HwzgCPF2Cn1ju6Xh51FfUwTmPI1Qdq3LrfkmYT4snMbC7Cqs4NH7SzmoFzhLqOgA
	kVVozlx1EbsHG9NNIuD2du99imRLxmi0LPwzTq22gcLa0Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt1ree-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 13:55:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so184675631cf.0
        for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784728522; x=1785333322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ovmlg0nl0GlPWIERCFc1imTfytD2OgF+m1sgbG310T8=;
        b=MUhr5mL9A4y+nvp2el3mbeCOHm+eSdEdeKtJBacNShVomU1De2wG4nbW1eewO3rP7S
         NnxNJT6tFATe1oJfHXNrfm+Uy4pVh6tp45iknLmA9sF61z79z3UNXBQWGAWyGr5YaPWs
         8EUvxJMPUMbptpmtBeGIXHu3PSXRoLdBr2goGNsPx7Zqb2uZz5otqc1AvC2wjQZONDBK
         dd9CyaG4kWsZjFY2kU1k5OUNkWRcrB7NxUkQ4bPbTYy0ioZG9nURgbMRawQVTuc7a21W
         TpJeV7UeGxExOn7iaXERfA7WgQ81hYo7eOFP6JDaFKvOkZo9NShoMAb2hATtggqEpFen
         oasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728522; x=1785333322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovmlg0nl0GlPWIERCFc1imTfytD2OgF+m1sgbG310T8=;
        b=AALmtv9gpdgD0aw1eBi3KUYDjODJGkNmX8vyaSxni8JJGJseO6kbp23LZI7v5aoVm2
         z/FlAidE/RhOC1D3V1kC4ZNifttnobi6eM47hseHn1T/+WsaDry1oaWd4Zz5Hjf4Bg7c
         O46cIK0NnBtsP0HC/xdpWBeg3F6aEdeca8OixNMhebeZttWZ9hE3SxWnTfk+Ju1YD98G
         NSzqJvCWVaQ08joJZcWR6RqUZUs5zfIFbm+8rce2AnEMgsepzQIgIVm1worucLfXpKxJ
         juHTLDPzFPd0nH8dwrlFi1kklOuh+aN8MP/BsTjph+ubsuxv3eXY9MFRvLQcsbCm7Ku5
         bsQA==
X-Forwarded-Encrypted: i=1; AHgh+Rppu0MBhWzR0qRuaBaBhONKrRl6uxy5a72okXrPWO283tfZ57pThE9X4n9i05rgXiXvmDRSaehVJ8SK3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YylbTFQ96ZiG9668SoScDY/ofIPqL4pzLQ+wZlnjnPJo7cerbsi
	nnIbXbJqlP09Ql4ha9IZ7vLCqB1N6tgu9nA5G6YlgeyhVc7eaH98g37+N5nt2L8PLwDl2jjLfnN
	Wjpa9cjMj5+di+2vFEkOiQfijrZAkZUuJP7m1bB2Ht1uoHBsXyGj2ZKFq7cSfGPTvyA==
X-Gm-Gg: AR+sD11hm1fNbWEvOSlQ0PK86JOlEgbAM6gqgxAa3fKWGRqzZMCmdlLrP3O4EsRhnCI
	fuf+Y2t/Fnfrzqm5srXJu8DdZZE89c1jTYq1fuyfXY56DDyWkwxzas/VqvyjhG1KAvXKKi/3qiP
	Gvd8j4sFBRCDh/WrEmZuIsD4WZVJrheJ/fojqonB+FL0QB5v2Wo4Knk+ZVemfwqnlOBm7lyY51J
	Ml3D/B4EgpAI2JEaAQrdM68r/n5tgxbtIyhPn3PdsvTZKl0tlg65ONtSRKsBRe+MaSUT4Q9D8SO
	PBhqliGZRTOOuPpIfQ29vQOZanfmU8qo+hGDmKaCyxPqvYA3L1GYyf4UNlRvYpq6+ZGT5rhQR+K
	MDN8VAkC6DdXtJ7Kt3dEvrP9OrWpvldtPvGHGXozKQ8JNQ+iybIb/EKecol0SzCyzpqmteBOp/6
	om4CeuR1Mpij7czQ==
X-Received: by 2002:a05:622a:1a92:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-5213c7e502fmr225487031cf.27.1784728521771;
        Wed, 22 Jul 2026 06:55:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1a92:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-5213c7e502fmr225486681cf.27.1784728521326;
        Wed, 22 Jul 2026 06:55:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8bffesm526617e87.13.2026.07.22.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:55:20 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:55:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: milos: add CPU OPP table with
 DDR & L3 bandwidths
Message-ID: <xyzhicfaaeq7ktgzqy2re22xbbu5il5cyjkhuroyzkxbyqfmy6@c6kkj33rd45o>
References: <20260717-milos-cpu-opp-v2-0-428813fafd52@fairphone.com>
 <20260717-milos-cpu-opp-v2-2-428813fafd52@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-milos-cpu-opp-v2-2-428813fafd52@fairphone.com>
X-Proofpoint-ORIG-GUID: zUcwBc1_Fq7dC783Nzmcn1PbV_ZpN1cq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNiBTYWx0ZWRfXyYY3qWKq+V4o
 QF+kINyrS8js0XAGoDaNZyp2J9o6l063aFUq70LdgEF3dpGIz8XlJrF5XW8lnDNECg32uef50aQ
 K1sve7WegwtSYXoJriL3yscjHfuyCQkCdqTPtDYo7MVNUxjNrcc8bN6//JCi+fvMzrqmbKlP6DU
 COKrqmtS8n6GY21RF6jS3CEnDu7YFm/eMyle0Wk4M/i8KxgCPMbtg/3BsBCjuX5p1RHLCl6LHOU
 91pbSwDMcTp3b+qDAv3mwrIjDZDuo1XGEbjgQVwAbt7bT/bau+HqCeKvOlxCqwvnHYUy+0OjjyM
 QVETwYz8vndJa3q7/GNtupP/QRgaFEP32/vK7PG/Hysv7zSkZTxko4o4a3+wcbfH9ViQ4BTC1eR
 JjAttwQI3RhPXEpTlJm7td0UYE/jCneb+xp2VO83o36P4LDVQXsw54hY1XWXwBK2lh43QnejZ4m
 M76Hp9DVXrm/+YIu0mQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNiBTYWx0ZWRfX8nT4XCUf8xoi
 PwljqF+Muo/NI/GBseso9yz5yHHrelQbIianVF3Y3LgrvOIwI4kvZSN3aqBK05LGFSTva1r9UJ5
 Axbw0Z1sSEVS9Xws2PEPGssueujV/VM=
X-Proofpoint-GUID: zUcwBc1_Fq7dC783Nzmcn1PbV_ZpN1cq
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a60cbca cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=6H0WHjuAAAAA:8 a=944irSvET47UEAaLM4sA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220136

On Fri, Jul 17, 2026 at 03:33:04PM +0200, Luca Weiss wrote:
> Add the OSC L3 Cache controller node, interconnect entry for each CPU,
> with 2 different paths (CPU to DDR, L3 Cache from CPU to DDR interface),
> and add the OPP tables for each CPU clusters (cpu0-3, cpu4-6 & cpu7) to
> permit scaling the DDR and L3 cache frequency by aggregating bandwidth
> requests of all CPU core with reference to the current OPP they are
> configured in by the LMH/EPSS hardware.
> 
> The effect is a proper caches & DDR frequency scaling when CPU cores
> change frequency.
> 
> The OPP tables were built using the downstream memlat ddr & l3 tables
> for each cluster type with the actual EPSS cpufreq LUT tables from
> running devices. Note, that higher frequencies than SM7635 are available
> on QCS6690, those have been added here as far as possible but may not be
> fully complete. Additional OPPs may need to be added for that SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 344 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 344 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
