Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF3C3A7820
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 08:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079832; cv=none; b=owrWobaAPsIA9P2EV25xNYE/CDA/skQQuIgCbj1X83fb8IABCOguada5GrkJry6icmkiGqwQnqhLAyAReAtq91CA/QwHqj2oYlie9VAk1yk6J5cQsggZTT+FckiaoTWHIKJdWXj9DGFrqdaBHkp8jvQHaiOObH4niNV3Pi4/Rgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079832; c=relaxed/simple;
	bh=LkbvRb4Lxa3vbTQK4ekpMqZOPYOFQsKDqFtDgQKLURE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p72KLp/JOAH4NByObIHvsRigM/QIJGRv5rSvNkiolnZZzNyYzFXsXNhsDgNUQLikKtnpO+YJKJxO0vvutMAesJ42c4PRjDyC/UKaIWQSC2XA3rg+uE2mBrfIyVbY1t32Othd93K8vfB7j6jVKa4wPJA6s1lQm3Jpo3BqnYg1UQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqlLSJzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTzE0cub; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqlLSJzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTzE0cub"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i18G531595
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 08:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYDOedvWLAS4SJUQqvQ16zubYkeixi+iRS6jV/d0I28=; b=VqlLSJzmzF154OeE
	/ENKpohDDVjlds1p8RGt1KYNdofHNz0k3ITjDIuHXfoADtRtk/BTFjpX52pi46t5
	4+0pZSXnYvDSmu/B+yBzS09TUaaITZMI5Cn8OUogt8O8b989qoS6hnoK8PXu07Wg
	RQD6Bk2fBnPFFsrWHB5k4MVwLGsonMcAxgirU5iR55JZKYx7EHa4+elIXQhhLTLM
	aCDZkJkUKoZGSrY9eHM9ra0ybCNEQR0p1lCGzANde4kYU9NXVwXjR+wAZBY35OtC
	0MWizSaNVj4c/5AyQc0hIGCujft+j0XvSw8siViBMpuM2/1gENKFTh9X1gp2EMT9
	aRjQgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1gtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 08:23:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9159c4b210aso1236811285a.1
        for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 01:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079829; x=1781684629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JYDOedvWLAS4SJUQqvQ16zubYkeixi+iRS6jV/d0I28=;
        b=cTzE0cubNkaAwmeTYxMpEkQs8KU9Jd0dxXqiQ1xjnhJGA4d09RGWcKuZ0HsL2pMmEt
         qbCEqJozulR3zVnuBiXPy30J2TO0TqcURuLzqIjzix+geo8+eT6TzWowW+fKlgGZq4xB
         jKHhAQzo8OcaRYQtt6tQM53M7KXvcE9CvG/8nGQzXu9hZRVDpK9GdQxPmtzWTeUS49II
         km3XdUQeq+NON59/EQ2KeOFkkP/zXaMVsJMMzSUIK+JLX/MU2dq3IRmqLwe5he4+gpfM
         HwolHHxsdwH2UYM6SalY1R2iLl35Fr2fA2JyiA9bP26D8Q7XaXTdF5PZNCLKqub53PMm
         uhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079829; x=1781684629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYDOedvWLAS4SJUQqvQ16zubYkeixi+iRS6jV/d0I28=;
        b=BfFSAoclXnepIIXo4OkXKzPD/3XXScOuKVadGD3Wk4at//0KhK/MiDNvq+JSVynWst
         /YIvHRaeXe7gI6S5P0vYJ2/u725eVeLjNvcI+CgF7AKcw1U8grqka9alSnBTcfK22wo7
         RoArs1g4G4djtuRyKJWQk1weHJZmMMc0jBn6nBmnPd+zkPa8pKgFPeqIdJ0/q/gXFDjD
         Ihr6JM228k70UqU5EZZWzKZEvhQ2BEtrL7Na6Zf2HB4dbYpY/5xBC61I3r8VS8+293Tn
         4QSCO7FJi3vYtws6q5g9ALoHvUHLDP7cJswpC8nKsN5pyO7LSTcE28mjk7mzJ+W8IPZk
         7kLw==
X-Forwarded-Encrypted: i=1; AFNElJ9WRja16G0N+PRNA2/T6Bn2Z2aTzjRm1Kvam5WnAxWR471MK81l87LqalGUORiBH/nwPBQ+e+zSKWScog==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLoTVGnrOFLSndmyhKCTQkmDwnscCUs0asn84fPGBE+x6u26aE
	q5Kxsw9gPJVF3pDKGvHkDmZR8HnIH4nMor3SVZbBymgjSnVOIZkQ9Im/vHTNygFrhX3UyopUkTE
	0gO9SF9F12BczWoTtvteV8Jg0WL8uNpgSdFH9TGWIX3LSFnE3dsg90Ox34n7uGnzkPQ==
X-Gm-Gg: Acq92OG454MZk2QhWM0uFUNtPb4vZP742CjQCC8Z9+qMkLAZzTs2C28hVxk2vRKZCNf
	DP2J3/bkDRvX90KRWirdsmWOxLRykSlQKl+s3pl1UxhOuyd8xbnbhc+qwyBxiHDWReVkdmL4nqf
	DT6kGbyckcr2qh6tWOzqf4XRuaSuc4LOGnGEuBmJRPEk8sDxJ/eOPXBcht+9T/fM4gYs6SJoyRp
	DeWvrlVe+r52UoPpLDQ7Wf/gHR+IYfY16GxEUDbkK7BAx1dCuRh6a5ZVhXXCnTnbTMC+i3gbrLy
	iNLxejRPtzcQRmlmNB0dKoNQzX/dMMjiMMk2THroL2i62nSHbtYAeRqfseFntldyHuStqiO5lYJ
	NeUghGNxtyQFFi8R1Ye9HL6tagWzWhOsvCfFaRiPLi/F8dIaJrcGb4xa29c3k85LF3w1+HrWY6K
	czB//cDBbECcr62Bt0/9Q=
X-Received: by 2002:a05:620a:4407:b0:915:4217:bf0b with SMTP id af79cd13be357-915ad11ecdcmr2818560885a.19.1781079828946;
        Wed, 10 Jun 2026 01:23:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4407:b0:915:4217:bf0b with SMTP id af79cd13be357-915ad11ecdcmr2818557985a.19.1781079828545;
        Wed, 10 Jun 2026 01:23:48 -0700 (PDT)
Received: from [10.111.165.13] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a2465e7sm2407977585a.19.2026.06.10.01.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:23:47 -0700 (PDT)
Message-ID: <b4599747-7eaa-4ccb-8144-fabfa4c96593@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:23:40 +0800
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
        Cory Keitz <ckeitz@amazon.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
 <20260605-qcom-cphy-v7-7-426c37e9008f@ixit.cz>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260605-qcom-cphy-v7-7-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfX1T5PssXzVCiu
 KUTr90h6TXyABzKTSOY26MNO6TL4fWUQfsABzUcVN4ziWbpjUhxLd+5IZUZrD3JvTzJHvNv3/to
 hlcknKhoptospuYYyAu1kQOD81l1/PS6ToAl4wNjo8Zp5BCB3NlAhWC7vkBuQAaINc7GPDJB7zF
 9Edgp3/vbNgE07S0gj+e1UrNwqtoF+ebv998b2nTFgnP0x4ufsdPA6M2xVPvtRF9sS0o5XOCMO7
 bwfOBk3hZP3087APwz/RfzaTenEH50lFae0CYg9etT4D3tXQvg/hbBV8Tr/1ahASY4rqhKq/D4K
 Vzk4gX7FP152HqNLpY6hrs47hG56SzPVWRcC6oWFfzK0IZESnVpSfdLviNnU23d3Rqlf24zUPh+
 zgDclHS+5tRSPK7ImZBFe+s1QWejwyDLTl0u22o5jV/gKj+lutfIYKrwDL1g7VNxbr4AG3UZRiH
 eikw48pNv52XjOiL5Qw==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a291f15 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=vggBfdFIAAAA:8 a=KKAkSRfTAAAA:8
 a=pCfSTlZN1A5Xfdvpc7kA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oSSdXDFI9KBhVRs_lGn49P4JaPeivhmd
X-Proofpoint-GUID: oSSdXDFI9KBhVRs_lGn49P4JaPeivhmd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100078



On 6/5/2026 9:14 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Ensure that the link frequency divider correctly accounts for C-PHY
> operation. The divider differs between D-PHY and C-PHY, as described
> in the MIPI CSI-2 specification.
> 
> For more details, see:
> https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Tested-by: Cory Keitz <ckeitz@amazon.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Link: https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c   |  7 +++++--
>   drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++----
>   drivers/media/platform/qcom/camss/camss.c        | 18 +++++++++++++++---
>   drivers/media/platform/qcom/camss/camss.h        |  2 +-
>   4 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index bcc34ac9dd212..7415e811082da 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -534,25 +534,28 @@ const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info
>   
>   /*
>    * csid_set_clock_rates - Calculate and set clock rates on CSID module
>    * @csiphy: CSID device
>    */
>   static int csid_set_clock_rates(struct csid_device *csid)
>   {
>   	struct device *dev = csid->camss->dev;
> +	struct csiphy_device *csiphy = &csid->camss->csiphy[csid->phy.csiphy_id];

The PHY indices are not necessarily contiguous on some platforms, such 
as Hamoa or Purwa.

For example, on Hamoa, we have csiphy0, csiphy1, csiphy2, and csiphy4. 
Using csiphy->id directly would lead to an array out-of-bounds access.

Thanks,
Wenmeng
> +	struct csiphy_lanes_cfg *lane_cfg = &csiphy->cfg.csi2->lane_cfg;
>   	const struct csid_format_info *fmt;
> +
>   	s64 link_freq;
>   	int i, j;
>   	int ret;
>   

