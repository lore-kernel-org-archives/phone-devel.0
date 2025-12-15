Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21537332EA8
	for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 19:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765826971; cv=none; b=dvG0Tvymb8yR1JX4snbb/mOKS8sUAwKzB/qFYNQfq2XJiGHNvs1N0KDnSn3qDGXhJsnr+45ceAKzozi6lTpXRLJ1UAfb9ZPZx4cLHh44dz3aYe2TEWQmFndSDOOmqB8/pN5Svpc9F0CycXoB3TZ6eIQp3J0PyHYLZTr2S7RU4CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765826971; c=relaxed/simple;
	bh=wztAsnyzNkKB/8QcN0F4nl4t6Cb8hkK3Mj3ggF3tYPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWfmsyR5Yd06X0IpJvAn4jj7jqqOF2gPNmz//eVkY3wO7hCRGcmZ3l6VBTQZeXfDJLOzditCwXXFOZZjr65z9BH1Ccz+94BPxiAUN1VNKPhNBjBjWg1yyLlZjFi1Ajrtn8EmA4/R/gUpgLzez1u5XJkTu1F0Yx+Kcd89qW4Zbsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLzHNpU2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIN4/w60; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLzHNpU2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIN4/w60"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFGjNoD1270374
	for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 19:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/hosArq0+s/NDaQwSKgPN+W6
	lq3BmCe22Y/GBR8QRbA=; b=VLzHNpU2fAwgRR3J8pky5rZGb72kIw4+IIf2LR0+
	WCbsF+uRJmFrq7wQBqk4TBxKWxhMx7Polw4tW1vTg8f9AkRpCTwDtuqoWVkKju68
	OPfMUvA5cHObGV3Bdge8G/cbsnupqzm8yogzK29yRVgOowDghn/Cw4UxiceycAz2
	BC9Cc4GRw8SvFUhQlL86DP7JFn4FeYELayw5f1wvjJG2GVQc7NT/1cHAsAKg4AsV
	voPJOcaAMBUB2x5+FJ3wR/fOZUAqlpArnVe0g8z6Rse0+08cqrfSHk+SAjRpe/ha
	efmHCSatjlBqQIM2y6A5FEGQYfMDfWbRW33o2+QnofiEOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p46ge88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 19:29:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2217a9c60so1358395085a.3
        for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 11:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765826968; x=1766431768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hosArq0+s/NDaQwSKgPN+W6lq3BmCe22Y/GBR8QRbA=;
        b=RIN4/w60bQD+IbaW2Cl+FCcIPWsn9enkSNOCq5wJ8E8BprQ+S4R8EroR1pihiL2iOj
         HmWZFc/oO6GfjNcgRU/E8dCtZt8gkIflnkiCTAiwvhmnuDC3J5tv0lsyDkAGCnSlvkaM
         ho9ttTmmTgSCj5E7OaiITi7YQArRvuanQSl5OJbbXdchQn1kskuXcjNLMwlavBAZyij+
         kuB0Q8cYHNDyeGu6t/REwKWCM3ufD//VX9y+IVr99YUkxiqMUpWty7VLF2Xl2ox6yvSJ
         ncRvvMCCqnbl5d9ifZSsQWVjjZm7fjnQxj8sORMoTVH4eXiju/cio3oguKbg3srwLCIu
         yOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765826968; x=1766431768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hosArq0+s/NDaQwSKgPN+W6lq3BmCe22Y/GBR8QRbA=;
        b=JrR8QqrypeAB3rWvEBg2uoz3QdTiAr9m7L9/dGb/UehFYO3wRfT6es715oaQUdSO1h
         mfUSWdTKsm7AgpaAkP/pOtrMZnfnMusns3aVSKIX3Jxo/Yjt2yhByeW29MogUrRdzxAb
         DJtrqG/DtUTVpfIONa+InrX31Db5pNM6XC9j9yniqbP/qLs4imxIJ78CN6cSg7eSyaDm
         onHVcKEAD2IHIOMO4O50jrsJdlOgE5knn8YtfTuMG3Oka6MX252xeBv1C5yTBfQ2iqaA
         2vroAztikPbntRS6L6+FFm5PmqSBV8J+XxnSJqcSPllqFKG4FwGJTk1GEynk1bOCYVhV
         nPiA==
X-Forwarded-Encrypted: i=1; AJvYcCWNzTARS7BmrY3DtgCyDS6jJeV1GCBXW6IAYIlTBp6Dkk/xdbHvv7/t2FHBtPvV/HK/eeQdj9st19oJDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLjCfjkK2QCYys8GuIzpGCaCxPs9G8fjUmNksy56rZWmNBIv/K
	CbkzlQ/36jF4K2AYy1bzlhnl+TOHqiGzBB+96zXkcQGbHuhrDUdUx++dEgOwEhhp6GNOAAAA7hD
	TCF+Qw9Jr+4tF+/k3z+cy2VQhTfOa5GQLe6zd+vGyqxIz+WpDOardYLan3J7IqB9dEw==
X-Gm-Gg: AY/fxX5geijijwku03Z/l5umpz2ruKlfwwwMethh1AzhqvRfZfIwC0/OThqTTCwkghk
	wuI5i/Y3HXoLNWg9b+SRtu2iOBc04OMms2UZsZjH5cLzIV/fsufl0Mxi1COFX6ohf/nJXQ62MIF
	aShS2qgyUuQw4U4+pDIqEaXDzge9StuDzVCdGvqYuIgBuQp/V6EMr+ZQcJjbbXrgUMDVmqcALn0
	Uy4y770eOpZ1ne0/A+Gvo/APa17knAWAy+F+pZb5S1VPpWk2Y7lWQcVR1AvLsqw49C6eJq57eCm
	oBIjALejmNQIB0ok+ZftbmzdYXX8AmmsJGRzxcn90ODX6m7W0Pnlcy0fGXrbjJVEzBZHhhTVidq
	EESLfW/CSVkoi2HFtYCbISXHH/nvLf/N+B4YjyCtHn/2PHpaG2gLK47eUICfLTFhbSbQ0gazyv7
	oB97GmRkamBti0Ij5KVfQ2n+A=
X-Received: by 2002:a05:620a:4707:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8bb39dc3ecemr1778539085a.29.1765826968265;
        Mon, 15 Dec 2025 11:29:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9ULv8Wr6if+oKpDJxIdczwgANEVhGYhMVVZC45WNjehcGVsIem3udGpwIwFm7P4Cc1yoybg==
X-Received: by 2002:a05:620a:4707:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8bb39dc3ecemr1778534685a.29.1765826967805;
        Mon, 15 Dec 2025 11:29:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdebe5401sm31551671fa.4.2025.12.15.11.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:29:27 -0800 (PST)
Date: Mon, 15 Dec 2025 21:29:25 +0200
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
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: Introduce Kaanapali SoC
Message-ID: <np4txll5unbelh25p45abitemtas52rvvdczenxaoj4errxwql@6u2otevdsl4c>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
 <20251215-knp-dts-v4-3-1541bebeb89f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-knp-dts-v4-3-1541bebeb89f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Yh2wl5uFTdM9F8RH8JpBolTi8LNhq0Qq
X-Proofpoint-GUID: Yh2wl5uFTdM9F8RH8JpBolTi8LNhq0Qq
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=69406198 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8NlrwkMwniVS5tDy--IA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE2OSBTYWx0ZWRfX7yVl2WPNvHKB
 EZl31yVgar/XAS6R+AXCKLxBcuN26ZQ0tk0jfpcPabq5wTPlQsQ3yShWdtAHlCnEn9ejkVJsCaB
 te85WTvf4gCindzg2ZOrRykrcoOuGcWgAOf44mi1wS+Tu13M5s1INpBUjED013fz4QhgCTWwfyy
 0w6yUjC+yMqVWJ6bYIYOD8Qp3/a/csk9/mp9Vd3HtA6/Ab9Aa0OCelOyZ3WJqwCXIYCmr5MpITT
 B/Q9XNi8v38W/5s3v9a+naKOcHuVWSugOo8EicJsqr4/fuyNUFXYCgu69e+iRlHTufp13tblu3E
 FUJWrgXAlnLt3JesGbtbEalmFo1Uos4CJyIuPQMdeshyPpdApKHMS7+m1af7ncb2pG6A53NVfQS
 BknyjR9j7q3Xv9x7YILkRhM8RIYYFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150169

On Mon, Dec 15, 2025 at 01:07:23AM -0800, Jingyi Wang wrote:
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
