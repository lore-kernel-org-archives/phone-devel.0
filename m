Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBD32D7393
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 05:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765431890; cv=none; b=r6BBj20oTILbCFNsi2WeJAwPwya8Wxq4uNngdceFMoIwEeCJYp/jGVmmxDOtE3nr+fpGZGzOfEF3csx5indSHFjTaDL+oim9gafL551PKQPGzMKkLdyd4aw7iHN263GAJBRSI7zlG1eFnfXTHOzc96KEictimHHykl8rBLbSTVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765431890; c=relaxed/simple;
	bh=SzxaHVHPjqDlmBpQu5Xm2YNMObWyx8B6VBrtONyU0s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfxWEfa5HoewBHRGsPMsh/p9zkkruSOmN6D4iVK/mkjg6r8PDG1/ULVLCAP7m8fcnJRJ7JPE+tA8ymIx2GrFwkSkN4y43XB5SFviz77JqlbX+yDQphwfsqlfgGxoWwPeKNuxVGha2kwKwNTsJhzgNRqyMb4Ngj3WscVvMdw4Auw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGBQbx14; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsP96+QT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGBQbx14";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsP96+QT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALSk3s3563616
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 05:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JLG2w+C3sTszdx4VirmlaHOi
	FL5gN+K2jZmVYvVT/j8=; b=mGBQbx14LnZEz0Emgk0KwuJjoz2lMbaSeFM/9Qq/
	JLTR8SLPUjwowuVwEyVWNPWImBAy8h4FOa0My0wyAr0qS3cjwfQ5I8NLGJo41n6d
	uI9jM/Ow+5l0bGXgPNhf0BEOnOHYlLq8Rr06uhe3HvQI1GxiZPoiIMDoYlp2nyB3
	G388bNB9ewU0UeQ5d8Pby3MpxcnPAecZnAzW0Mpp9dJlaVN6rldmT7Yh1r44Zgex
	UrEJ09L7I7s+tdw4TcaMglVU9Gus5KU5v3dGHScqMjNZqxnA6iInY59H30zZ9Sqt
	lNh/A2p9X/WNyP1lnhwrSLz/xK7ojDEF+o7O4vkUbLyhNw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygtfh4hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 05:44:47 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55ad466ad2eso422153e0c.2
        for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 21:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765431886; x=1766036686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JLG2w+C3sTszdx4VirmlaHOiFL5gN+K2jZmVYvVT/j8=;
        b=OsP96+QTQ8LNqYFPJWDqmvxvEMZ/7vhOc6MlNR68dKRQGV7njBQRCo9Av0RMx04R+O
         2RvmbV9BBcpRDnuE2ML+tJYajI7WoQ7KJoX5ukP5VzNYHGqmZn5xA0AbtQU7Fix5qW7a
         hp6O8Rmq9QSEJF7f8Tm1pKcSySUsLaIPljKkTGn0alphvaWxraxMcS4cQVIwQB4xRuJc
         F/hGHvSMz5u9iwXEoWra4z7T4V2eNOxW7/x+zZdaoFDNjZpG2lfV9T9mvt7N0GQ+oKge
         zGU+yl6b7tyn8Q2LMY0p61RiqghPbsDw+lEvNuNGcpxi4qwC80HziiapRa2Yy3sVDypG
         h0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765431886; x=1766036686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLG2w+C3sTszdx4VirmlaHOiFL5gN+K2jZmVYvVT/j8=;
        b=HcYAXvMQY59ZJR7gESD43xoLpQgE7nKun5xrwv9jQgvNvVYjO+kg4Av4sblgkoLol7
         vobsORDlB5ZeOVJnZX8wVYgFx37KLPTxIm7F17oO8ANwmi5SRZ7zeUIAp0g8vmaa8B3T
         XrVuDi3oJ+yHhMrsDIL4/UDjAQfJ7jSTs9/ZNdYLvSpvcYXfX+8pGlc7OXHxOw4ZQvMq
         3z+Ov00AH+8PSe+kwN25yw4N0u/bAfYGADaYkkw+3j6fdqdClEdmPPcdbPKGx23CqcYd
         2gM211z56cgZLlbppfu4KYeqClQWswxx3JKNsyUWi/PXka4345azpoipFR9y+DfaTJ/w
         jAqg==
X-Forwarded-Encrypted: i=1; AJvYcCVuR7nt9JL0PC/l/3fPCLegNbL9RWDX82h9CkDBvQdKGJVhQCWWEntzaPIFZ1WLCuTfjhOy2iMuNG3L7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQBBVeqRVevLGf+r8S/ftr7/zEHb99w2DCvWANgdPlu8B3dCS
	SzQJ/XeBpndEIZ2tBduZXeMRY9UtTpulkSd44F8jByfayPPIB326SwY1o2r1ANCyioERlsAwRJf
	EXMI94pWLf96YIgunR2HqD9aARD/ojSPQO4gemtmt94RMmwOpfdRne+TN0RJlqiMBXw==
X-Gm-Gg: AY/fxX5F9hq9qH52CjTuL+TkpIM710pHohvM2yG5EPoufMo/pZuW7UAjXkF6CmjdhrW
	oQXrn4i+ppzu8ZwwEPXwHLYSdipB6r8J6OaLKNeMg+pE40T8OThmcwkHhGj0Zd8Sjs3i4xJFYfA
	AlwvwXg3yLZb8u64r3oW4dhsewjFMULB8XA6kCXO+Sv5Pjh2zbeaV4h1rK22Mso6vg6I1YXUB+R
	uyNXSgc846azRSlfuz1AETzpjvgw5uK1Aii/a+nD5OjgtDBQZ685EtH2G5EZDGCLoQFylTcwTgz
	ufdtZXeQrfmrh1AzC5qXZG/I62H3ssbW4ycXwRAUKWryO+ugRpswG5ytcvI+SDLWuWFfqWXsUBU
	uaqY2UpD3ngKH5wX7nRKNlp5U2GIGbMz4/oPV35krKgMbDicgqfOFWXrip13RvNP0C80WK7kESk
	7bFQJNwkP1de/lbWdkpod00Ns=
X-Received: by 2002:a05:6122:32c4:b0:54a:a048:45a4 with SMTP id 71dfb90a1353d-55fcfc5104amr1538459e0c.16.1765431886198;
        Wed, 10 Dec 2025 21:44:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGfi2cilvQl8uWCLP+ABlqrwXcWpY35vi39IvBW1eJLuXb5tc9Q5Oi12IXGio+bfFJJkuxng==
X-Received: by 2002:a05:6122:32c4:b0:54a:a048:45a4 with SMTP id 71dfb90a1353d-55fcfc5104amr1538441e0c.16.1765431885725;
        Wed, 10 Dec 2025 21:44:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbca6c62esm3887871fa.32.2025.12.10.21.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 21:44:45 -0800 (PST)
Date: Thu, 11 Dec 2025 07:44:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Introduce Kaanapali SoC
Message-ID: <drbc2hb5hv36s2bzxaalfnr6lcer7zfyexnya3xpi6ltlhw6et@6gu5s7wfwm26>
References: <20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com>
 <20251210-knp-dts-v3-3-8dcd52f055c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-knp-dts-v3-3-8dcd52f055c2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=At7jHe9P c=1 sm=1 tr=0 ts=693a5a4f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rz-J1vZrXhXIdLqqZeEA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: xLd3RVuoAqUR3Cq0uA9C1G5K7eFKFiPC
X-Proofpoint-GUID: xLd3RVuoAqUR3Cq0uA9C1G5K7eFKFiPC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAzOCBTYWx0ZWRfXxZ8fA0/Gf3ql
 0tnCvCdKbkGJsT5BEhilE+/9h4WQwMRQFfALOgFwLM5D8IKK9B49aFHBid1/vlj5fUKH4VidgVx
 Z/ws9X8/KxABFR/XhjQdhbRMilbxMKUWAwnyJLYd+NWm/fkdG66P+AnJfBwTBI2p2Blx2+0RhNd
 Lz1p19g0x+cfEn+gsIiwNaR2IxaSaGhg4M+HIXpFkwzM+nxgPAuagBobSsjOboF5pI5WN+a3IMF
 bsxLNHZCgY/qfGpLo7V0KLkYVVnRu92Ekvj7wdVaXBoAiSbWbCytnJHEdbqYpmaxVCuG5emOAJL
 p5RyykX4mbqO2Vh5kneEyetoR3NsDXLYuaG3rOXf4ci0w/aiNdiDG2s8rkDQRao7CtECPDE4vEk
 9mafupWerqno2TiU2v+XlQho65tCVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110038

On Wed, Dec 10, 2025 at 07:05:04PM -0800, Jingyi Wang wrote:
> Kaanapali is Snapdragon SoC from Qualcomm.
> 
> Features added in this patch:
> - CPUs with PSCI idle states and cpufreq
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect with CPU BWMONs
> - QuP with UART
> - SMMU
> - RPMhPD
> - UFS with Inline Crypto Engine
> - LLCC
> - Watchdog
> - SD Card
> - PCIe
> 
> Written with help from Raviteja Laggyshetty (added interconnect nodes),
> Taniya Das (added Clock Controllers and cpufreq), Jishnu Prakash
> (added RPMhPD), Nitin Rawat (added UFS), Gaurav Kashyap (added ICE),
> Manish Pandey (added SD Card) and Qiang Yu (added PCIe).
> 
> Co-developed-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1606 +++++++++++++++++++++++++++++++
>  1 file changed, 1606 insertions(+)
> 
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		pdp_mem: pdp-region@81300000 {

please drop -region, please be consistent

> +			reg = <0x0 0x81300000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		aop_cmd_db_mem: aop-cmd-db@81c60000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x81c60000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		smem_mem: smem@81d00000 {
> +			compatible = "qcom,smem";
> +			reg = <0x0 0x81d00000 0x0 0x200000>;
> +			hwlocks = <&tcsr_mutex 3>;
> +			no-map;
> +		};
> +
> +		pdp_ns_shared_mem: pdp-ns-shared-region@81f00000 {

please drop -region

> +			reg = <0x0 0x81f00000 0x0 0x100000>;
> +			no-map;
> +		};
> +

> +
> +		pcie0: pcie@1c00000 {
> +			device_type = "pci";
> +			compatible = "qcom,kaanapali-pcie", "qcom,pcie-sm8550";
> +			reg = <0 0x01c00000 0 0x3000>,

0x0 instead of 0 (here and in other reg entries).

> +			      <0 0x40000000 0 0xf1d>,
> +			      <0 0x40000f20 0 0xa8>,
> +			      <0 0x40001000 0 0x1000>,
> +			      <0 0x40100000 0 0x100000>,
> +			      <0 0x01c03000 0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,

Also 0x0 here

> +				 <0x02000000 0 0x40300000 0 0x40300000 0 0x23d00000>;
> +

-- 
With best wishes
Dmitry
