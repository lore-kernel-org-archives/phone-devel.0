Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810EC311C09
	for <phone-devel@vger.kernel.org>; Fri,  9 Jan 2026 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975044; cv=none; b=Vl2bR8Mh26TiUF2UpcdhSkMjmuzqWO71y/3SEuiUkkJ3+44ueqOvhiMgSPKLccP/5TfDDtSOF0xbrNcg+dPRYs5Xhy37hYjY6ZHCLhZ/QmBNOXUQJq0o0ge0hdlj0/R0p6xHNcM7TpTZDlaDHWGfsYidjxzAhsRM7PJkTAEOfMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975044; c=relaxed/simple;
	bh=K9jIVk5hPGZyX3cTg0MHEsQ+Si3ZWLvbvbDjvcvpmCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfFMVbMYMQF+F7uZmRn+gPCeyxsTr76bUWAGnyC0JOf2aeZM7Judg/BfWIdPhqFW5sdKd362P/YuncKRj6AvApZNJXDjiVM6wWrqAC+pnmb9B9NjDNeu+kx0TjrRfEiv4hRrfqwRD7TNzM9ODW59MlDMnNihzV2duJ+Q12t5+VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmA0dHcs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KX8raMhw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmA0dHcs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KX8raMhw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098aFuL3629109
	for <phone-devel@vger.kernel.org>; Fri, 9 Jan 2026 16:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yca/vQMLApc7UBB1gxG+MXDQ
	oy0CcBdP2sxvTPO032w=; b=CmA0dHcsBfoSbGFIKE6mNU2J1RGzsqB/L84mp7+e
	6rlJ9OtfMh7/AeBIC6ccqQ/Uhtj7NVB4oVdMX1jbgnzff71h2hvYfANwsqlVPd4N
	ElpOQJglJVjjLCVbP0tAjkWBe4tiv2Yw4QATMnwhym8zg4v4w8O1N80l6HqnZ6l6
	61oZcy4BvbOTHaLPq/H7heb5fwDQGzx4EwNLl7Swi8WlMjDx25pcrquaK18YxMSp
	KPilsLdnI1NDHr5c1n3ERg07xUAz6gYHG1UgwTUE5MmdCjrqg+ztvCl3wdgbQHfp
	NlkNNH0BfxxAiJyqShh5dneP9YecwDvAf6OcwJeidBrMiw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j38mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 09 Jan 2026 16:10:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22d590227so544604385a.1
        for <phone-devel@vger.kernel.org>; Fri, 09 Jan 2026 08:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767975040; x=1768579840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yca/vQMLApc7UBB1gxG+MXDQoy0CcBdP2sxvTPO032w=;
        b=KX8raMhwQ3BXe13q/YJBsxq7lvyUAVwiDEPziPhJoFlEtF24Rsw6Es5blvRJlePZXS
         Qn3HpVffP/5Eqv7K+q2jHwghrDo9HF3SIGdutpdApy5fDncPa7qgC/x8u0mxxlWwBYFX
         u2hc6biLdmks51yqlSAHHzhZXFdyD2joUgSd1AbX+FTNWWnRlydJp++yPDpULD9Pa+fH
         01Hq8BAqfR3lqG/iIIb+CY8MmyJK6ZcBfH3lUxpckKZ7uIIND42a/luUb6e5i/tBqAHp
         ph7I8/LVvy6mq5FRafR4GREtAuy9DMvnv5SxNAQVZnuwp42ESUIOXlemE2fjEtUpfjUH
         V6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767975040; x=1768579840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yca/vQMLApc7UBB1gxG+MXDQoy0CcBdP2sxvTPO032w=;
        b=u6OleW79Ez/Q7dK0EUq2kBQ+PxKwEMevkvnVIkcqg1EvEc/s0EoD8cKuEAf9GJ5Ph+
         C1OjDjtKr32COdc5H2w/dPAkfCeiTeZ4T+CFIbVp1O1BjB2rZbVuh793lstf3+i0PVeh
         3HUmg+YqEJTSNDBVFx/t5wdi66S3WPory0G4PQNKty066Vo5YQz+6qGXOPDBp1IEptEm
         tAvL+Ct/EBPaciwVv29Mrq6nZ6YsZ2ewTAbIEaF3VK3q6auyFgAiR10BT7khQvPHotI0
         XLh2H9YMGYYYQDfXdO1GFM6DW0dyZ0eDaNruZ4dbsTMqlYDBeGcc5TJ4mgJgJz1OZgVC
         UkPw==
X-Forwarded-Encrypted: i=1; AJvYcCXdvxuh/Zp6yppEo6xJCVu/szwE5r0YdCOERWuEkjasuwFh5eDCrNC5SgcVeTxUi/Wm2+4y2+5ofoQXoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqSwGqx2c841/UUCkymI/hb3v9sDEpI5KAMO30Zbs5COstdSqL
	9lMWCXDxGHG2h/VyGfr9DEfpPZj/gT0ylpqFmm2eWXtP3TMVXRXInhS4XZuYVPUkECj+2AMU+xD
	D+twSJScWAlqBXgQzujJ39VK9/x/NiGnUO5CZwbhjVrzSI/TGrTZ04XE+3VwGyZRf6T0VdZsCeA
	==
X-Gm-Gg: AY/fxX7YQwZKVSsMswlqAAFDLZA92sVoE1ASq3m/r3reRM22HjtQhbvpeuuIQByH5rL
	gPX9IQgUCGqVNUtOuozlxsHFthIf0xDLN90hiA9/EFKM7Owq0YpyzJmaTYw+jCot1xv0kRTDkyd
	St+MCR2l5yWXOa93cDOcZQZiwTnpuEBSjJD7hgqgrg/gDsGHn0PCbX2nXrRfrJXl2UbaejMcYRq
	SpzdquThmLhFhq/R6qisbplMMb++AWP1wKjZM8AW5J4lP23T0JjfePgD2ASHCryriLPkLs48nqd
	OzZby9iLpjYv7AcrbUnuSgebt0I44FL1CuVCIwHhxCoka9PqiNd1zQrj0/++1vE3tHIl3JlnlEh
	r4PGNEt6ZQxXe/qWzEJ2vveh9efa66Az1WNYqeAKb/KcT12NR4+xxD++uYk7ss/VFecVu63Q6EQ
	epcc7Dv3rjXWiPbYA9JgyyWuw=
X-Received: by 2002:a05:620a:1a11:b0:890:2e24:a543 with SMTP id af79cd13be357-8c38936ef1cmr1582286485a.34.1767975039743;
        Fri, 09 Jan 2026 08:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHMFxcflXBNZmqofofpSclnJ5pvuO+RG1tCLqi7VkOlph+mRxcuBEQpqJeR/piGDS4jViCyw==
X-Received: by 2002:a05:620a:1a11:b0:890:2e24:a543 with SMTP id af79cd13be357-8c38936ef1cmr1582276485a.34.1767975039024;
        Fri, 09 Jan 2026 08:10:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8a961fsm23870791fa.32.2026.01.09.08.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:10:38 -0800 (PST)
Date: Fri, 9 Jan 2026 18:10:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bhushan Shah <bhushan.shah@machinesoul.in>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        Alexandre Ferrieux <alexandre.ferrieux@orange.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Add missing clock votes for
 lpass_tlmm
Message-ID: <2ufe5sumir2c3uhlte5i4kuocylqpmota4lein5a6wlfzuv4as@25vqu77is7cn>
References: <20260109-kodiak-lpass-tlmm-clocks-v1-1-746112687772@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-kodiak-lpass-tlmm-clocks-v1-1-746112687772@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyMSBTYWx0ZWRfX5SvkEjqXj1Ri
 +5ywHt/983lnEtnbBk0NJ/eoY4+fKBuYvvnRaZNqodF/AkNGMj/WIWO07v7en/SpMsdEPeyCcm/
 VQ+NyqD+s8fJRK4zX0kl5cmJKEkXkD2leNYzbvvIjQg1xa2rHLwTvmtiimUb4DMEWgvsQRvbyj2
 xJw+kEGoL3iMUTzuIXm59MmGG0QlfxxNPQk7NK9g+2ZZbQJ7G5ED/64WtrAKiNl7XZ4G+XCni8T
 kz4o2dqBzRrIaEQUxBx1sSZ8pPsD89h7Dd0bPH3CQcd3OGw5KsCTmpaIAsInGaGVsRLAeRzcNm0
 vuUirYX5fqRGw4gsFU2SVT/nNqdG7GEcPIbUj3kZ4P+FABW9VzTgdJAW6ayXMg58BsTeqCNsahZ
 tEELunD/EtfaiX9CCbRzCmuhkY+lUqBpAsci2ypSrvo/PnaHYbNn7cgelfn0wF0MKhHqCvfTHmc
 PvWxFpx7K+tprkrsaKA==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=69612881 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=5e51Dg7s2y2aPRzMTa4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: ZzkLgesDZ2CUZF9H6tXLKrTAR6qK2_H8
X-Proofpoint-ORIG-GUID: ZzkLgesDZ2CUZF9H6tXLKrTAR6qK2_H8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090121

On Fri, Jan 09, 2026 at 04:14:34PM +0100, Luca Weiss wrote:
> Without the correct clock votes set, we may be hitting a synchronous
> external abort error when touching the lpi registers.
> 
>   Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
>   <...>
>   Call trace:
>    lpi_gpio_read.isra.0+0x2c/0x58 (P)
>    pinmux_enable_setting+0x218/0x300
>    pinctrl_commit_state+0xb0/0x280
>    pinctrl_select_state+0x28/0x48
>    pinctrl_bind_pins+0x1f4/0x2a0
>    really_probe+0x64/0x3a8
> 
> Add the clocks to fix that.
> 
> Platforms with this SoC using AudioReach won't be impacted due to
> qcs6490-audioreach.dtsi already setting clocks & clock-names for
> q6prmcc. The sc7280-chrome-common.dtsi has also been adjusted to keep
> the behavior the same as they also do not use Elite with q6afecc.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> This issue is somewhat of a race condition, with some kernel configs it
> cannot (easily) be triggered, with others relatively reliably but it
> seems also to be somewhat related to cold boot.
> 
> Also I can't pinpoint a good Fixes tag, lpass_tlmm was introduced before
> q6afecc got added for this SoC, and that worked fine for those boards it
> seems. It's just needed on boards with Elite audio architecture.

Yeah... If those clocks are not necessary for Chrome, then I'd pick up
the q6afecc introduction as a Fixes tag.

> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi               | 5 +++++
>  arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 5 +++++
>  2 files changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
